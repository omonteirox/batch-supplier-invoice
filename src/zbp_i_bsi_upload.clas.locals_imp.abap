CLASS lhc_upload DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    CONSTANTS:
      gc_status_pending TYPE c LENGTH 1 VALUE 'P',
      gc_status_success TYPE c LENGTH 1 VALUE 'S',
      gc_status_error   TYPE c LENGTH 1 VALUE 'E'.

    CONSTANTS:
      gc_comm_scenario TYPE if_com_management=>ty_cscn_id VALUE 'Z_BSI_SUPLRINVC',
      gc_outbound_svc  TYPE if_com_management=>ty_cscn_outbound_service_id VALUE 'Z_BSI_SUPLRINVC_REST'.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Upload RESULT result.

    METHODS setDefaults FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Upload~setDefaults.

    METHODS validateMandatoryFields FOR VALIDATE ON SAVE
      IMPORTING keys FOR Upload~validateMandatoryFields.

    METHODS validateAmounts FOR VALIDATE ON SAVE
      IMPORTING keys FOR Upload~validateAmounts.

    METHODS ExecuteBatch FOR MODIFY
      IMPORTING keys FOR ACTION Upload~ExecuteBatch RESULT result.

    METHODS get_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Upload RESULT result.

    METHODS call_supplier_invoice_api
      IMPORTING
        is_upload        TYPE zi_bsi_upload
      EXPORTING
        ev_status        TYPE c
        ev_message       TYPE string
        ev_invoice_no    TYPE c
        ev_fiscal_year   TYPE c.

ENDCLASS.

