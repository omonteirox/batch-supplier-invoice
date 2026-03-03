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
                ev_invoice_no   TYPE c
                ev_fiscal_year  TYPE c.

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

      CATCH cx_http_dest_provider_error INTO DATA(lx_dest_init).
        " If proxy instantiation fails, mark ALL records as error and return
        LOOP AT lt_uploads INTO DATA(ls_err).
          IF ls_err-Status = gc_status_success.
            CONTINUE.
          ENDIF.
          APPEND VALUE #(
            %tky              = ls_err-%tky
            Status            = gc_status_error
            StatusCriticality = gc_crit_negative
            Message           = |Erro destino: { lx_dest_init->get_text( ) }|
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

      CATCH cx_web_http_client_error INTO DATA(lx_http_init).
        " Same early-return pattern for HTTP client errors
        LOOP AT lt_uploads INTO DATA(ls_err2).
          IF ls_err2-Status = gc_status_success.
            CONTINUE.
          ENDIF.
          APPEND VALUE #(
            %tky              = ls_err2-%tky
            Status            = gc_status_error
            StatusCriticality = gc_crit_negative
            Message           = |Erro HTTP: { lx_http_init->get_text( ) }|
            %control = VALUE #(
              Status            = if_abap_behv=>mk-on
              StatusCriticality = if_abap_behv=>mk-on
              Message           = if_abap_behv=>mk-on )
          ) TO lt_update.
        ENDLOOP.

        MODIFY ENTITIES OF zi_bsi_upload IN LOCAL MODE
          ENTITY Upload
            UPDATE FROM lt_update
          REPORTED DATA(lt_err_reported2).

        READ ENTITIES OF zi_bsi_upload IN LOCAL MODE
          ENTITY Upload
            FIELDS ( Status StatusCriticality Message SupplierInvoice FiscalYear )
            WITH CORRESPONDING #( keys )
          RESULT DATA(lt_err_result2).

        result = VALUE #( FOR ls_r2 IN lt_err_result2
          ( %tky   = ls_r2-%tky
            %param = ls_r2 ) ).
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

      CATCH cx_http_dest_provider_error INTO DATA(lx_dest).
        " Communication arrangement destination errors
        ev_message = |Erro destino: { lx_dest->get_text( ) }|.

      CATCH cx_web_http_client_error INTO DATA(lx_http).
        " HTTP client transport errors
        ev_message = |Erro HTTP: { lx_http->get_text( ) }|.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
