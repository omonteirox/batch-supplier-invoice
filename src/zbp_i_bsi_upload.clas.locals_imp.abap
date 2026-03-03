CLASS lhc_upload DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.
    CONSTANTS gc_status_pending TYPE c LENGTH 1                             VALUE 'P'.
    CONSTANTS gc_status_success TYPE c LENGTH 1                             VALUE 'S'.
    CONSTANTS gc_status_error   TYPE c LENGTH 1                             VALUE 'E'.

    CONSTANTS gc_crit_neutral   TYPE int1                                   VALUE 0.
    CONSTANTS gc_crit_negative  TYPE int1                                   VALUE 1.
    CONSTANTS gc_crit_positive  TYPE int1                                   VALUE 3.

    CONSTANTS gc_comm_scenario  TYPE if_com_management=>ty_cscn_id          VALUE 'Z_BSI_SUPLRINVC'.
    CONSTANTS gc_outbound_svc   TYPE if_com_management=>ty_cscn_outb_srv_id VALUE 'Z_BSI_SUPLRINVC_REST'.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Upload RESULT result.

    METHODS get_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Upload RESULT result.

    METHODS setDefaults FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Upload~setDefaults.

    METHODS validateMandatoryFields FOR VALIDATE ON SAVE
      IMPORTING keys FOR Upload~validateMandatoryFields.

    METHODS validateAmounts FOR VALIDATE ON SAVE
      IMPORTING keys FOR Upload~validateAmounts.

    METHODS ExecuteBatch FOR MODIFY
      IMPORTING keys FOR ACTION Upload~ExecuteBatch RESULT result.

    "! Import entities from CSV file content (called by RAP static factory action)
    METHODS ImportFromFile FOR MODIFY
      IMPORTING keys FOR ACTION Upload~ImportFromFile.

    "! Parse date string in multiple formats (DD/MM/YYYY, DD.MM.YYYY, YYYY-MM-DD, YYYYMMDD)
    METHODS parse_csv_date
      IMPORTING iv_raw        TYPE string
      RETURNING VALUE(rv_date) TYPE d.

    "! Parse amount string handling Brazilian format (1.234,56 → 1234.56)
    METHODS parse_csv_amount
      IMPORTING iv_raw          TYPE string
      RETURNING VALUE(rv_amount) TYPE p LENGTH 16 DECIMALS 2.

    "! Execute a single invoice creation via OData V4 Client Proxy
    "!
    "! @parameter io_client_proxy | Proxy instance (reused across loop iterations)
    "! @parameter is_upload       | Upload entity data read from RAP
    "! @parameter ev_status       | S=Success, E=Error
    "! @parameter ev_message      | Human-readable result message
    "! @parameter ev_invoice_no   | Created Supplier Invoice number
    "! @parameter ev_fiscal_year  | Fiscal Year of created document
    METHODS execute_api_call
      IMPORTING io_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy
                is_upload       TYPE zi_bsi_upload
      EXPORTING ev_status       TYPE c
                ev_message      TYPE string
                ev_invoice_no   TYPE c LENGTH 10
                ev_fiscal_year  TYPE c LENGTH 4.

ENDCLASS.

