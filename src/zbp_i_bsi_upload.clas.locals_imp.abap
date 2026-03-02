CLASS lhc_upload DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF gc_status,
        pending TYPE c LENGTH 1 VALUE 'P',
        success TYPE c LENGTH 1 VALUE 'S',
        error   TYPE c LENGTH 1 VALUE 'E',
      END OF gc_status.

    CONSTANTS:
      BEGIN OF gc_criticality,
        neutral  TYPE int1 VALUE 0,
        negative TYPE int1 VALUE 1,
        positive TYPE int1 VALUE 3,
      END OF gc_criticality.

    CONSTANTS:
      gc_comm_scenario TYPE if_com_management=>ty_cscn_id VALUE 'Z_BSI_SUPLRINVC',
      gc_outbound_svc  TYPE if_com_management=>ty_cscn_outb_srv_id VALUE 'Z_BSI_SUPLRINVC_REST'.

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

    "! Build the JSON payload for the Supplier Invoice API
    METHODS build_invoice_payload
      IMPORTING
        is_upload       TYPE STRUCTURE FOR READ RESULT zi_bsi_upload\\Upload
      RETURNING
        VALUE(rv_json)  TYPE string.

    "! Parse the API response JSON and extract invoice data
    METHODS parse_api_response
      IMPORTING
        iv_response     TYPE string
        iv_http_status  TYPE i
      EXPORTING
        ev_status       TYPE c
        ev_message      TYPE string
        ev_invoice_no   TYPE c
        ev_fiscal_year  TYPE c.

    "! Convert ABAP date to OData V2 epoch format: /Date(<epoch_ms>)/
    METHODS convert_date_to_odata
      IMPORTING
        iv_date            TYPE d
      RETURNING
        VALUE(rv_odata_dt) TYPE string.

    "! Execute the HTTP call to the Supplier Invoice API
    METHODS execute_api_call
      IMPORTING
        iv_payload      TYPE string
      EXPORTING
        ev_status       TYPE c
        ev_message      TYPE string
        ev_invoice_no   TYPE c
        ev_fiscal_year  TYPE c.

ENDCLASS.