CLASS lhc_upload IMPLEMENTATION.

  METHOD get_global_authorizations.
    " Allow all operations - fine-grained auth via DCL
    result = VALUE #( ( %create      = if_abap_behv=>auth-allowed
                        %update      = if_abap_behv=>auth-allowed
                        %delete      = if_abap_behv=>auth-allowed
                        %action-ExecuteBatch = if_abap_behv=>auth-allowed ) ).
  ENDMETHOD.

  METHOD get_features.
    " ExecuteBatch enabled only for entries with status Pending
    READ ENTITIES OF zi_bsi_upload IN LOCAL MODE
      ENTITY Upload
        FIELDS ( Status )
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_uploads)
      FAILED DATA(lt_failed).

    result = VALUE #( FOR ls_upload IN lt_uploads
      ( %tky = ls_upload-%tky
        %action-ExecuteBatch = COND #(
          WHEN ls_upload-Status = gc_status_pending OR ls_upload-Status IS INITIAL
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
        UPDATE FIELDS ( Status )
        WITH VALUE #( FOR ls_upload IN lt_uploads
          ( %tky   = ls_upload-%tky
            Status = gc_status_pending ) )
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
    " Read all selected entities
    READ ENTITIES OF zi_bsi_upload IN LOCAL MODE
      ENTITY Upload
        ALL FIELDS
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_uploads)
      FAILED DATA(lt_read_failed).

    DATA lt_update TYPE TABLE FOR UPDATE zi_bsi_upload\\Upload.

    LOOP AT lt_uploads INTO DATA(ls_upload).
      " Skip already processed entries
      IF ls_upload-Status = gc_status_success.
        CONTINUE.
      ENDIF.

      DATA: lv_status      TYPE c LENGTH 1,
            lv_message     TYPE string,
            lv_invoice_no  TYPE c LENGTH 10,
            lv_fiscal_year TYPE c LENGTH 4.

      call_supplier_invoice_api(
        EXPORTING
          is_upload      = ls_upload
        IMPORTING
          ev_status      = lv_status
          ev_message     = lv_message
          ev_invoice_no  = lv_invoice_no
          ev_fiscal_year = lv_fiscal_year ).

      DATA(lv_msg_text) = COND string(
        WHEN strlen( lv_message ) > 255
        THEN substring( val = lv_message len = 255 )
        ELSE lv_message ).

      APPEND VALUE #(
        %tky            = ls_upload-%tky
        Status          = lv_status
        Message         = lv_msg_text
        SupplierInvoice = lv_invoice_no
        FiscalYear      = lv_fiscal_year
        %control = VALUE #(
          Status          = if_abap_behv=>mk-on
          Message         = if_abap_behv=>mk-on
          SupplierInvoice = if_abap_behv=>mk-on
          FiscalYear      = if_abap_behv=>mk-on )
      ) TO lt_update.
    ENDLOOP.

    " Persist the results
    MODIFY ENTITIES OF zi_bsi_upload IN LOCAL MODE
      ENTITY Upload
        UPDATE FROM lt_update
      REPORTED DATA(lt_reported).

    " Return result
    READ ENTITIES OF zi_bsi_upload IN LOCAL MODE
      ENTITY Upload
        ALL FIELDS
        WITH CORRESPONDING #( keys )
      RESULT DATA(lt_result).

    result = VALUE #( FOR ls_res IN lt_result
      ( %tky   = ls_res-%tky
        %param = ls_res ) ).
  ENDMETHOD.

  METHOD call_supplier_invoice_api.
    " Default to error
    ev_status = gc_status_error.
    CLEAR: ev_message, ev_invoice_no, ev_fiscal_year.

    TRY.
        " ---------------------------------------------------------------
        " 1) Get Communication Arrangement via Scenario + Outbound Service
        " ---------------------------------------------------------------
        DATA(lo_destination) = cl_http_destination_provider=>create_by_comm_arrangement(
          comm_scenario  = gc_comm_scenario
          service_id     = gc_outbound_svc ).

        DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

        DATA(lo_request) = lo_http_client->get_http_request( ).

        " -----------------------------------
        " 2) Build JSON payload
        " -----------------------------------
        " Date format for OData V2: /Date(<epoch_ms>)/
        DATA(lv_doc_date_epoch) = cl_abap_tstmp=>utclong_to_tstmp(
          utclong = CONV utclong( |{ is_upload-DocumentDate }T000000| ) ).
        DATA(lv_doc_date_ms) = CONV int8( lv_doc_date_epoch ) * 1000.

        DATA(lv_post_date_epoch) = cl_abap_tstmp=>utclong_to_tstmp(
          utclong = CONV utclong( |{ is_upload-PostingDate }T000000| ) ).
        DATA(lv_post_date_ms) = CONV int8( lv_post_date_epoch ) * 1000.

        DATA(lv_doc_date_str) = |/Date({ lv_doc_date_ms })/|.
        DATA(lv_post_date_str) = |/Date({ lv_post_date_ms })/|.

        " Build item PO reference
        DATA(lv_item_json) = |\{| &&
          |"SupplierInvoiceItem":"0001",| &&
          |"PurchaseOrder":"{ is_upload-PurchaseOrder }",| &&
          |"PurchaseOrderItem":"{ is_upload-PoItem }",| &&
          |"TaxCode":"{ is_upload-TaxCode }",| &&
          |"SupplierInvoiceItemAmount":"{ is_upload-GrossAmount }"| &&
          |\}|.

        " Build NF Document (if NfCategory filled)
        DATA(lv_nf_json) = ||.
        IF is_upload-NfCategory IS NOT INITIAL.
          lv_nf_json = |,"to_BR_SupplierInvoiceNFDocument":\{| &&
            |"BR_NFType":"{ is_upload-NfCategory }"| &&
            |\}|.
        ENDIF.

        " Build selected purchase orders
        DATA(lv_sel_po_json) = |,"to_SelectedPurchaseOrders":\{| &&
          |"results":[\{| &&
          |"PurchaseOrder":"{ is_upload-PurchaseOrder }",| &&
          |"PurchaseOrderItem":"{ is_upload-PoItem }"| &&
          |\}]| &&
          |\}|.

        " Build invoicing party section
        DATA(lv_invoicing_party) = ||.
        IF is_upload-InvoicingParty IS NOT INITIAL.
          lv_invoicing_party = |,"InvoicingParty":"{ is_upload-InvoicingParty }"|.
        ENDIF.

        " Build reference section
        DATA(lv_reference) = ||.
        IF is_upload-Reference IS NOT INITIAL.
          lv_reference = |,"SupplierInvoiceIDByInvcgParty":"{ is_upload-Reference }"|.
        ENDIF.

        DATA(lv_payload) = |\{| &&
          |"CompanyCode":"{ is_upload-CompanyCode }",| &&
          |"DocumentDate":"{ lv_doc_date_str }",| &&
          |"PostingDate":"{ lv_post_date_str }",| &&
          |"DocumentCurrency":"{ is_upload-Currency }",| &&
          |"InvoiceGrossAmount":"{ is_upload-GrossAmount }"| &&
          lv_invoicing_party &&
          lv_reference &&
          |,"to_SuplrInvcItemPurOrdRef":\{| &&
          |"results":[{ lv_item_json }]| &&
          |\}| &&
          lv_sel_po_json &&
          lv_nf_json &&
          |\}|.

        " -----------------------------------
        " 3) Configure and send request
        " -----------------------------------
        lo_request->set_uri_path( '/sap/opu/odata/sap/API_SUPPLIERINVOICE_PROCESS_SRV/A_SupplierInvoice' ).
        lo_request->set_header_value(
          i_name  = 'Content-Type'
          i_value = 'application/json' ).
        lo_request->set_header_value(
          i_name  = 'Accept'
          i_value = 'application/json' ).
        lo_request->set_header_value(
          i_name  = 'x-csrf-token'
          i_value = 'fetch' ).
        lo_request->set_text( lv_payload ).

        " First fetch CSRF token
        DATA(lo_get_response) = lo_http_client->execute( if_web_http_client=>get ).
        DATA(lv_csrf_token) = lo_get_response->get_header_value( 'x-csrf-token' ).

        " Reset request for POST
        lo_request->set_header_value(
          i_name  = 'x-csrf-token'
          i_value = lv_csrf_token ).
        lo_request->set_method( if_web_http_client=>post ).

        DATA(lo_response) = lo_http_client->execute( if_web_http_client=>post ).
        DATA(lv_http_status) = lo_response->get_status( )-code.
        DATA(lv_response_body) = lo_response->get_text( ).

        lo_http_client->close( ).

        " -----------------------------------
        " 4) Process response
        " -----------------------------------
        IF lv_http_status >= 200 AND lv_http_status < 300.
          ev_status = gc_status_success.

          " Extract SupplierInvoice and FiscalYear from response JSON
          " Simple parsing (production: use /ui2/cl_json or sxml)
          FIND REGEX '"SupplierInvoice"\s*:\s*"([^"]+)"' IN lv_response_body
            SUBMATCHES DATA(lv_inv_match).
          IF sy-subrc = 0.
            ev_invoice_no = lv_inv_match.
          ENDIF.

          FIND REGEX '"FiscalYear"\s*:\s*"([^"]+)"' IN lv_response_body
            SUBMATCHES DATA(lv_fy_match).
          IF sy-subrc = 0.
            ev_fiscal_year = lv_fy_match.
          ENDIF.

          ev_message = |Fatura { ev_invoice_no }/{ ev_fiscal_year } criada com sucesso|.
        ELSE.
          ev_status = gc_status_error.

          " Try to extract error message from response
          FIND REGEX '"message"\s*:\s*\{[^}]*"value"\s*:\s*"([^"]+)"' IN lv_response_body
            SUBMATCHES DATA(lv_err_match).
          IF sy-subrc = 0.
            ev_message = lv_err_match.
          ELSE.
            ev_message = |HTTP { lv_http_status }: { lv_response_body }|.
          ENDIF.
        ENDIF.

      CATCH cx_http_dest_provider_error INTO DATA(lx_dest).
        ev_message = |Erro destino: { lx_dest->get_text( ) }|.
      CATCH cx_web_http_client_error INTO DATA(lx_http).
        ev_message = |Erro HTTP: { lx_http->get_text( ) }|.
      CATCH cx_root INTO DATA(lx_root).
        ev_message = |Erro: { lx_root->get_text( ) }|.
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