CLASS lhc_upload IMPLEMENTATION.

  METHOD get_global_authorizations.
    " Allow all operations — fine-grained auth controlled via DCL
    result = VALUE #( %create = if_abap_behv=>auth-allowed
                      %update = if_abap_behv=>auth-allowed
                      %delete = if_abap_behv=>auth-allowed ).
  ENDMETHOD.


  METHOD get_features.
    READ ENTITIES OF zi_bsi_upload IN LOCAL MODE
      ENTITY Upload
        FIELDS ( Status )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_uploads)
      FAILED DATA(lt_failed).

    result = VALUE #( FOR ls_upload IN lt_uploads
      ( %tky = ls_upload-%tky
        %action-ExecuteBatch = COND #(
          WHEN ls_upload-Status = gc_status_pending
            OR ls_upload-Status IS INITIAL
          THEN if_abap_behv=>fc-o-enabled
          ELSE if_abap_behv=>fc-o-disabled ) ) ).
  ENDMETHOD.


  METHOD setDefaults.
    READ ENTITIES OF zi_bsi_upload IN LOCAL MODE
      ENTITY Upload
        FIELDS ( Status )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_uploads).

    MODIFY ENTITIES OF zi_bsi_upload IN LOCAL MODE
      ENTITY Upload
        UPDATE FIELDS ( Status StatusCriticality )
        WITH VALUE #( FOR ls_upload IN lt_uploads
          ( %tky              = ls_upload-%tky
            Status            = gc_status_pending
            StatusCriticality = gc_crit_neutral ) )
      REPORTED DATA(lt_reported).
  ENDMETHOD.


  METHOD validateMandatoryFields.
    READ ENTITIES OF zi_bsi_upload IN LOCAL MODE
      ENTITY Upload
        FIELDS ( CompanyCode DocumentDate PostingDate GrossAmount
                 Currency PurchaseOrder PoItem TaxCode )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_uploads).



    LOOP AT lt_uploads INTO DATA(ls_upload).

      IF ls_upload-CompanyCode IS INITIAL.
        APPEND VALUE #( %tky = ls_upload-%tky ) TO failed-upload.
        APPEND VALUE #( %tky = ls_upload-%tky
                        %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-error
                           text     = 'Empresa é obrigatória' )
                        %element-CompanyCode = if_abap_behv=>mk-on ) TO reported-upload.
      ENDIF.

      IF ls_upload-DocumentDate IS INITIAL.
        APPEND VALUE #( %tky = ls_upload-%tky ) TO failed-upload.
        APPEND VALUE #( %tky = ls_upload-%tky
                        %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-error
                           text     = 'Data da fatura é obrigatória' )
                        %element-DocumentDate = if_abap_behv=>mk-on ) TO reported-upload.
      ENDIF.

      IF ls_upload-PostingDate IS INITIAL.
        APPEND VALUE #( %tky = ls_upload-%tky ) TO failed-upload.
        APPEND VALUE #( %tky = ls_upload-%tky
                        %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-error
                           text     = 'Data de lançamento é obrigatória' )
                        %element-PostingDate = if_abap_behv=>mk-on ) TO reported-upload.
      ENDIF.

      IF ls_upload-GrossAmount IS INITIAL.
        APPEND VALUE #( %tky = ls_upload-%tky ) TO failed-upload.
        APPEND VALUE #( %tky = ls_upload-%tky
                        %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-error
                           text     = 'Montante é obrigatório' )
                        %element-GrossAmount = if_abap_behv=>mk-on ) TO reported-upload.
      ENDIF.

      IF ls_upload-Currency IS INITIAL.
        APPEND VALUE #( %tky = ls_upload-%tky ) TO failed-upload.
        APPEND VALUE #( %tky = ls_upload-%tky
                        %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-error
                           text     = 'Moeda é obrigatória' )
                        %element-Currency = if_abap_behv=>mk-on ) TO reported-upload.
      ENDIF.

      IF ls_upload-InvoicingParty IS INITIAL.
        APPEND VALUE #( %tky = ls_upload-%tky ) TO failed-upload.
        APPEND VALUE #( %tky = ls_upload-%tky
                        %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-error
                           text     = 'Fornecedor é obrigatório' )
                        %element-InvoicingParty = if_abap_behv=>mk-on ) TO reported-upload.
      ENDIF.

      IF ls_upload-PurchaseOrder IS INITIAL.
        APPEND VALUE #( %tky = ls_upload-%tky ) TO failed-upload.
        APPEND VALUE #( %tky = ls_upload-%tky
                        %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-error
                           text     = 'Pedido de compras é obrigatório' )
                        %element-PurchaseOrder = if_abap_behv=>mk-on ) TO reported-upload.
      ENDIF.

      IF ls_upload-PoItem IS INITIAL.
        APPEND VALUE #( %tky = ls_upload-%tky ) TO failed-upload.
        APPEND VALUE #( %tky = ls_upload-%tky
                        %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-error
                           text     = 'Item do pedido é obrigatório' )
                        %element-PoItem = if_abap_behv=>mk-on ) TO reported-upload.
      ENDIF.

      IF ls_upload-TaxCode IS INITIAL.
        APPEND VALUE #( %tky = ls_upload-%tky ) TO failed-upload.
        APPEND VALUE #( %tky = ls_upload-%tky
                        %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-error
                           text     = 'Código de imposto é obrigatório' )
                        %element-TaxCode = if_abap_behv=>mk-on ) TO reported-upload.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.


  METHOD validateAmounts.
    READ ENTITIES OF zi_bsi_upload IN LOCAL MODE
      ENTITY Upload
        FIELDS ( GrossAmount )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_uploads).

    LOOP AT lt_uploads INTO DATA(ls_upload).
      IF ls_upload-GrossAmount <= 0.
        APPEND VALUE #( %tky = ls_upload-%tky ) TO failed-upload.
        APPEND VALUE #( %tky = ls_upload-%tky
                        %msg = new_message_with_text(
                           severity = if_abap_behv_message=>severity-error
                           text     = 'Montante deve ser maior que zero' )
                        %element-GrossAmount = if_abap_behv=>mk-on ) TO reported-upload.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD ExecuteBatch.
    " Read only fields needed for API call — avoid ALL FIELDS for performance
    READ ENTITIES OF zi_bsi_upload IN LOCAL MODE
      ENTITY Upload
        FIELDS ( CompanyCode DocumentDate PostingDate Reference
                 InvoicingParty GrossAmount Currency PurchaseOrder
                 PoItem TaxCode NfCategory Status )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_uploads)
      FAILED DATA(lt_read_failed).

    DATA lt_update TYPE TABLE FOR UPDATE zi_bsi_upload\\Upload.

    DATA lv_status      TYPE c LENGTH 1.
    DATA lv_message     TYPE string.
    DATA lv_invoice_no  TYPE c LENGTH 10.
    DATA lv_fiscal_year TYPE c LENGTH 4.

    " ---------------------------------------------------------------
    " Instantiate Client Proxy ONCE outside the LOOP (avoids N+1 HTTP)
    " The proxy manages connection reuse and CSRF tokens internally
    " ---------------------------------------------------------------
    DATA lo_client_proxy TYPE REF TO /iwbep/if_cp_client_proxy.

    TRY.
        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
          comm_scenario  = gc_comm_scenario
          service_id     = gc_outbound_svc ).

        DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination(
          lo_destination ).

        lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v4_remote_proxy(
          EXPORTING
            is_proxy_model_key = VALUE #(
              repository_id       = 'DEFAULT'
              proxy_model_id      = 'ZCM_SUPPLIERINVOICE'
              proxy_model_version = '0001' )
            io_http_client             = lo_http_client
            iv_relative_service_root   = '/sap/opu/odata/sap/API_SUPPLIERINVOICE_PROCESS_SRV' ).

      CATCH cx_http_dest_provider_error
            cx_web_http_client_error INTO DATA(lx_init).
        " If proxy instantiation fails, mark ALL records as error and return
        LOOP AT lt_uploads INTO DATA(ls_err).
          IF ls_err-Status = gc_status_success.
            CONTINUE.
          ENDIF.
          APPEND VALUE #(
            %tky              = ls_err-%tky
            Status            = gc_status_error
            StatusCriticality = gc_crit_negative
            Message           = |Erro conexão: { lx_init->get_text( ) }|
            %control = VALUE #(
              Status            = if_abap_behv=>mk-on
              StatusCriticality = if_abap_behv=>mk-on
              Message           = if_abap_behv=>mk-on )
          ) TO lt_update.
        ENDLOOP.

        " Persist error results and return early
        MODIFY ENTITIES OF zi_bsi_upload IN LOCAL MODE
          ENTITY Upload
            UPDATE FROM lt_update
          REPORTED DATA(lt_err_reported).

        READ ENTITIES OF zi_bsi_upload IN LOCAL MODE
          ENTITY Upload
            FIELDS ( Status StatusCriticality Message SupplierInvoice FiscalYear )
            WITH CORRESPONDING #( keys )
          RESULT DATA(lt_err_result).

        result = VALUE #( FOR ls_r IN lt_err_result
          ( %tky   = ls_r-%tky
            %param = ls_r ) ).
        RETURN.
    ENDTRY.

    " ---------------------------------------------------------------
    " Process each upload record using the SHARED proxy instance
    " ---------------------------------------------------------------
    LOOP AT lt_uploads INTO DATA(ls_upload).
      " Skip already processed entries
      IF ls_upload-Status = gc_status_success.
        CONTINUE.
      ENDIF.

      CLEAR: lv_status, lv_message, lv_invoice_no, lv_fiscal_year.

      " Execute API call using the typed proxy (reuses connection)
      execute_api_call(
        EXPORTING io_client_proxy = lo_client_proxy
                  is_upload       = CORRESPONDING zi_bsi_upload( ls_upload )
        IMPORTING ev_status       = lv_status
                  ev_message      = lv_message
                  ev_invoice_no   = lv_invoice_no
                  ev_fiscal_year  = lv_fiscal_year ).

      " Truncate message to table field length
      DATA(lv_msg_text) = COND string(
        WHEN strlen( lv_message ) > 255
        THEN substring( val = lv_message len = 255 )
        ELSE lv_message ).

      DATA(lv_criticality) = COND int1(
        WHEN lv_status = gc_status_success THEN gc_crit_positive
        WHEN lv_status = gc_status_error   THEN gc_crit_negative
        ELSE gc_crit_neutral ).

      APPEND VALUE #(
        %tky              = ls_upload-%tky
        Status            = lv_status
        StatusCriticality = lv_criticality
        Message           = lv_msg_text
        SupplierInvoice   = lv_invoice_no
        FiscalYear        = lv_fiscal_year
        %control = VALUE #(
          Status            = if_abap_behv=>mk-on
          StatusCriticality = if_abap_behv=>mk-on
          Message           = if_abap_behv=>mk-on
          SupplierInvoice   = if_abap_behv=>mk-on
          FiscalYear        = if_abap_behv=>mk-on )
      ) TO lt_update.
    ENDLOOP.

    " Persist results
    MODIFY ENTITIES OF zi_bsi_upload IN LOCAL MODE
      ENTITY Upload
        UPDATE FROM lt_update
      REPORTED DATA(lt_reported).

    " Return updated entities — explicit field list instead of ALL FIELDS
    READ ENTITIES OF zi_bsi_upload IN LOCAL MODE
      ENTITY Upload
        FIELDS ( CompanyCode DocumentDate PostingDate Reference
                 InvoicingParty GrossAmount Currency PurchaseOrder
                 PoItem TaxCode NfCategory Status StatusCriticality
                 Message SupplierInvoice FiscalYear )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_result).

    result = VALUE #( FOR ls_res IN lt_result
      ( %tky   = ls_res-%tky
        %param = ls_res ) ).
  ENDMETHOD.


  METHOD execute_api_call.
    " -------------------------------------------------------------------
    " Execute a single Supplier Invoice creation via OData V4 Client Proxy
    " Uses typed structures from Service Consumption Model ZCM_SUPPLIERINVOICE
    " -------------------------------------------------------------------
    ev_status = gc_status_error.
    CLEAR: ev_message, ev_invoice_no, ev_fiscal_year.

    TRY.
        " 1) Create resource for the A_SupplierInvoice entity set
        DATA(lo_resource) = io_client_proxy->create_resource_for_entity_set(
          zcm_supplierinvoice=>gcs_entity_set-a_supplier_invoice ).

        DATA(lo_request) = lo_resource->create_request_for_create( ).

        " 2) Build payload using typed ABAP structure (type-safe, zero JSON)
        DATA(ls_invoice) = VALUE zcm_supplierinvoice=>tys_a_supplier_invoice_type(
          company_code               = is_upload-CompanyCode
          document_date              = is_upload-DocumentDate
          posting_date               = is_upload-PostingDate
          document_currency          = is_upload-Currency
          invoice_gross_amount       = is_upload-GrossAmount
          invoicing_party            = is_upload-InvoicingParty
          supplier_invoice_idby_invc = is_upload-Reference ).

        lo_request->set_business_data( ls_invoice ).

        " 3) Set deep insert for PO Reference Item
        DATA(lt_po_items) = VALUE zcm_supplierinvoice=>tyt_a_suplr_invc_item_pur_or_2(
          ( supplier_invoice_item      = '000001'
            purchase_order             = is_upload-PurchaseOrder
            purchase_order_item        = is_upload-PoItem
            tax_code                   = is_upload-TaxCode
            supplier_invoice_item_amou = is_upload-GrossAmount ) ).

        lo_request->set_deep_create(
          EXPORTING
            it_deep_create = VALUE #(
              ( iv_navigation_property_name =
                  zcm_supplierinvoice=>gcs_entity_type-a_supplier_invoice_type-navigation-to_suplr_invc_item_pur_ord
                it_data = REF #( lt_po_items ) ) ) ).

        " 4) Set deep insert for Selected Purchase Orders
        DATA(lt_sel_po) = VALUE zcm_supplierinvoice=>tyt_a_suplr_invc_seld_purg_d_2(
          ( purchase_order      = is_upload-PurchaseOrder
            purchase_order_item = is_upload-PoItem ) ).

        lo_request->set_deep_create(
          EXPORTING
            it_deep_create = VALUE #(
              ( iv_navigation_property_name =
                  zcm_supplierinvoice=>gcs_entity_type-a_supplier_invoice_type-navigation-to_selected_purchase_order
                it_data = REF #( lt_sel_po ) ) ) ).

        " 5) Set deep insert for BR NF Document (Brazil-specific, optional)
        IF is_upload-NfCategory IS NOT INITIAL.
          DATA(lt_nf_doc) = VALUE zcm_supplierinvoice=>tyt_a_br_supplier_invoice_nf_2(
            ( br_nftype = is_upload-NfCategory ) ).

          lo_request->set_deep_create(
            EXPORTING
              it_deep_create = VALUE #(
                ( iv_navigation_property_name =
                    zcm_supplierinvoice=>gcs_entity_type-a_supplier_invoice_type-navigation-to_br_supplier_invoice_nfd
                  it_data = REF #( lt_nf_doc ) ) ) ).
        ENDIF.

        " 6) Execute and read typed response
        DATA(lo_response) = lo_request->execute( ).

        DATA ls_result TYPE zcm_supplierinvoice=>tys_a_supplier_invoice_type.
        lo_response->get_business_data( IMPORTING es_business_data = ls_result ).

        ev_status      = gc_status_success.
        ev_invoice_no  = ls_result-supplier_invoice.
        ev_fiscal_year = ls_result-fiscal_year.
        ev_message     = |Fatura { ev_invoice_no }/{ ev_fiscal_year } criada com sucesso|.

      CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
        " OData proxy remote communication errors
        ev_message = |Erro Proxy: { lx_remote->get_text( ) }|.

      CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
        " OData gateway/business logic errors
        ev_message = |Erro Gateway: { lx_gateway->get_text( ) }|.
    ENDTRY.
  ENDMETHOD.


  METHOD ImportFromFile.
    " -------------------------------------------------------------------
    " Static Factory Action: Import CSV → Create Upload entities via EML
    " Moves ALL business logic (parsing, mapping, validation) to ABAP.
    " Frontend only reads the file and sends CSV text.
    " -------------------------------------------------------------------
    DATA(ls_param) = keys[ 1 ]-%param.
    DATA(lv_csv)     = ls_param-FileContent.
    DATA(lv_company) = ls_param-CompanyCode.

    " --- 1) Validate inputs -------------------------------------------------
    IF lv_csv IS INITIAL.
      APPEND VALUE #( %msg = new_message_with_text(
        severity = if_abap_behv_message=>severity-error
        text     = 'Conteúdo do arquivo está vazio' ) ) TO reported-upload.
      RETURN.
    ENDIF.
    IF lv_company IS INITIAL.
      APPEND VALUE #( %msg = new_message_with_text(
        severity = if_abap_behv_message=>severity-error
        text     = 'Empresa é obrigatória' ) ) TO reported-upload.
      RETURN.
    ENDIF.

    " --- 2) Normalize line endings (CRLF / CR → LF) ------------------------
    REPLACE ALL OCCURRENCES OF cl_abap_char_utilities=>cr_lf
      IN lv_csv WITH cl_abap_char_utilities=>newline.
    REPLACE ALL OCCURRENCES OF cl_abap_char_utilities=>cr
      IN lv_csv WITH cl_abap_char_utilities=>newline.

    SPLIT lv_csv AT cl_abap_char_utilities=>newline INTO TABLE DATA(lt_lines).
    DELETE lt_lines WHERE table_line IS INITIAL.

    IF lines( lt_lines ) < 2.
      APPEND VALUE #( %msg = new_message_with_text(
        severity = if_abap_behv_message=>severity-error
        text     = 'Arquivo precisa ter cabeçalho + pelo menos 1 linha de dados' ) ) TO reported-upload.
      RETURN.
    ENDIF.

    " --- 3) Parse header row & detect delimiter -----------------------------
    DATA(lv_header_line) = lt_lines[ 1 ].
    DELETE lt_lines INDEX 1.

    DATA(lv_delim) = COND string(
      WHEN find( val = lv_header_line sub = ';' ) >= 0 THEN `;`
      ELSE `,` ).

    SPLIT lv_header_line AT lv_delim INTO TABLE DATA(lt_headers).

    " Normalize headers: uppercase, trim, remove quotes
    LOOP AT lt_headers ASSIGNING FIELD-SYMBOL(<h>).
      REPLACE ALL OCCURRENCES OF '"' IN <h> WITH ``.
      <h> = to_upper( condense( <h> ) ).
    ENDLOOP.

    " --- 4) Map header positions (supports PT-BR and EN names) --------------
    DATA: lv_col_docdate   TYPE i VALUE 0,
          lv_col_postdate  TYPE i VALUE 0,
          lv_col_reference TYPE i VALUE 0,
          lv_col_supplier  TYPE i VALUE 0,
          lv_col_amount    TYPE i VALUE 0,
          lv_col_currency  TYPE i VALUE 0,
          lv_col_po        TYPE i VALUE 0,
          lv_col_poitem    TYPE i VALUE 0,
          lv_col_taxcode   TYPE i VALUE 0,
          lv_col_nfcat     TYPE i VALUE 0.

    LOOP AT lt_headers INTO DATA(lv_hdr).
      DATA(lv_idx) = sy-tabix.
      CASE lv_hdr.
        WHEN 'DATA_FATURA'      OR 'DOCUMENTDATE'.      lv_col_docdate  = lv_idx.
        WHEN 'DATA_LANCAMENTO'  OR 'POSTINGDATE'.       lv_col_postdate = lv_idx.
        WHEN 'REFERENCIA'       OR 'REFERENCE'.         lv_col_reference = lv_idx.
        WHEN 'FORNECEDOR'       OR 'INVOICINGPARTY'.    lv_col_supplier = lv_idx.
        WHEN 'MONTANTE'         OR 'GROSSAMOUNT'.       lv_col_amount   = lv_idx.
        WHEN 'MOEDA'            OR 'CURRENCY'.          lv_col_currency = lv_idx.
        WHEN 'PEDIDO'           OR 'PURCHASEORDER'.     lv_col_po       = lv_idx.
        WHEN 'ITEM_PEDIDO'      OR 'POITEM'.            lv_col_poitem   = lv_idx.
        WHEN 'CODIGO_IMPOSTO'   OR 'TAXCODE'.           lv_col_taxcode  = lv_idx.
        WHEN 'CATEGORIA_NF'     OR 'NFCATEGORY'.        lv_col_nfcat    = lv_idx.
      ENDCASE.
    ENDLOOP.

    " --- 5) Parse data rows → build CREATE table ----------------------------
    DATA lt_create TYPE TABLE FOR CREATE zi_bsi_upload\\Upload.
    DATA lv_cid TYPE i VALUE 0.

    LOOP AT lt_lines INTO DATA(lv_line).
      SPLIT lv_line AT lv_delim INTO TABLE DATA(lt_vals).

      " Strip quotes from each value
      LOOP AT lt_vals ASSIGNING FIELD-SYMBOL(<v>).
        REPLACE ALL OCCURRENCES OF '"' IN <v> WITH ``.
        <v> = condense( <v> ).
      ENDLOOP.

      " Helper macro to read value by column index (returns '' if missing)
      DATA(lv_docdate_raw)  = COND string( WHEN lv_col_docdate  > 0 THEN VALUE #( lt_vals[ lv_col_docdate ] OPTIONAL )  ELSE `` ).
      DATA(lv_postdate_raw) = COND string( WHEN lv_col_postdate > 0 THEN VALUE #( lt_vals[ lv_col_postdate ] OPTIONAL ) ELSE `` ).
      DATA(lv_reference)    = COND string( WHEN lv_col_reference > 0 THEN VALUE #( lt_vals[ lv_col_reference ] OPTIONAL ) ELSE `` ).
      DATA(lv_supplier)     = COND string( WHEN lv_col_supplier > 0 THEN VALUE #( lt_vals[ lv_col_supplier ] OPTIONAL ) ELSE `` ).
      DATA(lv_amount_raw)   = COND string( WHEN lv_col_amount  > 0 THEN VALUE #( lt_vals[ lv_col_amount ] OPTIONAL )  ELSE `0` ).
      DATA(lv_currency)     = COND string( WHEN lv_col_currency > 0 THEN VALUE #( lt_vals[ lv_col_currency ] OPTIONAL ) ELSE `BRL` ).
      DATA(lv_po)           = COND string( WHEN lv_col_po      > 0 THEN VALUE #( lt_vals[ lv_col_po ] OPTIONAL )      ELSE `` ).
      DATA(lv_poitem_raw)   = COND string( WHEN lv_col_poitem  > 0 THEN VALUE #( lt_vals[ lv_col_poitem ] OPTIONAL )  ELSE `` ).
      DATA(lv_taxcode)      = COND string( WHEN lv_col_taxcode > 0 THEN VALUE #( lt_vals[ lv_col_taxcode ] OPTIONAL ) ELSE `` ).
      DATA(lv_nfcat)        = COND string( WHEN lv_col_nfcat   > 0 THEN VALUE #( lt_vals[ lv_col_nfcat ] OPTIONAL )   ELSE `` ).

      " Parse typed values
      DATA(lv_docdate)  = parse_csv_date( lv_docdate_raw ).
      DATA(lv_postdate) = parse_csv_date( lv_postdate_raw ).
      DATA(lv_amount)   = parse_csv_amount( lv_amount_raw ).

      " Pad PO Item to 5 digits
      DATA(lv_poitem_clean) = condense( lv_poitem_raw ).
      REPLACE ALL OCCURRENCES OF REGEX '[^0-9]' IN lv_poitem_clean WITH ``.
      IF strlen( lv_poitem_clean ) > 0 AND strlen( lv_poitem_clean ) < 5.
        lv_poitem_clean = |{ lv_poitem_clean ALPHA = IN WIDTH = 5 }|.
      ENDIF.

      lv_cid += 1.

      APPEND VALUE #(
        %cid           = |CSV{ lv_cid }|
        CompanyCode    = lv_company
        DocumentDate   = lv_docdate
        PostingDate    = lv_postdate
        Reference      = lv_reference
        InvoicingParty = lv_supplier
        GrossAmount    = lv_amount
        Currency       = to_upper( lv_currency )
        PurchaseOrder  = lv_po
        PoItem         = lv_poitem_clean
        TaxCode        = to_upper( lv_taxcode )
        NfCategory     = lv_nfcat
        %control = VALUE #(
          CompanyCode    = if_abap_behv=>mk-on
          DocumentDate   = if_abap_behv=>mk-on
          PostingDate    = if_abap_behv=>mk-on
          Reference      = if_abap_behv=>mk-on
          InvoicingParty = if_abap_behv=>mk-on
          GrossAmount    = if_abap_behv=>mk-on
          Currency       = if_abap_behv=>mk-on
          PurchaseOrder  = if_abap_behv=>mk-on
          PoItem         = if_abap_behv=>mk-on
          TaxCode        = if_abap_behv=>mk-on
          NfCategory     = if_abap_behv=>mk-on )
      ) TO lt_create.
    ENDLOOP.

    " --- 6) Create all entities via EML -------------------------------------
    MODIFY ENTITIES OF zi_bsi_upload IN LOCAL MODE
      ENTITY Upload
        CREATE SET FIELDS WITH lt_create
      MAPPED mapped
      FAILED failed
      REPORTED reported.
  ENDMETHOD.


  METHOD parse_csv_date.
    " Parse date string supporting multiple formats:
    " DD/MM/YYYY, DD.MM.YYYY, DD-MM-YYYY, YYYY-MM-DD, YYYYMMDD
    DATA(lv_clean) = condense( iv_raw ).
    IF lv_clean IS INITIAL.
      CLEAR rv_date.
      RETURN.
    ENDIF.

    " Try YYYYMMDD (8 digits)
    IF strlen( lv_clean ) = 8 AND lv_clean CO '0123456789'.
      rv_date = lv_clean.
      RETURN.
    ENDIF.

    " Try YYYY-MM-DD
    IF strlen( lv_clean ) >= 10 AND lv_clean+4(1) = '-' AND lv_clean+7(1) = '-'.
      CONCATENATE lv_clean+0(4) lv_clean+5(2) lv_clean+8(2) INTO DATA(lv_iso).
      rv_date = lv_iso.
      RETURN.
    ENDIF.

    " Try DD/MM/YYYY or DD.MM.YYYY or DD-MM-YYYY
    SPLIT lv_clean AT '/' INTO TABLE DATA(lt_parts).
    IF lines( lt_parts ) <> 3.
      SPLIT lv_clean AT '.' INTO TABLE lt_parts.
    ENDIF.
    IF lines( lt_parts ) <> 3.
      SPLIT lv_clean AT '-' INTO TABLE lt_parts.
    ENDIF.

    IF lines( lt_parts ) = 3.
      DATA(lv_day)   = lt_parts[ 1 ].
      DATA(lv_month) = lt_parts[ 2 ].
      DATA(lv_year)  = lt_parts[ 3 ].
      IF strlen( lv_year ) = 2.
        lv_year = |20{ lv_year }|.
      ENDIF.
      CONCATENATE lv_year lv_month+0(2) lv_day+0(2) INTO DATA(lv_dmy).
      rv_date = lv_dmy.
      RETURN.
    ENDIF.

    " Fallback: try direct assignment
    rv_date = lv_clean.
  ENDMETHOD.


  METHOD parse_csv_amount.
    " Parse amount supporting Brazilian format: 1.234,56 → 1234.56
    DATA(lv_clean) = condense( iv_raw ).
    IF lv_clean IS INITIAL.
      rv_amount = 0.
      RETURN.
    ENDIF.

    " Remove thousand separators (dots) and convert comma → dot
    REPLACE ALL OCCURRENCES OF '.' IN lv_clean WITH ``.
    REPLACE ALL OCCURRENCES OF ',' IN lv_clean WITH '.'.
    CONDENSE lv_clean NO-GAPS.

    TRY.
        rv_amount = lv_clean.
      CATCH cx_sy_conversion_no_number.
        rv_amount = 0.
    ENDTRY.
  ENDMETHOD.


ENDCLASS.
