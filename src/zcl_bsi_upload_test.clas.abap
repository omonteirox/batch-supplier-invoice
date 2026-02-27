"! Unit tests for Batch Supplier Invoice Upload
"! @testing ZI_BSI_Upload
CLASS zcl_bsi_upload_test DEFINITION
  PUBLIC
  FINAL
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.

    CLASS-METHODS:
      class_setup,
      class_teardown.

    METHODS:
      setup,
      teardown.

    " Test Methods
    METHODS test_validate_mandatory_ok     FOR TESTING.
    METHODS test_validate_mandatory_fail   FOR TESTING.
    METHODS test_validate_amount_positive  FOR TESTING.
    METHODS test_validate_amount_negative  FOR TESTING.
    METHODS test_set_defaults              FOR TESTING.

ENDCLASS.

CLASS zcl_bsi_upload_test IMPLEMENTATION.

  METHOD class_setup.
    " No class-level setup needed - tests use EML directly
  ENDMETHOD.

  METHOD class_teardown.
    " No class-level teardown needed
  ENDMETHOD.

  METHOD setup.
    " Clean state
  ENDMETHOD.

  METHOD teardown.
    " Rollback any open entities
    ROLLBACK ENTITIES.
  ENDMETHOD.

  METHOD test_validate_mandatory_ok.
    " Given: A record with all mandatory fields filled
    MODIFY ENTITIES OF zi_bsi_upload
      ENTITY Upload
        CREATE FIELDS ( CompanyCode DocumentDate PostingDate
                        GrossAmount Currency PurchaseOrder PoItem TaxCode )
        WITH VALUE #( (
          %cid         = 'CID1'
          CompanyCode  = '1000'
          DocumentDate = '20260301'
          PostingDate  = '20260301'
          GrossAmount  = '1500.00'
          Currency     = 'BRL'
          PurchaseOrder = '4500000001'
          PoItem       = '00010'
          TaxCode      = 'B1' ) )
      MAPPED DATA(ls_mapped)
      FAILED DATA(ls_failed)
      REPORTED DATA(ls_reported).

    " Then: No failures expected from creation
    cl_abap_unit_assert=>assert_initial(
      act = ls_failed-upload
      msg = 'Creation with all mandatory fields should not fail' ).

    " Trigger validation via COMMIT
    COMMIT ENTITIES
      RESPONSE OF zi_bsi_upload
      FAILED DATA(ls_commit_failed)
      REPORTED DATA(ls_commit_reported).

    cl_abap_unit_assert=>assert_initial(
      act = ls_commit_failed-upload
      msg = 'Validation should pass when all mandatory fields are filled' ).
  ENDMETHOD.

  METHOD test_validate_mandatory_fail.
    " Given: A record missing CompanyCode (mandatory)
    MODIFY ENTITIES OF zi_bsi_upload
      ENTITY Upload
        CREATE FIELDS ( DocumentDate PostingDate
                        GrossAmount Currency PurchaseOrder PoItem TaxCode )
        WITH VALUE #( (
          %cid         = 'CID2'
          DocumentDate = '20260301'
          PostingDate  = '20260301'
          GrossAmount  = '1500.00'
          Currency     = 'BRL'
          PurchaseOrder = '4500000001'
          PoItem       = '00010'
          TaxCode      = 'B1' ) )
      MAPPED DATA(ls_mapped)
      FAILED DATA(ls_failed)
      REPORTED DATA(ls_reported).

    COMMIT ENTITIES
      RESPONSE OF zi_bsi_upload
      FAILED DATA(ls_commit_failed)
      REPORTED DATA(ls_commit_reported).

    " Then: Validation should report failure for CompanyCode
    cl_abap_unit_assert=>assert_not_initial(
      act = ls_commit_failed-upload
      msg = 'Validation should fail when CompanyCode is missing' ).
  ENDMETHOD.

  METHOD test_validate_amount_positive.
    " Given: A record with positive amount
    MODIFY ENTITIES OF zi_bsi_upload
      ENTITY Upload
        CREATE FIELDS ( CompanyCode DocumentDate PostingDate
                        GrossAmount Currency PurchaseOrder PoItem TaxCode )
        WITH VALUE #( (
          %cid         = 'CID3'
          CompanyCode  = '1000'
          DocumentDate = '20260301'
          PostingDate  = '20260301'
          GrossAmount  = '500.00'
          Currency     = 'BRL'
          PurchaseOrder = '4500000001'
          PoItem       = '00010'
          TaxCode      = 'B1' ) )
      MAPPED DATA(ls_mapped)
      FAILED DATA(ls_failed)
      REPORTED DATA(ls_reported).

    COMMIT ENTITIES
      RESPONSE OF zi_bsi_upload
      FAILED DATA(ls_commit_failed)
      REPORTED DATA(ls_commit_reported).

    cl_abap_unit_assert=>assert_initial(
      act = ls_commit_failed-upload
      msg = 'Positive amount should pass validation' ).
  ENDMETHOD.

  METHOD test_validate_amount_negative.
    " Given: A record with negative/zero amount
    MODIFY ENTITIES OF zi_bsi_upload
      ENTITY Upload
        CREATE FIELDS ( CompanyCode DocumentDate PostingDate
                        GrossAmount Currency PurchaseOrder PoItem TaxCode )
        WITH VALUE #( (
          %cid         = 'CID4'
          CompanyCode  = '1000'
          DocumentDate = '20260301'
          PostingDate  = '20260301'
          GrossAmount  = '-100.00'
          Currency     = 'BRL'
          PurchaseOrder = '4500000001'
          PoItem       = '00010'
          TaxCode      = 'B1' ) )
      MAPPED DATA(ls_mapped)
      FAILED DATA(ls_failed)
      REPORTED DATA(ls_reported).

    COMMIT ENTITIES
      RESPONSE OF zi_bsi_upload
      FAILED DATA(ls_commit_failed)
      REPORTED DATA(ls_commit_reported).

    cl_abap_unit_assert=>assert_not_initial(
      act = ls_commit_failed-upload
      msg = 'Negative amount should fail validation' ).
  ENDMETHOD.

  METHOD test_set_defaults.
    " Given: A new record
    MODIFY ENTITIES OF zi_bsi_upload
      ENTITY Upload
        CREATE FIELDS ( CompanyCode DocumentDate PostingDate
                        GrossAmount Currency PurchaseOrder PoItem TaxCode )
        WITH VALUE #( (
          %cid         = 'CID5'
          CompanyCode  = '1000'
          DocumentDate = '20260301'
          PostingDate  = '20260301'
          GrossAmount  = '1000.00'
          Currency     = 'BRL'
          PurchaseOrder = '4500000001'
          PoItem       = '00010'
          TaxCode      = 'B1' ) )
      MAPPED DATA(ls_mapped)
      FAILED DATA(ls_failed)
      REPORTED DATA(ls_reported).

    " Then: Status should be set to 'P' (Pending) by determination
    READ ENTITIES OF zi_bsi_upload
      ENTITY Upload
        FIELDS ( Status )
        WITH VALUE #( ( %key = ls_mapped-upload[ 1 ]-%key ) )
      RESULT DATA(lt_result)
      FAILED DATA(lt_read_failed).

    cl_abap_unit_assert=>assert_equals(
      exp = 'P'
      act = lt_result[ 1 ]-Status
      msg = 'Default status should be P (Pending)' ).
  ENDMETHOD.

ENDCLASS.