CLASS lhc_upload IMPLEMENTATION.

  METHOD get_global_authorizations.
    " Allow all operations — fine-grained auth controlled via DCL
    result = VALUE #( ( %create = if_abap_behv=>auth-allowed
                        %update = if_abap_behv=>auth-allowed
                        %delete = if_abap_behv=>auth-allowed ) ).
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
          WHEN ls_upload-Status = gc_status-pending
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
            Status            = gc_status-pending
            StatusCriticality = gc_criticality-neutral ) )
      REPORTED DATA(lt_reported).
  ENDMETHOD.


  METHOD validateMandatoryFields.
    READ ENTITIES OF zi_bsi_upload IN LOCAL MODE
      ENTITY Upload
        FIELDS ( CompanyCode DocumentDate PostingDate GrossAmount
                 Currency PurchaseOrder PoItem TaxCode )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_uploads).

    " -------------------------------------------------------------------
    " Tabela de configuração para validação genérica de campos obrigatórios
    " Evita duplicação de N blocos IF idênticos
    " -------------------------------------------------------------------
    TYPES: BEGIN OF ty_mandatory_check,
             fieldname TYPE string,
             message   TYPE string,
           END OF ty_mandatory_check.

    DATA(lt_checks) = VALUE STANDARD TABLE OF ty_mandatory_check(
      ( fieldname = 'COMPANYCODE'    message = 'Empresa é obrigatória' )
      ( fieldname = 'DOCUMENTDATE'   message = 'Data da fatura é obrigatória' )
      ( fieldname = 'POSTINGDATE'    message = 'Data de lançamento é obrigatória' )
      ( fieldname = 'GROSSAMOUNT'    message = 'Montante é obrigatório' )
      ( fieldname = 'CURRENCY'       message = 'Moeda é obrigatória' )
      ( fieldname = 'PURCHASEORDER'  message = 'Pedido de compras é obrigatório' )
      ( fieldname = 'POITEM'         message = 'Item do pedido é obrigatório' )
      ( fieldname = 'TAXCODE'        message = 'Código de imposto é obrigatório' )
    ).

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

    LOOP AT lt_uploads INTO DATA(ls_upload).
      " Skip already processed entries
      IF ls_upload-Status = gc_status-success.
        CONTINUE.
      ENDIF.

      CLEAR: lv_status, lv_message, lv_invoice_no, lv_fiscal_year.

      " Build payload and execute API call (separated concerns)
      DATA(lv_payload) = build_invoice_payload( ls_upload ).

      execute_api_call(
        EXPORTING iv_payload     = lv_payload
        IMPORTING ev_status      = lv_status
                  ev_message     = lv_message
                  ev_invoice_no  = lv_invoice_no
                  ev_fiscal_year = lv_fiscal_year ).

      " Truncate message to table field length
      DATA(lv_msg_text) = COND string(
        WHEN strlen( lv_message ) > 255
        THEN substring( val = lv_message len = 255 )
        ELSE lv_message ).

      DATA(lv_criticality) = COND int1(
        WHEN lv_status = gc_status-success THEN gc_criticality-positive
        WHEN lv_status = gc_status-error   THEN gc_criticality-negative
        ELSE gc_criticality-neutral ).

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

    " Return updated entities
    READ ENTITIES OF zi_bsi_upload IN LOCAL MODE
      ENTITY Upload
        ALL FIELDS
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_result).

    result = VALUE #( FOR ls_res IN lt_result
      ( %tky   = ls_res-%tky
        %param = ls_res ) ).
  ENDMETHOD.


  METHOD convert_date_to_odata.
    " Convert ABAP date to OData V2 epoch format: /Date(<epoch_ms>)/
    DATA(lv_utclong) = CONV utclong( |{ iv_date }T000000| ).
    DATA(lv_tstmp)   = cl_abap_tstmp=>utclong2tstmp( utclong = lv_utclong ).
    DATA(lv_epoch_ms) = CONV int8( lv_tstmp ) * 1000.
    rv_odata_dt = |/Date({ lv_epoch_ms })/|.
  ENDMETHOD.


  METHOD build_invoice_payload.
    " -------------------------------------------------------------------
    " Build structured JSON payload for Supplier Invoice API
    " Each section is constructed separately for clarity and maintainability
    " -------------------------------------------------------------------
    DATA(lv_doc_date)  = convert_date_to_odata( CONV d( is_upload-DocumentDate ) ).
    DATA(lv_post_date) = convert_date_to_odata( CONV d( is_upload-PostingDate ) ).

    " Item PO reference
    DATA(lv_item_json) = |\{|
      && |"SupplierInvoiceItem":"0001",|
      && |"PurchaseOrder":"{ is_upload-PurchaseOrder }",|
      && |"PurchaseOrderItem":"{ is_upload-PoItem }",|
      && |"TaxCode":"{ is_upload-TaxCode }",|
      && |"SupplierInvoiceItemAmount":"{ is_upload-GrossAmount }"|
      && |\}|.

    " NF Document (Brazil-specific, optional)
    DATA(lv_nf_json) = ||.
    IF is_upload-NfCategory IS NOT INITIAL.
      lv_nf_json = |,"to_BR_SupplierInvoiceNFDocument":\{|
        && |"BR_NFType":"{ is_upload-NfCategory }"|
        && |\}|.
    ENDIF.

    " Selected Purchase Orders
    DATA(lv_sel_po_json) = |,"to_SelectedPurchaseOrders":\{|
      && |"results":[\{|
      && |"PurchaseOrder":"{ is_upload-PurchaseOrder }",|
      && |"PurchaseOrderItem":"{ is_upload-PoItem }"|
      && |\}]|
      && |\}|.

    " Optional: Invoicing Party
    DATA(lv_invoicing_party) = ||.
    IF is_upload-InvoicingParty IS NOT INITIAL.
      lv_invoicing_party = |,"InvoicingParty":"{ is_upload-InvoicingParty }"|.
    ENDIF.

    " Optional: Reference
    DATA(lv_reference) = ||.
    IF is_upload-Reference IS NOT INITIAL.
      lv_reference = |,"SupplierInvoiceIDByInvcgParty":"{ is_upload-Reference }"|.
    ENDIF.

    " Assemble final payload
    rv_json = |\{|
      && |"CompanyCode":"{ is_upload-CompanyCode }",|
      && |"DocumentDate":"{ lv_doc_date }",|
      && |"PostingDate":"{ lv_post_date }",|
      && |"DocumentCurrency":"{ is_upload-Currency }",|
      && |"InvoiceGrossAmount":"{ is_upload-GrossAmount }"|
      && lv_invoicing_party
      && lv_reference
      && |,"to_SuplrInvcItemPurOrdRef":\{|
      && |"results":[{ lv_item_json }]|
      && |\}|
      && lv_sel_po_json
      && lv_nf_json
      && |\}|.
  ENDMETHOD.


  METHOD parse_api_response.
    " -------------------------------------------------------------------
    " Parse API response and extract key fields
    " -------------------------------------------------------------------
    IF iv_http_status >= 200 AND iv_http_status < 300.
      ev_status = gc_status-success.

      " Extract SupplierInvoice from response
      FIND REGEX '"SupplierInvoice"\s*:\s*"([^"]+)"' IN iv_response
        SUBMATCHES DATA(lv_inv_match).
      IF sy-subrc = 0.
        ev_invoice_no = lv_inv_match.
      ENDIF.

      " Extract FiscalYear from response
      FIND REGEX '"FiscalYear"\s*:\s*"([^"]+)"' IN iv_response
        SUBMATCHES DATA(lv_fy_match).
      IF sy-subrc = 0.
        ev_fiscal_year = lv_fy_match.
      ENDIF.

      ev_message = |Fatura { ev_invoice_no }/{ ev_fiscal_year } criada com sucesso|.
    ELSE.
      ev_status = gc_status-error.

      " Try to extract error message from OData error response
      FIND REGEX '"message"\s*:\s*\{[^}]*"value"\s*:\s*"([^"]+)"' IN iv_response
        SUBMATCHES DATA(lv_err_match).
      IF sy-subrc = 0.
        ev_message = lv_err_match.
      ELSE.
        ev_message = |HTTP { iv_http_status }: { iv_response }|.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD execute_api_call.
    " Default to error
    ev_status = gc_status-error.
    CLEAR: ev_message, ev_invoice_no, ev_fiscal_year.

    TRY.
        " 1) Resolve communication arrangement destination
        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
          comm_scenario  = gc_comm_scenario
          service_id     = gc_outbound_svc ).

        DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
        DATA(lo_request) = lo_http_client->get_http_request( ).

        " 2) Configure request
        lo_request->set_uri_path( '/sap/opu/odata/sap/API_SUPPLIERINVOICE_PROCESS_SRV/A_SupplierInvoice' ).
        lo_request->set_header_value( i_name = 'Content-Type' i_value = 'application/json' ).
        lo_request->set_header_value( i_name = 'Accept'       i_value = 'application/json' ).
        lo_request->set_header_value( i_name = 'x-csrf-token' i_value = 'fetch' ).

        " 3) Fetch CSRF token via GET
        DATA(lo_get_response) = lo_http_client->execute( if_web_http_client=>get ).
        DATA(lv_csrf_token) = lo_get_response->get_header_value( 'x-csrf-token' ).

        " 4) Execute POST with payload
        lo_request->set_header_value( i_name = 'x-csrf-token' i_value = lv_csrf_token ).
        lo_request->set_text( iv_payload ).

        DATA(lo_response)      = lo_http_client->execute( if_web_http_client=>post ).
        DATA(lv_http_status)   = lo_response->get_status( )-code.
        DATA(lv_response_body) = lo_response->get_text( ).

        lo_http_client->close( ).

        " 5) Parse response
        parse_api_response(
          EXPORTING iv_response    = lv_response_body
                    iv_http_status = lv_http_status
          IMPORTING ev_status      = ev_status
                    ev_message     = ev_message
                    ev_invoice_no  = ev_invoice_no
                    ev_fiscal_year = ev_fiscal_year ).

      CATCH cx_http_dest_provider_error INTO DATA(lx_dest).
        ev_message = |Erro destino: { lx_dest->get_text( ) }|.
      CATCH cx_web_http_client_error INTO DATA(lx_http).
        ev_message = |Erro HTTP: { lx_http->get_text( ) }|.
      CATCH cx_root INTO DATA(lx_root).
        ev_message = |Erro: { lx_root->get_text( ) }|.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
