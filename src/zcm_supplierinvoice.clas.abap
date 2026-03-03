"! <p class="shorttext synchronized">Consumption model for client proxy - generated</p>
"! This class has been generated based on the metadata with namespace
"! <em>API_SUPPLIERINVOICE_PROCESS_SRV</em>
CLASS zcm_supplierinvoice DEFINITION
  PUBLIC
  INHERITING FROM /iwbep/cl_v4_abs_pm_model_prov
  CREATE PUBLIC.

  PUBLIC SECTION.

    TYPES:
      "! <p class="shorttext synchronized">Types for "OData Primitive Types"</p>
      BEGIN OF tys_types_for_prim_types,
        "! Used for primitive type DISCOUNT_DAYS_HAVE_TO_BE_S
        discount_days_have_to_be_s TYPE abap_bool,
        "! Used for primitive type FISCAL_YEAR
        fiscal_year                TYPE c LENGTH 4,
        "! Used for primitive type FISCAL_YEAR_2
        fiscal_year_2              TYPE c LENGTH 4,
        "! Used for primitive type FISCAL_YEAR_3
        fiscal_year_3              TYPE c LENGTH 4,
        "! Used for primitive type POSTING_DATE
        posting_date               TYPE timestamp,
        "! Used for primitive type REVERSAL_REASON
        reversal_reason            TYPE c LENGTH 2,
        "! Used for primitive type SUPPLIER_INVOICE
        supplier_invoice           TYPE c LENGTH 10,
        "! Used for primitive type SUPPLIER_INVOICE_2
        supplier_invoice_2         TYPE c LENGTH 10,
        "! Used for primitive type SUPPLIER_INVOICE_3
        supplier_invoice_3         TYPE c LENGTH 10,
      END OF tys_types_for_prim_types.

    TYPES:
      "! <p class="shorttext synchronized">CancelInvoiceExportParameters</p>
      BEGIN OF tys_cancel_invoice_export_para,
        "! ReverseDocument
        reverse_document TYPE c LENGTH 10,
        "! FiscalYear
        fiscal_year      TYPE c LENGTH 4,
        "! Success
        success          TYPE abap_bool,
      END OF tys_cancel_invoice_export_para,
      "! <p class="shorttext synchronized">List of CancelInvoiceExportParameters</p>
      tyt_cancel_invoice_export_para TYPE STANDARD TABLE OF tys_cancel_invoice_export_para WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">PostInvoiceExportParameters</p>
      BEGIN OF tys_post_invoice_export_parame,
        "! Success
        success TYPE abap_bool,
      END OF tys_post_invoice_export_parame,
      "! <p class="shorttext synchronized">List of PostInvoiceExportParameters</p>
      tyt_post_invoice_export_parame TYPE STANDARD TABLE OF tys_post_invoice_export_parame WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">ReleaseInvoiceExportParameters</p>
      BEGIN OF tys_release_invoice_export_par,
        "! Success
        success TYPE abap_bool,
      END OF tys_release_invoice_export_par,
      "! <p class="shorttext synchronized">List of ReleaseInvoiceExportParameters</p>
      tyt_release_invoice_export_par TYPE STANDARD TABLE OF tys_release_invoice_export_par WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function Cancel</p>
      "! <em>with the internal name</em> CANCEL
      BEGIN OF tys_parameters_1,
        "! PostingDate
        posting_date     TYPE timestamp,
        "! ReversalReason
        reversal_reason  TYPE c LENGTH 2,
        "! FiscalYear
        fiscal_year      TYPE c LENGTH 4,
        "! SupplierInvoice
        supplier_invoice TYPE c LENGTH 10,
      END OF tys_parameters_1,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_1</p>
      tyt_parameters_1 TYPE STANDARD TABLE OF tys_parameters_1 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function Post</p>
      "! <em>with the internal name</em> POST
      BEGIN OF tys_parameters_2,
        "! SupplierInvoice
        supplier_invoice TYPE c LENGTH 10,
        "! FiscalYear
        fiscal_year      TYPE c LENGTH 4,
      END OF tys_parameters_2,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_2</p>
      tyt_parameters_2 TYPE STANDARD TABLE OF tys_parameters_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">Parameters of function Release</p>
      "! <em>with the internal name</em> RELEASE
      BEGIN OF tys_parameters_3,
        "! SupplierInvoice
        supplier_invoice           TYPE c LENGTH 10,
        "! FiscalYear
        fiscal_year                TYPE c LENGTH 4,
        "! DiscountDaysHaveToBeShifted
        discount_days_have_to_be_s TYPE abap_bool,
      END OF tys_parameters_3,
      "! <p class="shorttext synchronized">List of TYS_PARAMETERS_3</p>
      tyt_parameters_3 TYPE STANDARD TABLE OF tys_parameters_3 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_BR_SupplierInvoiceNFDocumentType</p>
      BEGIN OF tys_a_br_supplier_invoice_nf_2,
        "! <em>Key property</em> SupplierInvoice
        supplier_invoice           TYPE c LENGTH 10,
        "! <em>Key property</em> FiscalYear
        fiscal_year                TYPE c LENGTH 4,
        "! BR_NotaFiscal
        br_nota_fiscal             TYPE c LENGTH 10,
        "! BR_NFType
        br_nftype                  TYPE c LENGTH 2,
        "! BR_NFSNumber
        br_nfsnumber               TYPE c LENGTH 20,
        "! BR_NFSVerificationCode
        br_nfsverification_code    TYPE c LENGTH 20,
        "! BR_NFAuthznProtocolNumber
        br_nfauthzn_protocol_numbe TYPE c LENGTH 15,
        "! BR_NFAuthznProtocolNumber16
        br_nfauthzn_protocol_num_2 TYPE c LENGTH 16,
        "! BR_NFAuthenticationDate
        br_nfauthentication_date   TYPE datn,
        "! BR_NFAuthenticationTime
        br_nfauthentication_time   TYPE timn,
        "! BR_NFeRandomNumber
        br_nfe_random_number       TYPE c LENGTH 9,
        "! IssuingType
        issuing_type               TYPE c LENGTH 1,
      END OF tys_a_br_supplier_invoice_nf_2,
      "! <p class="shorttext synchronized">List of A_BR_SupplierInvoiceNFDocumentType</p>
      tyt_a_br_supplier_invoice_nf_2 TYPE STANDARD TABLE OF tys_a_br_supplier_invoice_nf_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SuplrInvcHeaderWhldgTaxType</p>
      BEGIN OF tys_a_suplr_invc_header_whld_2,
        "! <em>Key property</em> SupplierInvoice
        supplier_invoice           TYPE c LENGTH 10,
        "! <em>Key property</em> FiscalYear
        fiscal_year                TYPE c LENGTH 4,
        "! <em>Key property</em> WithholdingTaxType
        withholding_tax_type       TYPE c LENGTH 2,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 5,
        "! WithholdingTaxCode
        withholding_tax_code       TYPE c LENGTH 2,
        "! WithholdingTaxBaseAmount
        withholding_tax_base_amoun TYPE p LENGTH 9 DECIMALS 3,
        "! ManuallyEnteredWhldgTaxAmount
        manually_entered_whldg_tax TYPE p LENGTH 9 DECIMALS 3,
        "! WhldgTaxIsEnteredManually
        whldg_tax_is_entered_manua TYPE abap_bool,
        "! WhldgTaxBaseIsEnteredManually
        whldg_tax_base_is_entered  TYPE abap_bool,
      END OF tys_a_suplr_invc_header_whld_2,
      "! <p class="shorttext synchronized">List of A_SuplrInvcHeaderWhldgTaxType</p>
      tyt_a_suplr_invc_header_whld_2 TYPE STANDARD TABLE OF tys_a_suplr_invc_header_whld_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SuplrInvcItemAcctAssgmtType</p>
      BEGIN OF tys_a_suplr_invc_item_acct_a_2,
        "! <em>Key property</em> SupplierInvoice
        supplier_invoice           TYPE c LENGTH 10,
        "! <em>Key property</em> FiscalYear
        fiscal_year                TYPE c LENGTH 4,
        "! <em>Key property</em> SupplierInvoiceItem
        supplier_invoice_item      TYPE c LENGTH 6,
        "! <em>Key property</em> OrdinalNumber
        ordinal_number             TYPE c LENGTH 4,
        "! CostCenter
        cost_center                TYPE c LENGTH 10,
        "! ControllingArea
        controlling_area           TYPE c LENGTH 4,
        "! BusinessArea
        business_area              TYPE c LENGTH 4,
        "! ProfitCenter
        profit_center              TYPE c LENGTH 10,
        "! FunctionalArea
        functional_area            TYPE c LENGTH 16,
        "! GLAccount
        glaccount                  TYPE c LENGTH 10,
        "! SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! SalesOrderItem
        sales_order_item           TYPE c LENGTH 6,
        "! CostObject
        cost_object                TYPE c LENGTH 12,
        "! CostCtrActivityType
        cost_ctr_activity_type     TYPE c LENGTH 6,
        "! BusinessProcess
        business_process           TYPE c LENGTH 12,
        "! WBSElement
        wbselement                 TYPE c LENGTH 24,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 5,
        "! SuplrInvcAcctAssignmentAmount
        suplr_invc_acct_assignment TYPE p LENGTH 8 DECIMALS 3,
        "! PurchaseOrderQuantityUnit
        purchase_order_quantity_un TYPE c LENGTH 3,
        "! PurchaseOrderQtyUnitSAPCode
        purchase_order_qty_unit_sa TYPE c LENGTH 3,
        "! PurchaseOrderQtyUnitISOCode
        purchase_order_qty_unit_is TYPE c LENGTH 3,
        "! Quantity
        quantity                   TYPE p LENGTH 7 DECIMALS 3,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! AccountAssignmentNumber
        account_assignment_number  TYPE c LENGTH 2,
        "! AccountAssignmentIsUnplanned
        account_assignment_is_unpl TYPE abap_bool,
        "! PersonnelNumber
        personnel_number           TYPE c LENGTH 8,
        "! WorkItem
        work_item                  TYPE c LENGTH 10,
        "! MasterFixedAsset
        master_fixed_asset         TYPE c LENGTH 12,
        "! FixedAsset
        fixed_asset                TYPE c LENGTH 4,
        "! DebitCreditCode
        debit_credit_code          TYPE c LENGTH 1,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! InternalOrder
        internal_order             TYPE c LENGTH 12,
        "! ProjectNetworkInternalID
        project_network_internal_i TYPE c LENGTH 10,
        "! NetworkActivityInternalID
        network_activity_internal  TYPE c LENGTH 10,
        "! ProjectNetwork
        project_network            TYPE c LENGTH 12,
        "! NetworkActivity
        network_activity           TYPE c LENGTH 4,
        "! CommitmentItem
        commitment_item            TYPE c LENGTH 24,
        "! FundsCenter
        funds_center               TYPE c LENGTH 16,
        "! Fund
        fund                       TYPE c LENGTH 10,
        "! GrantID
        grant_id                   TYPE c LENGTH 20,
        "! PartnerBusinessArea
        partner_business_area      TYPE c LENGTH 4,
        "! CompanyCode
        company_code               TYPE c LENGTH 4,
        "! SuplrInvcAccountAssignmentText
        suplr_invc_account_assignm TYPE c LENGTH 50,
        "! PurchaseOrderPriceUnit
        purchase_order_price_unit  TYPE c LENGTH 3,
        "! PurchaseOrderPriceUnitSAPCode
        purchase_order_price_uni_2 TYPE c LENGTH 3,
        "! PurchaseOrderPriceUnitISOCode
        purchase_order_price_uni_3 TYPE c LENGTH 3,
        "! QuantityInPurchaseOrderUnit
        quantity_in_purchase_order TYPE p LENGTH 7 DECIMALS 3,
        "! ProfitabilitySegment
        profitability_segment      TYPE c LENGTH 10,
        "! BudgetPeriod
        budget_period              TYPE c LENGTH 10,
        "! TaxCountry
        tax_country                TYPE c LENGTH 3,
        "! TaxDeterminationDate
        tax_determination_date     TYPE datn,
      END OF tys_a_suplr_invc_item_acct_a_2,
      "! <p class="shorttext synchronized">List of A_SuplrInvcItemAcctAssgmtType</p>
      tyt_a_suplr_invc_item_acct_a_2 TYPE STANDARD TABLE OF tys_a_suplr_invc_item_acct_a_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SuplrInvcItemPurOrdRefType</p>
      BEGIN OF tys_a_suplr_invc_item_pur_or_2,
        "! <em>Key property</em> SupplierInvoice
        supplier_invoice           TYPE c LENGTH 10,
        "! <em>Key property</em> FiscalYear
        fiscal_year                TYPE c LENGTH 4,
        "! <em>Key property</em> SupplierInvoiceItem
        supplier_invoice_item      TYPE c LENGTH 6,
        "! PurchaseOrder
        purchase_order             TYPE c LENGTH 10,
        "! PurchaseOrderItem
        purchase_order_item        TYPE c LENGTH 5,
        "! Plant
        plant                      TYPE c LENGTH 4,
        "! ReferenceDocument
        reference_document         TYPE c LENGTH 10,
        "! ReferenceDocumentFiscalYear
        reference_document_fiscal  TYPE c LENGTH 4,
        "! ReferenceDocumentItem
        reference_document_item    TYPE c LENGTH 4,
        "! IsSubsequentDebitCredit
        is_subsequent_debit_credit TYPE c LENGTH 1,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 5,
        "! SupplierInvoiceItemAmount
        supplier_invoice_item_amou TYPE p LENGTH 8 DECIMALS 3,
        "! PurchaseOrderQuantityUnit
        purchase_order_quantity_un TYPE c LENGTH 3,
        "! PurchaseOrderQtyUnitSAPCode
        purchase_order_qty_unit_sa TYPE c LENGTH 3,
        "! PurchaseOrderQtyUnitISOCode
        purchase_order_qty_unit_is TYPE c LENGTH 3,
        "! QuantityInPurchaseOrderUnit
        quantity_in_purchase_order TYPE p LENGTH 7 DECIMALS 3,
        "! PurchaseOrderPriceUnit
        purchase_order_price_unit  TYPE c LENGTH 3,
        "! PurchaseOrderPriceUnitSAPCode
        purchase_order_price_uni_2 TYPE c LENGTH 3,
        "! PurchaseOrderPriceUnitISOCode
        purchase_order_price_uni_3 TYPE c LENGTH 3,
        "! QtyInPurchaseOrderPriceUnit
        qty_in_purchase_order_pric TYPE p LENGTH 7 DECIMALS 3,
        "! SuplrInvcDeliveryCostCndnType
        suplr_invc_delivery_cost_c TYPE c LENGTH 4,
        "! SuplrInvcDeliveryCostCndnStep
        suplr_invc_delivery_cost_2 TYPE c LENGTH 3,
        "! SuplrInvcDeliveryCostCndnCount
        suplr_invc_delivery_cost_3 TYPE c LENGTH 3,
        "! SupplierInvoiceItemText
        supplier_invoice_item_text TYPE c LENGTH 50,
        "! FreightSupplier
        freight_supplier           TYPE c LENGTH 10,
        "! IsNotCashDiscountLiable
        is_not_cash_discount_liabl TYPE abap_bool,
        "! PurchasingDocumentItemCategory
        purchasing_document_item_c TYPE c LENGTH 1,
        "! ProductType
        product_type               TYPE c LENGTH 2,
        "! RetentionAmountInDocCurrency
        retention_amount_in_doc_cu TYPE p LENGTH 8 DECIMALS 3,
        "! RetentionPercentage
        retention_percentage       TYPE p LENGTH 3 DECIMALS 2,
        "! RetentionDueDate
        retention_due_date         TYPE datn,
        "! SuplrInvcItmIsNotRlvtForRtntn
        suplr_invc_itm_is_not_rlvt TYPE abap_bool,
        "! ServiceEntrySheet
        service_entry_sheet        TYPE c LENGTH 10,
        "! ServiceEntrySheetItem
        service_entry_sheet_item   TYPE c LENGTH 10,
        "! TaxCountry
        tax_country                TYPE c LENGTH 3,
        "! IsFinallyInvoiced
        is_finally_invoiced        TYPE abap_bool,
        "! TaxDeterminationDate
        tax_determination_date     TYPE datn,
        "! IN_HSNOrSACCode
        in_hsnor_saccode           TYPE c LENGTH 16,
        "! IN_CustomDutyAssessableValue
        in_custom_duty_assessable  TYPE p LENGTH 8 DECIMALS 3,
        "! NL_ChainLiabilityStartDate
        nl_chain_liability_start_d TYPE datn,
        "! NL_ChainLiabilityEndDate
        nl_chain_liability_end_dat TYPE datn,
        "! NL_ChainLiabilityDescription
        nl_chain_liability_descrip TYPE c LENGTH 20,
        "! NL_ChainLbltyCnstrctnSiteDesc
        nl_chain_lblty_cnstrctn_si TYPE c LENGTH 20,
        "! NL_ChainLiabilityDuration
        nl_chain_liability_duratio TYPE c LENGTH 10,
        "! NL_ChainLiabilityPercent
        nl_chain_liability_percent TYPE p LENGTH 3 DECIMALS 2,
      END OF tys_a_suplr_invc_item_pur_or_2,
      "! <p class="shorttext synchronized">List of A_SuplrInvcItemPurOrdRefType</p>
      tyt_a_suplr_invc_item_pur_or_2 TYPE STANDARD TABLE OF tys_a_suplr_invc_item_pur_or_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SuplrInvcSeldInbDeliveryNoteType</p>
      BEGIN OF tys_a_suplr_invc_seld_inb_de_2,
        "! <em>Key property</em> SupplierInvoice
        supplier_invoice      TYPE c LENGTH 10,
        "! <em>Key property</em> FiscalYear
        fiscal_year           TYPE c LENGTH 4,
        "! <em>Key property</em> InboundDeliveryNote
        inbound_delivery_note TYPE c LENGTH 16,
      END OF tys_a_suplr_invc_seld_inb_de_2,
      "! <p class="shorttext synchronized">List of A_SuplrInvcSeldInbDeliveryNoteType</p>
      tyt_a_suplr_invc_seld_inb_de_2 TYPE STANDARD TABLE OF tys_a_suplr_invc_seld_inb_de_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SuplrInvcSeldPurgDocumentType</p>
      BEGIN OF tys_a_suplr_invc_seld_purg_d_2,
        "! <em>Key property</em> SupplierInvoice
        supplier_invoice    TYPE c LENGTH 10,
        "! <em>Key property</em> FiscalYear
        fiscal_year         TYPE c LENGTH 4,
        "! <em>Key property</em> PurchaseOrder
        purchase_order      TYPE c LENGTH 10,
        "! <em>Key property</em> PurchaseOrderItem
        purchase_order_item TYPE c LENGTH 5,
      END OF tys_a_suplr_invc_seld_purg_d_2,
      "! <p class="shorttext synchronized">List of A_SuplrInvcSeldPurgDocumentType</p>
      tyt_a_suplr_invc_seld_purg_d_2 TYPE STANDARD TABLE OF tys_a_suplr_invc_seld_purg_d_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SuplrInvcSeldSrvcEntrShtLeanType</p>
      BEGIN OF tys_a_suplr_invc_seld_srvc_e_2,
        "! <em>Key property</em> SupplierInvoice
        supplier_invoice         TYPE c LENGTH 10,
        "! <em>Key property</em> FiscalYear
        fiscal_year              TYPE c LENGTH 4,
        "! <em>Key property</em> ServiceEntrySheet
        service_entry_sheet      TYPE c LENGTH 10,
        "! <em>Key property</em> ServiceEntrySheetItem
        service_entry_sheet_item TYPE c LENGTH 5,
      END OF tys_a_suplr_invc_seld_srvc_e_2,
      "! <p class="shorttext synchronized">List of A_SuplrInvcSeldSrvcEntrShtLeanType</p>
      tyt_a_suplr_invc_seld_srvc_e_2 TYPE STANDARD TABLE OF tys_a_suplr_invc_seld_srvc_e_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SuplrInvoiceAdditionalDataType</p>
      BEGIN OF tys_a_suplr_invoice_addition_2,
        "! <em>Key property</em> SupplierInvoice
        supplier_invoice           TYPE c LENGTH 10,
        "! <em>Key property</em> FiscalYear
        fiscal_year                TYPE c LENGTH 4,
        "! InvoicingPartyName1
        invoicing_party_name_1     TYPE c LENGTH 35,
        "! InvoicingPartyName2
        invoicing_party_name_2     TYPE c LENGTH 35,
        "! InvoicingPartyName3
        invoicing_party_name_3     TYPE c LENGTH 35,
        "! InvoicingPartyName4
        invoicing_party_name_4     TYPE c LENGTH 35,
        "! PostalCode
        postal_code                TYPE c LENGTH 10,
        "! CityName
        city_name                  TYPE c LENGTH 35,
        "! Country
        country                    TYPE c LENGTH 3,
        "! StreetAddressName
        street_address_name        TYPE c LENGTH 35,
        "! POBox
        pobox                      TYPE c LENGTH 10,
        "! POBoxPostalCode
        pobox_postal_code          TYPE c LENGTH 10,
        "! PostOfficeBankAccount
        post_office_bank_account   TYPE c LENGTH 16,
        "! BankAccount
        bank_account               TYPE c LENGTH 18,
        "! Bank
        bank                       TYPE c LENGTH 15,
        "! BankCountry
        bank_country               TYPE c LENGTH 3,
        "! TaxID1
        tax_id_1                   TYPE c LENGTH 16,
        "! TaxID2
        tax_id_2                   TYPE c LENGTH 11,
        "! TaxID3
        tax_id_3                   TYPE c LENGTH 18,
        "! TaxID4
        tax_id_4                   TYPE c LENGTH 18,
        "! TaxID5
        tax_id_5                   TYPE c LENGTH 60,
        "! OneTmeAccountIsVATLiable
        one_tme_account_is_vatliab TYPE abap_bool,
        "! OneTmeAcctIsEqualizationTxSubj
        one_tme_acct_is_equalizati TYPE abap_bool,
        "! Region
        region                     TYPE c LENGTH 3,
        "! BankControlKey
        bank_control_key           TYPE c LENGTH 2,
        "! DataExchangeInstructionKey
        data_exchange_instruction  TYPE c LENGTH 2,
        "! DataMediumExchangeIndicator
        data_medium_exchange_indic TYPE c LENGTH 1,
        "! LanguageCode
        language_code              TYPE c LENGTH 2,
        "! IsOneTimeAccount
        is_one_time_account        TYPE abap_bool,
        "! PaymentRecipient
        payment_recipient          TYPE c LENGTH 16,
        "! AccountTaxType
        account_tax_type           TYPE c LENGTH 2,
        "! TaxNumberType
        tax_number_type            TYPE c LENGTH 2,
        "! IsNaturalPerson
        is_natural_person          TYPE abap_bool,
        "! BankDetailReference
        bank_detail_reference      TYPE c LENGTH 20,
        "! RepresentativeName
        representative_name        TYPE c LENGTH 10,
        "! BusinessType
        business_type              TYPE c LENGTH 30,
        "! IndustryType
        industry_type              TYPE c LENGTH 30,
        "! FormOfAddressName
        form_of_address_name       TYPE c LENGTH 15,
        "! VATRegistration
        vatregistration            TYPE c LENGTH 20,
        "! OneTimeAcctCntrySpecificRef1
        one_time_acct_cntry_specif TYPE c LENGTH 140,
        "! IBAN
        iban                       TYPE c LENGTH 34,
        "! SWIFTCode
        swiftcode                  TYPE c LENGTH 11,
        "! OneTimeBusinessPartnerEmail
        one_time_business_partner  TYPE c LENGTH 130,
      END OF tys_a_suplr_invoice_addition_2,
      "! <p class="shorttext synchronized">List of A_SuplrInvoiceAdditionalDataType</p>
      tyt_a_suplr_invoice_addition_2 TYPE STANDARD TABLE OF tys_a_suplr_invoice_addition_2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SupplierInvoiceItemAssetType</p>
      BEGIN OF tys_a_supplier_invoice_item__2,
        "! <em>Key property</em> SupplierInvoice
        supplier_invoice           TYPE c LENGTH 10,
        "! <em>Key property</em> FiscalYear
        fiscal_year                TYPE c LENGTH 4,
        "! <em>Key property</em> SupplierInvoiceItem
        supplier_invoice_item      TYPE c LENGTH 4,
        "! CompanyCode
        company_code               TYPE c LENGTH 4,
        "! MasterFixedAsset
        master_fixed_asset         TYPE c LENGTH 12,
        "! FixedAsset
        fixed_asset                TYPE c LENGTH 4,
        "! ProfitCenter
        profit_center              TYPE c LENGTH 10,
        "! GLAccount
        glaccount                  TYPE c LENGTH 10,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 5,
        "! SupplierInvoiceItemAmount
        supplier_invoice_item_amou TYPE p LENGTH 8 DECIMALS 3,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! TaxCountry
        tax_country                TYPE c LENGTH 3,
        "! TaxDeterminationDate
        tax_determination_date     TYPE datn,
        "! DebitCreditCode
        debit_credit_code          TYPE c LENGTH 1,
        "! SupplierInvoiceItemText
        supplier_invoice_item_text TYPE c LENGTH 50,
        "! AssignmentReference
        assignment_reference       TYPE c LENGTH 18,
        "! IsNotCashDiscountLiable
        is_not_cash_discount_liabl TYPE abap_bool,
        "! AssetValueDate
        asset_value_date           TYPE datn,
        "! QuantityUnit
        quantity_unit              TYPE c LENGTH 3,
        "! SuplrInvcItmQtyUnitSAPCode
        suplr_invc_itm_qty_unit_sa TYPE c LENGTH 3,
        "! SuplrInvcItmQtyUnitISOCode
        suplr_invc_itm_qty_unit_is TYPE c LENGTH 3,
        "! Quantity
        quantity                   TYPE p LENGTH 7 DECIMALS 3,
      END OF tys_a_supplier_invoice_item__2,
      "! <p class="shorttext synchronized">List of A_SupplierInvoiceItemAssetType</p>
      tyt_a_supplier_invoice_item__2 TYPE STANDARD TABLE OF tys_a_supplier_invoice_item__2 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SupplierInvoiceItemGLAcctType</p>
      BEGIN OF tys_a_supplier_invoice_item__3,
        "! <em>Key property</em> SupplierInvoice
        supplier_invoice           TYPE c LENGTH 10,
        "! <em>Key property</em> FiscalYear
        fiscal_year                TYPE c LENGTH 4,
        "! <em>Key property</em> SupplierInvoiceItem
        supplier_invoice_item      TYPE c LENGTH 4,
        "! CompanyCode
        company_code               TYPE c LENGTH 4,
        "! CostCenter
        cost_center                TYPE c LENGTH 10,
        "! ControllingArea
        controlling_area           TYPE c LENGTH 4,
        "! BusinessArea
        business_area              TYPE c LENGTH 4,
        "! ProfitCenter
        profit_center              TYPE c LENGTH 10,
        "! FunctionalArea
        functional_area            TYPE c LENGTH 16,
        "! GLAccount
        glaccount                  TYPE c LENGTH 10,
        "! SalesOrder
        sales_order                TYPE c LENGTH 10,
        "! SalesOrderItem
        sales_order_item           TYPE c LENGTH 6,
        "! CostObject
        cost_object                TYPE c LENGTH 12,
        "! CostCtrActivityType
        cost_ctr_activity_type     TYPE c LENGTH 6,
        "! BusinessProcess
        business_process           TYPE c LENGTH 12,
        "! WBSElement
        wbselement                 TYPE c LENGTH 24,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 5,
        "! SupplierInvoiceItemAmount
        supplier_invoice_item_amou TYPE p LENGTH 8 DECIMALS 3,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! PersonnelNumber
        personnel_number           TYPE c LENGTH 8,
        "! WorkItem
        work_item                  TYPE c LENGTH 10,
        "! DebitCreditCode
        debit_credit_code          TYPE c LENGTH 1,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! SupplierInvoiceItemText
        supplier_invoice_item_text TYPE c LENGTH 50,
        "! AssignmentReference
        assignment_reference       TYPE c LENGTH 18,
        "! IsNotCashDiscountLiable
        is_not_cash_discount_liabl TYPE abap_bool,
        "! InternalOrder
        internal_order             TYPE c LENGTH 12,
        "! ProjectNetwork
        project_network            TYPE c LENGTH 12,
        "! NetworkActivity
        network_activity           TYPE c LENGTH 4,
        "! CommitmentItem
        commitment_item            TYPE c LENGTH 24,
        "! FundsCenter
        funds_center               TYPE c LENGTH 16,
        "! TaxBaseAmountInTransCrcy
        tax_base_amount_in_trans_c TYPE p LENGTH 8 DECIMALS 3,
        "! Fund
        fund                       TYPE c LENGTH 10,
        "! GrantID
        grant_id                   TYPE c LENGTH 20,
        "! QuantityUnit
        quantity_unit              TYPE c LENGTH 3,
        "! SuplrInvcItmQtyUnitSAPCode
        suplr_invc_itm_qty_unit_sa TYPE c LENGTH 3,
        "! SuplrInvcItmQtyUnitISOCode
        suplr_invc_itm_qty_unit_is TYPE c LENGTH 3,
        "! Quantity
        quantity                   TYPE p LENGTH 7 DECIMALS 3,
        "! PartnerBusinessArea
        partner_business_area      TYPE c LENGTH 4,
        "! FinancialTransactionType
        financial_transaction_type TYPE c LENGTH 3,
        "! TaxCountry
        tax_country                TYPE c LENGTH 3,
        "! EarmarkedFundsDocument
        earmarked_funds_document   TYPE c LENGTH 10,
        "! EarmarkedFundsDocumentItem
        earmarked_funds_document_i TYPE c LENGTH 3,
        "! BudgetPeriod
        budget_period              TYPE c LENGTH 10,
        "! ServiceDocument
        service_document           TYPE c LENGTH 10,
        "! ServiceDocumentItem
        service_document_item      TYPE c LENGTH 6,
        "! ServiceDocumentType
        service_document_type      TYPE c LENGTH 4,
      END OF tys_a_supplier_invoice_item__3,
      "! <p class="shorttext synchronized">List of A_SupplierInvoiceItemGLAcctType</p>
      tyt_a_supplier_invoice_item__3 TYPE STANDARD TABLE OF tys_a_supplier_invoice_item__3 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SupplierInvoiceItemMaterialType</p>
      BEGIN OF tys_a_supplier_invoice_item__4,
        "! <em>Key property</em> SupplierInvoice
        supplier_invoice           TYPE c LENGTH 10,
        "! <em>Key property</em> FiscalYear
        fiscal_year                TYPE c LENGTH 4,
        "! <em>Key property</em> SupplierInvoiceItem
        supplier_invoice_item      TYPE c LENGTH 6,
        "! Material
        material                   TYPE c LENGTH 40,
        "! ValuationArea
        valuation_area             TYPE c LENGTH 4,
        "! CompanyCode
        company_code               TYPE c LENGTH 4,
        "! Plant
        plant                      TYPE c LENGTH 4,
        "! InventoryValuationType
        inventory_valuation_type   TYPE c LENGTH 10,
        "! TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! TaxCountry
        tax_country                TYPE c LENGTH 3,
        "! TaxDeterminationDate
        tax_determination_date     TYPE datn,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 5,
        "! SupplierInvoiceItemAmount
        supplier_invoice_item_amou TYPE p LENGTH 8 DECIMALS 3,
        "! QuantityUnit
        quantity_unit              TYPE c LENGTH 3,
        "! SuplrInvcItmQtyUnitSAPCode
        suplr_invc_itm_qty_unit_sa TYPE c LENGTH 3,
        "! SuplrInvcItmQtyUnitISOCode
        suplr_invc_itm_qty_unit_is TYPE c LENGTH 3,
        "! Quantity
        quantity                   TYPE p LENGTH 7 DECIMALS 3,
        "! DebitCreditCode
        debit_credit_code          TYPE c LENGTH 1,
        "! IsNotCashDiscountLiable
        is_not_cash_discount_liabl TYPE abap_bool,
      END OF tys_a_supplier_invoice_item__4,
      "! <p class="shorttext synchronized">List of A_SupplierInvoiceItemMaterialType</p>
      tyt_a_supplier_invoice_item__4 TYPE STANDARD TABLE OF tys_a_supplier_invoice_item__4 WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SupplierInvoiceODNType</p>
      BEGIN OF tys_a_supplier_invoice_odntype,
        "! <em>Key property</em> AFDFUniqueKeyUUID
        afdfunique_key_uuid        TYPE sysuuid_x16,
        "! <em>Key property</em> SupplierInvoice
        supplier_invoice           TYPE c LENGTH 10,
        "! <em>Key property</em> FiscalYear
        fiscal_year                TYPE c LENGTH 4,
        "! OfficialDocumentNumberCountry
        official_document_number_c TYPE c LENGTH 3,
        "! OfficialDocumentNumberType
        official_document_number_t TYPE c LENGTH 6,
        "! OfficialDocumentNumber
        official_document_number   TYPE c LENGTH 200,
        "! ODNLegalDateTimeText
        odnlegal_date_time_text    TYPE c LENGTH 30,
        "! OfficialDocumentNumberIntType
        official_document_number_i TYPE c LENGTH 6,
      END OF tys_a_supplier_invoice_odntype,
      "! <p class="shorttext synchronized">List of A_SupplierInvoiceODNType</p>
      tyt_a_supplier_invoice_odntype TYPE STANDARD TABLE OF tys_a_supplier_invoice_odntype WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SupplierInvoiceTaxType</p>
      BEGIN OF tys_a_supplier_invoice_tax_typ,
        "! <em>Key property</em> SupplierInvoice
        supplier_invoice           TYPE c LENGTH 10,
        "! <em>Key property</em> FiscalYear
        fiscal_year                TYPE c LENGTH 4,
        "! <em>Key property</em> TaxCode
        tax_code                   TYPE c LENGTH 2,
        "! <em>Key property</em> SupplierInvoiceTaxCounter
        supplier_invoice_tax_count TYPE c LENGTH 6,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 5,
        "! TaxAmount
        tax_amount                 TYPE p LENGTH 8 DECIMALS 3,
        "! TaxBaseAmountInTransCrcy
        tax_base_amount_in_trans_c TYPE p LENGTH 9 DECIMALS 3,
        "! TaxJurisdiction
        tax_jurisdiction           TYPE c LENGTH 15,
        "! TaxCountry
        tax_country                TYPE c LENGTH 3,
        "! TaxDeterminationDate
        tax_determination_date     TYPE datn,
        "! TaxRateValidityStartDate
        tax_rate_validity_start_da TYPE datn,
      END OF tys_a_supplier_invoice_tax_typ,
      "! <p class="shorttext synchronized">List of A_SupplierInvoiceTaxType</p>
      tyt_a_supplier_invoice_tax_typ TYPE STANDARD TABLE OF tys_a_supplier_invoice_tax_typ WITH DEFAULT KEY.

    TYPES:
      "! <p class="shorttext synchronized">A_SupplierInvoiceType</p>
      BEGIN OF tys_a_supplier_invoice_type,
        "! <em>Key property</em> SupplierInvoice
        supplier_invoice           TYPE c LENGTH 10,
        "! <em>Key property</em> FiscalYear
        fiscal_year                TYPE c LENGTH 4,
        "! CompanyCode
        company_code               TYPE c LENGTH 4,
        "! DocumentDate
        document_date              TYPE datn,
        "! PostingDate
        posting_date               TYPE datn,
        "! CreationDate
        creation_date              TYPE datn,
        "! SuplrInvcLstChgDteTmeTxt
        suplr_invc_lst_chg_dte_tme TYPE c LENGTH 23,
        "! SupplierInvoiceIDByInvcgParty
        supplier_invoice_idby_invc TYPE c LENGTH 16,
        "! InvoicingParty
        invoicing_party            TYPE c LENGTH 10,
        "! DocumentCurrency
        document_currency          TYPE c LENGTH 5,
        "! InvoiceGrossAmount
        invoice_gross_amount       TYPE p LENGTH 8 DECIMALS 3,
        "! UnplannedDeliveryCost
        unplanned_delivery_cost    TYPE p LENGTH 8 DECIMALS 3,
        "! DocumentHeaderText
        document_header_text       TYPE c LENGTH 25,
        "! ReconciliationAccount
        reconciliation_account     TYPE c LENGTH 10,
        "! ManualCashDiscount
        manual_cash_discount       TYPE p LENGTH 8 DECIMALS 3,
        "! PaymentTerms
        payment_terms              TYPE c LENGTH 4,
        "! DueCalculationBaseDate
        due_calculation_base_date  TYPE datn,
        "! CashDiscount1Percent
        cash_discount_1_percent    TYPE p LENGTH 3 DECIMALS 3,
        "! CashDiscount1Days
        cash_discount_1_days       TYPE p LENGTH 2 DECIMALS 0,
        "! CashDiscount2Percent
        cash_discount_2_percent    TYPE p LENGTH 3 DECIMALS 3,
        "! CashDiscount2Days
        cash_discount_2_days       TYPE p LENGTH 2 DECIMALS 0,
        "! NetPaymentDays
        net_payment_days           TYPE p LENGTH 2 DECIMALS 0,
        "! PaymentBlockingReason
        payment_blocking_reason    TYPE c LENGTH 1,
        "! AccountingDocumentType
        accounting_document_type   TYPE c LENGTH 2,
        "! BPBankAccountInternalID
        bpbank_account_internal_id TYPE c LENGTH 4,
        "! SupplierInvoiceStatus
        supplier_invoice_status    TYPE c LENGTH 1,
        "! IndirectQuotedExchangeRate
        indirect_quoted_exchange_r TYPE p LENGTH 5 DECIMALS 5,
        "! DirectQuotedExchangeRate
        direct_quoted_exchange_rat TYPE p LENGTH 5 DECIMALS 5,
        "! StateCentralBankPaymentReason
        state_central_bank_payment TYPE c LENGTH 3,
        "! SupplyingCountry
        supplying_country          TYPE c LENGTH 3,
        "! PaymentMethod
        payment_method             TYPE c LENGTH 1,
        "! PaymentMethodSupplement
        payment_method_supplement  TYPE c LENGTH 2,
        "! PaymentReference
        payment_reference          TYPE c LENGTH 30,
        "! InvoiceReference
        invoice_reference          TYPE c LENGTH 10,
        "! InvoiceReferenceFiscalYear
        invoice_reference_fiscal_y TYPE c LENGTH 4,
        "! FixedCashDiscount
        fixed_cash_discount        TYPE c LENGTH 1,
        "! UnplannedDeliveryCostTaxCode
        unplanned_delivery_cost_ta TYPE c LENGTH 2,
        "! UnplndDelivCostTaxJurisdiction
        unplnd_deliv_cost_tax_juri TYPE c LENGTH 15,
        "! UnplndDeliveryCostTaxCountry
        unplnd_delivery_cost_tax_c TYPE c LENGTH 3,
        "! AssignmentReference
        assignment_reference       TYPE c LENGTH 18,
        "! SupplierPostingLineItemText
        supplier_posting_line_item TYPE c LENGTH 50,
        "! TaxIsCalculatedAutomatically
        tax_is_calculated_automati TYPE abap_bool,
        "! BusinessPlace
        business_place             TYPE c LENGTH 4,
        "! BusinessSectionCode
        business_section_code      TYPE c LENGTH 4,
        "! BusinessArea
        business_area              TYPE c LENGTH 4,
        "! SuplrInvcIsCapitalGoodsRelated
        suplr_invc_is_capital_good TYPE abap_bool,
        "! SupplierInvoiceIsCreditMemo
        supplier_invoice_is_credit TYPE c LENGTH 1,
        "! PaytSlipWthRefSubscriber
        payt_slip_wth_ref_subscrib TYPE c LENGTH 11,
        "! PaytSlipWthRefCheckDigit
        payt_slip_wth_ref_check_di TYPE c LENGTH 2,
        "! PaytSlipWthRefReference
        payt_slip_wth_ref_referenc TYPE c LENGTH 27,
        "! TaxDeterminationDate
        tax_determination_date     TYPE datn,
        "! TaxReportingDate
        tax_reporting_date         TYPE datn,
        "! TaxFulfillmentDate
        tax_fulfillment_date       TYPE datn,
        "! InvoiceReceiptDate
        invoice_receipt_date       TYPE datn,
        "! DeliveryOfGoodsReportingCntry
        delivery_of_goods_reportin TYPE c LENGTH 3,
        "! SupplierVATRegistration
        supplier_vatregistration   TYPE c LENGTH 20,
        "! IsEUTriangularDeal
        is_eutriangular_deal       TYPE abap_bool,
        "! SuplrInvcDebitCrdtCodeDelivery
        suplr_invc_debit_crdt_code TYPE c LENGTH 1,
        "! SuplrInvcDebitCrdtCodeReturns
        suplr_invc_debit_crdt_co_2 TYPE c LENGTH 1,
        "! RetentionDueDate
        retention_due_date         TYPE datn,
        "! PaymentReason
        payment_reason             TYPE c LENGTH 4,
        "! HouseBank
        house_bank                 TYPE c LENGTH 5,
        "! HouseBankAccount
        house_bank_account         TYPE c LENGTH 5,
        "! AlternativePayeePayer
        alternative_payee_payer    TYPE c LENGTH 10,
        "! SupplierInvoiceOrigin
        supplier_invoice_origin    TYPE c LENGTH 1,
        "! ReverseDocument
        reverse_document           TYPE c LENGTH 10,
        "! ReverseDocumentFiscalYear
        reverse_document_fiscal_ye TYPE c LENGTH 4,
        "! IsReversal
        is_reversal                TYPE abap_bool,
        "! IsReversed
        is_reversed                TYPE abap_bool,
        "! SupplierInvoicePaymentStatus
        supplier_invoice_payment_s TYPE c LENGTH 20,
        "! SupplierInvoiceApprovalStatus
        supplier_invoice_approval  TYPE c LENGTH 40,
        "! IN_GSTPartner
        in_gstpartner              TYPE c LENGTH 10,
        "! IN_GSTPlaceOfSupply
        in_gstplace_of_supply      TYPE c LENGTH 3,
        "! IN_InvoiceReferenceNumber
        in_invoice_reference_numbe TYPE c LENGTH 64,
        "! JrnlEntryCntrySpecificRef1
        jrnl_entry_cntry_specific  TYPE c LENGTH 80,
        "! JrnlEntryCntrySpecificDate1
        jrnl_entry_cntry_specifi_2 TYPE datn,
        "! JrnlEntryCntrySpecificRef2
        jrnl_entry_cntry_specifi_3 TYPE c LENGTH 25,
        "! JrnlEntryCntrySpecificDate2
        jrnl_entry_cntry_specifi_4 TYPE datn,
        "! JrnlEntryCntrySpecificRef3
        jrnl_entry_cntry_specifi_5 TYPE c LENGTH 25,
        "! JrnlEntryCntrySpecificDate3
        jrnl_entry_cntry_specifi_6 TYPE datn,
        "! JrnlEntryCntrySpecificRef4
        jrnl_entry_cntry_specifi_7 TYPE c LENGTH 50,
        "! JrnlEntryCntrySpecificDate4
        jrnl_entry_cntry_specifi_8 TYPE datn,
        "! JrnlEntryCntrySpecificRef5
        jrnl_entry_cntry_specifi_9 TYPE c LENGTH 50,
        "! JrnlEntryCntrySpecificDate5
        jrnl_entry_cntry_specif_10 TYPE datn,
        "! JrnlEntryCntrySpecificBP1
        jrnl_entry_cntry_specif_11 TYPE c LENGTH 10,
        "! JrnlEntryCntrySpecificBP2
        jrnl_entry_cntry_specif_12 TYPE c LENGTH 10,
      END OF tys_a_supplier_invoice_type,
      "! <p class="shorttext synchronized">List of A_SupplierInvoiceType</p>
      tyt_a_supplier_invoice_type TYPE STANDARD TABLE OF tys_a_supplier_invoice_type WITH DEFAULT KEY.


    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the entity sets</p>
      BEGIN OF gcs_entity_set,
        "! A_BR_SupplierInvoiceNFDocument
        "! <br/> Collection of type 'A_BR_SupplierInvoiceNFDocumentType'
        a_br_supplier_invoice_nfdo TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_BR_SUPPLIER_INVOICE_NFDO',
        "! A_SuplrInvcHeaderWhldgTax
        "! <br/> Collection of type 'A_SuplrInvcHeaderWhldgTaxType'
        a_suplr_invc_header_whldg  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPLR_INVC_HEADER_WHLDG',
        "! A_SuplrInvcItemAcctAssgmt
        "! <br/> Collection of type 'A_SuplrInvcItemAcctAssgmtType'
        a_suplr_invc_item_acct_ass TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPLR_INVC_ITEM_ACCT_ASS',
        "! A_SuplrInvcItemPurOrdRef
        "! <br/> Collection of type 'A_SuplrInvcItemPurOrdRefType'
        a_suplr_invc_item_pur_ord  TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPLR_INVC_ITEM_PUR_ORD',
        "! A_SuplrInvcSeldInbDeliveryNote
        "! <br/> Collection of type 'A_SuplrInvcSeldInbDeliveryNoteType'
        a_suplr_invc_seld_inb_deli TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPLR_INVC_SELD_INB_DELI',
        "! A_SuplrInvcSeldPurgDocument
        "! <br/> Collection of type 'A_SuplrInvcSeldPurgDocumentType'
        a_suplr_invc_seld_purg_doc TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPLR_INVC_SELD_PURG_DOC',
        "! A_SuplrInvcSeldSrvcEntrShtLean
        "! <br/> Collection of type 'A_SuplrInvcSeldSrvcEntrShtLeanType'
        a_suplr_invc_seld_srvc_ent TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPLR_INVC_SELD_SRVC_ENT',
        "! A_SuplrInvoiceAdditionalData
        "! <br/> Collection of type 'A_SuplrInvoiceAdditionalDataType'
        a_suplr_invoice_additional TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPLR_INVOICE_ADDITIONAL',
        "! A_SupplierInvoice
        "! <br/> Collection of type 'A_SupplierInvoiceType'
        a_supplier_invoice         TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPPLIER_INVOICE',
        "! A_SupplierInvoiceItemAsset
        "! <br/> Collection of type 'A_SupplierInvoiceItemAssetType'
        a_supplier_invoice_item_as TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPPLIER_INVOICE_ITEM_AS',
        "! A_SupplierInvoiceItemGLAcct
        "! <br/> Collection of type 'A_SupplierInvoiceItemGLAcctType'
        a_supplier_invoice_item_gl TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPPLIER_INVOICE_ITEM_GL',
        "! A_SupplierInvoiceItemMaterial
        "! <br/> Collection of type 'A_SupplierInvoiceItemMaterialType'
        a_supplier_invoice_item_ma TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPPLIER_INVOICE_ITEM_MA',
        "! A_SupplierInvoiceODN
        "! <br/> Collection of type 'A_SupplierInvoiceODNType'
        a_supplier_invoice_odn     TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPPLIER_INVOICE_ODN',
        "! A_SupplierInvoiceTax
        "! <br/> Collection of type 'A_SupplierInvoiceTaxType'
        a_supplier_invoice_tax     TYPE /iwbep/if_cp_runtime_types=>ty_entity_set_name VALUE 'A_SUPPLIER_INVOICE_TAX',
      END OF gcs_entity_set .

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the function imports</p>
      BEGIN OF gcs_function_import,
        "! Cancel
        "! <br/> See structure type {@link ..tys_parameters_1} for the parameters
        cancel  TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'CANCEL',
        "! Post
        "! <br/> See structure type {@link ..tys_parameters_2} for the parameters
        post    TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'POST',
        "! Release
        "! <br/> See structure type {@link ..tys_parameters_3} for the parameters
        release TYPE /iwbep/if_cp_runtime_types=>ty_operation_name VALUE 'RELEASE',
      END OF gcs_function_import.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal Names of the bound functions</p>
      BEGIN OF gcs_bound_function,
         "! Dummy field - Structure must not be empty
         dummy TYPE int1 VALUE 0,
      END OF gcs_bound_function.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for complex types</p>
      BEGIN OF gcs_complex_type,
        "! <p class="shorttext synchronized">Internal names for CancelInvoiceExportParameters</p>
        "! See also structure type {@link ..tys_cancel_invoice_export_para}
        BEGIN OF cancel_invoice_export_para,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF cancel_invoice_export_para,
        "! <p class="shorttext synchronized">Internal names for PostInvoiceExportParameters</p>
        "! See also structure type {@link ..tys_post_invoice_export_parame}
        BEGIN OF post_invoice_export_parame,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF post_invoice_export_parame,
        "! <p class="shorttext synchronized">Internal names for ReleaseInvoiceExportParameters</p>
        "! See also structure type {@link ..tys_release_invoice_export_par}
        BEGIN OF release_invoice_export_par,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF release_invoice_export_par,
      END OF gcs_complex_type.

    CONSTANTS:
      "! <p class="shorttext synchronized">Internal names for entity types</p>
      BEGIN OF gcs_entity_type,
        "! <p class="shorttext synchronized">Internal names for A_BR_SupplierInvoiceNFDocumentType</p>
        "! See also structure type {@link ..tys_a_br_supplier_invoice_nf_2}
        BEGIN OF a_br_supplier_invoice_nf_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_br_supplier_invoice_nf_2,
        "! <p class="shorttext synchronized">Internal names for A_SuplrInvcHeaderWhldgTaxType</p>
        "! See also structure type {@link ..tys_a_suplr_invc_header_whld_2}
        BEGIN OF a_suplr_invc_header_whld_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_suplr_invc_header_whld_2,
        "! <p class="shorttext synchronized">Internal names for A_SuplrInvcItemAcctAssgmtType</p>
        "! See also structure type {@link ..tys_a_suplr_invc_item_acct_a_2}
        BEGIN OF a_suplr_invc_item_acct_a_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_suplr_invc_item_acct_a_2,
        "! <p class="shorttext synchronized">Internal names for A_SuplrInvcItemPurOrdRefType</p>
        "! See also structure type {@link ..tys_a_suplr_invc_item_pur_or_2}
        BEGIN OF a_suplr_invc_item_pur_or_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_SupplierInvoiceItmAcctAssgmt
            to_supplier_invoice_itm_ac TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPPLIER_INVOICE_ITM_AC',
          END OF navigation,
        END OF a_suplr_invc_item_pur_or_2,
        "! <p class="shorttext synchronized">Internal names for A_SuplrInvcSeldInbDeliveryNoteType</p>
        "! See also structure type {@link ..tys_a_suplr_invc_seld_inb_de_2}
        BEGIN OF a_suplr_invc_seld_inb_de_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_suplr_invc_seld_inb_de_2,
        "! <p class="shorttext synchronized">Internal names for A_SuplrInvcSeldPurgDocumentType</p>
        "! See also structure type {@link ..tys_a_suplr_invc_seld_purg_d_2}
        BEGIN OF a_suplr_invc_seld_purg_d_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_suplr_invc_seld_purg_d_2,
        "! <p class="shorttext synchronized">Internal names for A_SuplrInvcSeldSrvcEntrShtLeanType</p>
        "! See also structure type {@link ..tys_a_suplr_invc_seld_srvc_e_2}
        BEGIN OF a_suplr_invc_seld_srvc_e_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_suplr_invc_seld_srvc_e_2,
        "! <p class="shorttext synchronized">Internal names for A_SuplrInvoiceAdditionalDataType</p>
        "! See also structure type {@link ..tys_a_suplr_invoice_addition_2}
        BEGIN OF a_suplr_invoice_addition_2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_suplr_invoice_addition_2,
        "! <p class="shorttext synchronized">Internal names for A_SupplierInvoiceItemAssetType</p>
        "! See also structure type {@link ..tys_a_supplier_invoice_item__2}
        BEGIN OF a_supplier_invoice_item__2,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_supplier_invoice_item__2,
        "! <p class="shorttext synchronized">Internal names for A_SupplierInvoiceItemGLAcctType</p>
        "! See also structure type {@link ..tys_a_supplier_invoice_item__3}
        BEGIN OF a_supplier_invoice_item__3,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_supplier_invoice_item__3,
        "! <p class="shorttext synchronized">Internal names for A_SupplierInvoiceItemMaterialType</p>
        "! See also structure type {@link ..tys_a_supplier_invoice_item__4}
        BEGIN OF a_supplier_invoice_item__4,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_supplier_invoice_item__4,
        "! <p class="shorttext synchronized">Internal names for A_SupplierInvoiceODNType</p>
        "! See also structure type {@link ..tys_a_supplier_invoice_odntype}
        BEGIN OF a_supplier_invoice_odntype,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_supplier_invoice_odntype,
        "! <p class="shorttext synchronized">Internal names for A_SupplierInvoiceTaxType</p>
        "! See also structure type {@link ..tys_a_supplier_invoice_tax_typ}
        BEGIN OF a_supplier_invoice_tax_typ,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! Dummy field - Structure must not be empty
            dummy TYPE int1 VALUE 0,
          END OF navigation,
        END OF a_supplier_invoice_tax_typ,
        "! <p class="shorttext synchronized">Internal names for A_SupplierInvoiceType</p>
        "! See also structure type {@link ..tys_a_supplier_invoice_type}
        BEGIN OF a_supplier_invoice_type,
          "! <p class="shorttext synchronized">Navigation properties</p>
          BEGIN OF navigation,
            "! to_BR_SupplierInvoiceNFDocument
            to_br_supplier_invoice_nfd TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_BR_SUPPLIER_INVOICE_NFD',
            "! to_SelectedDeliveryNotes
            to_selected_delivery_notes TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SELECTED_DELIVERY_NOTES',
            "! to_SelectedPurchaseOrders
            to_selected_purchase_order TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SELECTED_PURCHASE_ORDER',
            "! to_SelectedServiceEntrySheets
            to_selected_service_entry  TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SELECTED_SERVICE_ENTRY',
            "! to_SuplrInvcItemAsset
            to_suplr_invc_item_asset   TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPLR_INVC_ITEM_ASSET',
            "! to_SuplrInvcItemMaterial
            to_suplr_invc_item_materia TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPLR_INVC_ITEM_MATERIA',
            "! to_SuplrInvcItemPurOrdRef
            to_suplr_invc_item_pur_ord TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPLR_INVC_ITEM_PUR_ORD',
            "! to_SuplrInvoiceAdditionalData
            to_suplr_invoice_additiona TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPLR_INVOICE_ADDITIONA',
            "! to_SupplierInvoiceItemGLAcct
            to_supplier_invoice_item_g TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPPLIER_INVOICE_ITEM_G',
            "! to_SupplierInvoiceODN
            to_supplier_invoice_odn    TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPPLIER_INVOICE_ODN',
            "! to_SupplierInvoiceTax
            to_supplier_invoice_tax    TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPPLIER_INVOICE_TAX',
            "! to_SupplierInvoiceWhldgTax
            to_supplier_invoice_whldg  TYPE /iwbep/if_v4_pm_types=>ty_internal_name VALUE 'TO_SUPPLIER_INVOICE_WHLDG',
          END OF navigation,
        END OF a_supplier_invoice_type,
      END OF gcs_entity_type.


    METHODS /iwbep/if_v4_mp_basic_pm~define REDEFINITION.


  PRIVATE SECTION.

    "! <p class="shorttext synchronized">Model</p>
    DATA mo_model TYPE REF TO /iwbep/if_v4_pm_model.


    "! <p class="shorttext synchronized">Define CancelInvoiceExportParameters</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_cancel_invoice_export_para RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define PostInvoiceExportParameters</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_post_invoice_export_parame RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define ReleaseInvoiceExportParameters</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_release_invoice_export_par RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_BR_SupplierInvoiceNFDocumentType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_br_supplier_invoice_nf_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_SuplrInvcHeaderWhldgTaxType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_suplr_invc_header_whld_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_SuplrInvcItemAcctAssgmtType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_suplr_invc_item_acct_a_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_SuplrInvcItemPurOrdRefType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_suplr_invc_item_pur_or_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_SuplrInvcSeldInbDeliveryNoteType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_suplr_invc_seld_inb_de_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_SuplrInvcSeldPurgDocumentType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_suplr_invc_seld_purg_d_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_SuplrInvcSeldSrvcEntrShtLeanType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_suplr_invc_seld_srvc_e_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_SuplrInvoiceAdditionalDataType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_suplr_invoice_addition_2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_SupplierInvoiceItemAssetType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_supplier_invoice_item__2 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_SupplierInvoiceItemGLAcctType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_supplier_invoice_item__3 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_SupplierInvoiceItemMaterialType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_supplier_invoice_item__4 RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_SupplierInvoiceODNType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_supplier_invoice_odntype RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_SupplierInvoiceTaxType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_supplier_invoice_tax_typ RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define A_SupplierInvoiceType</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_a_supplier_invoice_type RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Cancel</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_cancel RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Post</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_post RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define Release</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS def_release RAISING /iwbep/cx_gateway.

    "! <p class="shorttext synchronized">Define all primitive types</p>
    "! @raising /iwbep/cx_gateway | <p class="shorttext synchronized">Gateway Exception</p>
    METHODS define_primitive_types RAISING /iwbep/cx_gateway.

ENDCLASS.


CLASS zcm_supplierinvoice IMPLEMENTATION.

  METHOD /iwbep/if_v4_mp_basic_pm~define.

    mo_model = io_model.
    mo_model->set_schema_namespace( 'API_SUPPLIERINVOICE_PROCESS_SRV' ) ##NO_TEXT.

    def_cancel_invoice_export_para( ).
    def_post_invoice_export_parame( ).
    def_release_invoice_export_par( ).
    def_a_br_supplier_invoice_nf_2( ).
    def_a_suplr_invc_header_whld_2( ).
    def_a_suplr_invc_item_acct_a_2( ).
    def_a_suplr_invc_item_pur_or_2( ).
    def_a_suplr_invc_seld_inb_de_2( ).
    def_a_suplr_invc_seld_purg_d_2( ).
    def_a_suplr_invc_seld_srvc_e_2( ).
    def_a_suplr_invoice_addition_2( ).
    def_a_supplier_invoice_item__2( ).
    def_a_supplier_invoice_item__3( ).
    def_a_supplier_invoice_item__4( ).
    def_a_supplier_invoice_odntype( ).
    def_a_supplier_invoice_tax_typ( ).
    def_a_supplier_invoice_type( ).
    def_cancel( ).
    def_post( ).
    def_release( ).
    define_primitive_types( ).

  ENDMETHOD.


  METHOD def_cancel_invoice_export_para.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'CANCEL_INVOICE_EXPORT_PARA'
                                    is_structure              = VALUE tys_cancel_invoice_export_para( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'CancelInvoiceExportParameters' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'REVERSE_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'ReverseDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.

    lo_primitive_property = lo_complex_type->get_primitive_property( 'SUCCESS' ).
    lo_primitive_property->set_edm_name( 'Success' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_post_invoice_export_parame.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'POST_INVOICE_EXPORT_PARAME'
                                    is_structure              = VALUE tys_post_invoice_export_parame( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'PostInvoiceExportParameters' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'SUCCESS' ).
    lo_primitive_property->set_edm_name( 'Success' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_release_invoice_export_par.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_complex_type        TYPE REF TO /iwbep/if_v4_pm_cplx_type,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_complex_type = mo_model->create_complex_type_by_struct(
                                    iv_complex_type_name      = 'RELEASE_INVOICE_EXPORT_PAR'
                                    is_structure              = VALUE tys_release_invoice_export_par( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_complex_type->set_edm_name( 'ReleaseInvoiceExportParameters' ) ##NO_TEXT.


    lo_primitive_property = lo_complex_type->get_primitive_property( 'SUCCESS' ).
    lo_primitive_property->set_edm_name( 'Success' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_a_br_supplier_invoice_nf_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_BR_SUPPLIER_INVOICE_NF_2'
                                    is_structure              = VALUE tys_a_br_supplier_invoice_nf_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_BR_SupplierInvoiceNFDocumentType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_BR_SUPPLIER_INVOICE_NFDO' ).
    lo_entity_set->set_edm_name( 'A_BR_SupplierInvoiceNFDocument' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_NOTA_FISCAL' ).
    lo_primitive_property->set_edm_name( 'BR_NotaFiscal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_NFTYPE' ).
    lo_primitive_property->set_edm_name( 'BR_NFType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_NFSNUMBER' ).
    lo_primitive_property->set_edm_name( 'BR_NFSNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_NFSVERIFICATION_CODE' ).
    lo_primitive_property->set_edm_name( 'BR_NFSVerificationCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_NFAUTHZN_PROTOCOL_NUMBE' ).
    lo_primitive_property->set_edm_name( 'BR_NFAuthznProtocolNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_NFAUTHZN_PROTOCOL_NUM_2' ).
    lo_primitive_property->set_edm_name( 'BR_NFAuthznProtocolNumber16' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_NFAUTHENTICATION_DATE' ).
    lo_primitive_property->set_edm_name( 'BR_NFAuthenticationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_NFAUTHENTICATION_TIME' ).
    lo_primitive_property->set_edm_name( 'BR_NFAuthenticationTime' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'TimeOfDay' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'Time' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BR_NFE_RANDOM_NUMBER' ).
    lo_primitive_property->set_edm_name( 'BR_NFeRandomNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ISSUING_TYPE' ).
    lo_primitive_property->set_edm_name( 'IssuingType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_a_suplr_invc_header_whld_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_SUPLR_INVC_HEADER_WHLD_2'
                                    is_structure              = VALUE tys_a_suplr_invc_header_whld_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_SuplrInvcHeaderWhldgTaxType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_SUPLR_INVC_HEADER_WHLDG' ).
    lo_entity_set->set_edm_name( 'A_SuplrInvcHeaderWhldgTax' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WITHHOLDING_TAX_TYPE' ).
    lo_primitive_property->set_edm_name( 'WithholdingTaxType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WITHHOLDING_TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'WithholdingTaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WITHHOLDING_TAX_BASE_AMOUN' ).
    lo_primitive_property->set_edm_name( 'WithholdingTaxBaseAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANUALLY_ENTERED_WHLDG_TAX' ).
    lo_primitive_property->set_edm_name( 'ManuallyEnteredWhldgTaxAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WHLDG_TAX_IS_ENTERED_MANUA' ).
    lo_primitive_property->set_edm_name( 'WhldgTaxIsEnteredManually' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WHLDG_TAX_BASE_IS_ENTERED' ).
    lo_primitive_property->set_edm_name( 'WhldgTaxBaseIsEnteredManually' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_a_suplr_invc_item_acct_a_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_SUPLR_INVC_ITEM_ACCT_A_2'
                                    is_structure              = VALUE tys_a_suplr_invc_item_acct_a_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_SuplrInvcItemAcctAssgmtType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_SUPLR_INVC_ITEM_ACCT_ASS' ).
    lo_entity_set->set_edm_name( 'A_SuplrInvcItemAcctAssgmt' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_ITEM' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ORDINAL_NUMBER' ).
    lo_primitive_property->set_edm_name( 'OrdinalNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COST_CENTER' ).
    lo_primitive_property->set_edm_name( 'CostCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTROLLING_AREA' ).
    lo_primitive_property->set_edm_name( 'ControllingArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_AREA' ).
    lo_primitive_property->set_edm_name( 'BusinessArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFIT_CENTER' ).
    lo_primitive_property->set_edm_name( 'ProfitCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNCTIONAL_AREA' ).
    lo_primitive_property->set_edm_name( 'FunctionalArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLACCOUNT' ).
    lo_primitive_property->set_edm_name( 'GLAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'SalesOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COST_OBJECT' ).
    lo_primitive_property->set_edm_name( 'CostObject' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COST_CTR_ACTIVITY_TYPE' ).
    lo_primitive_property->set_edm_name( 'CostCtrActivityType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PROCESS' ).
    lo_primitive_property->set_edm_name( 'BusinessProcess' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBSELEMENT' ).
    lo_primitive_property->set_edm_name( 'WBSElement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_ACCT_ASSIGNMENT' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcAcctAssignmentAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_QUANTITY_UN' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_QTY_UNIT_SA' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderQtyUnitSAPCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_QTY_UNIT_IS' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderQtyUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY' ).
    lo_primitive_property->set_edm_name( 'Quantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCOUNT_ASSIGNMENT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'AccountAssignmentNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCOUNT_ASSIGNMENT_IS_UNPL' ).
    lo_primitive_property->set_edm_name( 'AccountAssignmentIsUnplanned' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERSONNEL_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PersonnelNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WORK_ITEM' ).
    lo_primitive_property->set_edm_name( 'WorkItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MASTER_FIXED_ASSET' ).
    lo_primitive_property->set_edm_name( 'MasterFixedAsset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXED_ASSET' ).
    lo_primitive_property->set_edm_name( 'FixedAsset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEBIT_CREDIT_CODE' ).
    lo_primitive_property->set_edm_name( 'DebitCreditCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTERNAL_ORDER' ).
    lo_primitive_property->set_edm_name( 'InternalOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROJECT_NETWORK_INTERNAL_I' ).
    lo_primitive_property->set_edm_name( 'ProjectNetworkInternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWORK_ACTIVITY_INTERNAL' ).
    lo_primitive_property->set_edm_name( 'NetworkActivityInternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROJECT_NETWORK' ).
    lo_primitive_property->set_edm_name( 'ProjectNetwork' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWORK_ACTIVITY' ).
    lo_primitive_property->set_edm_name( 'NetworkActivity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMMITMENT_ITEM' ).
    lo_primitive_property->set_edm_name( 'CommitmentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNDS_CENTER' ).
    lo_primitive_property->set_edm_name( 'FundsCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUND' ).
    lo_primitive_property->set_edm_name( 'Fund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_ID' ).
    lo_primitive_property->set_edm_name( 'GrantID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_BUSINESS_AREA' ).
    lo_primitive_property->set_edm_name( 'PartnerBusinessArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_CODE' ).
    lo_primitive_property->set_edm_name( 'CompanyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_ACCOUNT_ASSIGNM' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcAccountAssignmentText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_PRICE_UNIT' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderPriceUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_PRICE_UNI_2' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderPriceUnitSAPCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_PRICE_UNI_3' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderPriceUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY_IN_PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'QuantityInPurchaseOrderUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFITABILITY_SEGMENT' ).
    lo_primitive_property->set_edm_name( 'ProfitabilitySegment' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PERIOD' ).
    lo_primitive_property->set_edm_name( 'BudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_DETERMINATION_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxDeterminationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_a_suplr_invc_item_pur_or_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_SUPLR_INVC_ITEM_PUR_OR_2'
                                    is_structure              = VALUE tys_a_suplr_invc_item_pur_or_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_SuplrInvcItemPurOrdRefType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_SUPLR_INVC_ITEM_PUR_ORD' ).
    lo_entity_set->set_edm_name( 'A_SuplrInvcItemPurOrdRef' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_ITEM' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'ReferenceDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_DOCUMENT_FISCAL' ).
    lo_primitive_property->set_edm_name( 'ReferenceDocumentFiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REFERENCE_DOCUMENT_ITEM' ).
    lo_primitive_property->set_edm_name( 'ReferenceDocumentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_SUBSEQUENT_DEBIT_CREDIT' ).
    lo_primitive_property->set_edm_name( 'IsSubsequentDebitCredit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_ITEM_AMOU' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceItemAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_QUANTITY_UN' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderQuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_QTY_UNIT_SA' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderQtyUnitSAPCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_QTY_UNIT_IS' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderQtyUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY_IN_PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'QuantityInPurchaseOrderUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_PRICE_UNIT' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderPriceUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_PRICE_UNI_2' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderPriceUnitSAPCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_PRICE_UNI_3' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderPriceUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QTY_IN_PURCHASE_ORDER_PRIC' ).
    lo_primitive_property->set_edm_name( 'QtyInPurchaseOrderPriceUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_DELIVERY_COST_C' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcDeliveryCostCndnType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_DELIVERY_COST_2' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcDeliveryCostCndnStep' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_DELIVERY_COST_3' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcDeliveryCostCndnCount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_ITEM_TEXT' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceItemText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FREIGHT_SUPPLIER' ).
    lo_primitive_property->set_edm_name( 'FreightSupplier' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_NOT_CASH_DISCOUNT_LIABL' ).
    lo_primitive_property->set_edm_name( 'IsNotCashDiscountLiable' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASING_DOCUMENT_ITEM_C' ).
    lo_primitive_property->set_edm_name( 'PurchasingDocumentItemCategory' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PRODUCT_TYPE' ).
    lo_primitive_property->set_edm_name( 'ProductType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETENTION_AMOUNT_IN_DOC_CU' ).
    lo_primitive_property->set_edm_name( 'RetentionAmountInDocCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETENTION_PERCENTAGE' ).
    lo_primitive_property->set_edm_name( 'RetentionPercentage' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETENTION_DUE_DATE' ).
    lo_primitive_property->set_edm_name( 'RetentionDueDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_ITM_IS_NOT_RLVT' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcItmIsNotRlvtForRtntn' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_ENTRY_SHEET' ).
    lo_primitive_property->set_edm_name( 'ServiceEntrySheet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_ENTRY_SHEET_ITEM' ).
    lo_primitive_property->set_edm_name( 'ServiceEntrySheetItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_FINALLY_INVOICED' ).
    lo_primitive_property->set_edm_name( 'IsFinallyInvoiced' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_DETERMINATION_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxDeterminationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IN_HSNOR_SACCODE' ).
    lo_primitive_property->set_edm_name( 'IN_HSNOrSACCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IN_CUSTOM_DUTY_ASSESSABLE' ).
    lo_primitive_property->set_edm_name( 'IN_CustomDutyAssessableValue' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NL_CHAIN_LIABILITY_START_D' ).
    lo_primitive_property->set_edm_name( 'NL_ChainLiabilityStartDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NL_CHAIN_LIABILITY_END_DAT' ).
    lo_primitive_property->set_edm_name( 'NL_ChainLiabilityEndDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NL_CHAIN_LIABILITY_DESCRIP' ).
    lo_primitive_property->set_edm_name( 'NL_ChainLiabilityDescription' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NL_CHAIN_LBLTY_CNSTRCTN_SI' ).
    lo_primitive_property->set_edm_name( 'NL_ChainLbltyCnstrctnSiteDesc' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NL_CHAIN_LIABILITY_DURATIO' ).
    lo_primitive_property->set_edm_name( 'NL_ChainLiabilityDuration' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NL_CHAIN_LIABILITY_PERCENT' ).
    lo_primitive_property->set_edm_name( 'NL_ChainLiabilityPercent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SUPPLIER_INVOICE_ITM_AC' ).
    lo_navigation_property->set_edm_name( 'to_SupplierInvoiceItmAcctAssgmt' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_SUPLR_INVC_ITEM_ACCT_A_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_a_suplr_invc_seld_inb_de_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_SUPLR_INVC_SELD_INB_DE_2'
                                    is_structure              = VALUE tys_a_suplr_invc_seld_inb_de_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_SuplrInvcSeldInbDeliveryNoteType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_SUPLR_INVC_SELD_INB_DELI' ).
    lo_entity_set->set_edm_name( 'A_SuplrInvcSeldInbDeliveryNote' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INBOUND_DELIVERY_NOTE' ).
    lo_primitive_property->set_edm_name( 'InboundDeliveryNote' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

  ENDMETHOD.


  METHOD def_a_suplr_invc_seld_purg_d_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_SUPLR_INVC_SELD_PURG_D_2'
                                    is_structure              = VALUE tys_a_suplr_invc_seld_purg_d_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_SuplrInvcSeldPurgDocumentType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_SUPLR_INVC_SELD_PURG_DOC' ).
    lo_entity_set->set_edm_name( 'A_SuplrInvcSeldPurgDocument' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PURCHASE_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'PurchaseOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

  ENDMETHOD.


  METHOD def_a_suplr_invc_seld_srvc_e_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_SUPLR_INVC_SELD_SRVC_E_2'
                                    is_structure              = VALUE tys_a_suplr_invc_seld_srvc_e_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_SuplrInvcSeldSrvcEntrShtLeanType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_SUPLR_INVC_SELD_SRVC_ENT' ).
    lo_entity_set->set_edm_name( 'A_SuplrInvcSeldSrvcEntrShtLean' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_ENTRY_SHEET' ).
    lo_primitive_property->set_edm_name( 'ServiceEntrySheet' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_ENTRY_SHEET_ITEM' ).
    lo_primitive_property->set_edm_name( 'ServiceEntrySheetItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

  ENDMETHOD.


  METHOD def_a_suplr_invoice_addition_2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_SUPLR_INVOICE_ADDITION_2'
                                    is_structure              = VALUE tys_a_suplr_invoice_addition_2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_SuplrInvoiceAdditionalDataType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_SUPLR_INVOICE_ADDITIONAL' ).
    lo_entity_set->set_edm_name( 'A_SuplrInvoiceAdditionalData' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PARTY_NAME_1' ).
    lo_primitive_property->set_edm_name( 'InvoicingPartyName1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PARTY_NAME_2' ).
    lo_primitive_property->set_edm_name( 'InvoicingPartyName2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PARTY_NAME_3' ).
    lo_primitive_property->set_edm_name( 'InvoicingPartyName3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PARTY_NAME_4' ).
    lo_primitive_property->set_edm_name( 'InvoicingPartyName4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'PostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CITY_NAME' ).
    lo_primitive_property->set_edm_name( 'CityName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COUNTRY' ).
    lo_primitive_property->set_edm_name( 'Country' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STREET_ADDRESS_NAME' ).
    lo_primitive_property->set_edm_name( 'StreetAddressName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 35 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX' ).
    lo_primitive_property->set_edm_name( 'POBox' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POBOX_POSTAL_CODE' ).
    lo_primitive_property->set_edm_name( 'POBoxPostalCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POST_OFFICE_BANK_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'PostOfficeBankAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'BankAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK' ).
    lo_primitive_property->set_edm_name( 'Bank' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'BankCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_ID_1' ).
    lo_primitive_property->set_edm_name( 'TaxID1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_ID_2' ).
    lo_primitive_property->set_edm_name( 'TaxID2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_ID_3' ).
    lo_primitive_property->set_edm_name( 'TaxID3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_ID_4' ).
    lo_primitive_property->set_edm_name( 'TaxID4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_ID_5' ).
    lo_primitive_property->set_edm_name( 'TaxID5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 60 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ONE_TME_ACCOUNT_IS_VATLIAB' ).
    lo_primitive_property->set_edm_name( 'OneTmeAccountIsVATLiable' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ONE_TME_ACCT_IS_EQUALIZATI' ).
    lo_primitive_property->set_edm_name( 'OneTmeAcctIsEqualizationTxSubj' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REGION' ).
    lo_primitive_property->set_edm_name( 'Region' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_CONTROL_KEY' ).
    lo_primitive_property->set_edm_name( 'BankControlKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATA_EXCHANGE_INSTRUCTION' ).
    lo_primitive_property->set_edm_name( 'DataExchangeInstructionKey' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DATA_MEDIUM_EXCHANGE_INDIC' ).
    lo_primitive_property->set_edm_name( 'DataMediumExchangeIndicator' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'LANGUAGE_CODE' ).
    lo_primitive_property->set_edm_name( 'LanguageCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_ONE_TIME_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'IsOneTimeAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_RECIPIENT' ).
    lo_primitive_property->set_edm_name( 'PaymentRecipient' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCOUNT_TAX_TYPE' ).
    lo_primitive_property->set_edm_name( 'AccountTaxType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_NUMBER_TYPE' ).
    lo_primitive_property->set_edm_name( 'TaxNumberType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_NATURAL_PERSON' ).
    lo_primitive_property->set_edm_name( 'IsNaturalPerson' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BANK_DETAIL_REFERENCE' ).
    lo_primitive_property->set_edm_name( 'BankDetailReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REPRESENTATIVE_NAME' ).
    lo_primitive_property->set_edm_name( 'RepresentativeName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_TYPE' ).
    lo_primitive_property->set_edm_name( 'BusinessType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INDUSTRY_TYPE' ).
    lo_primitive_property->set_edm_name( 'IndustryType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FORM_OF_ADDRESS_NAME' ).
    lo_primitive_property->set_edm_name( 'FormOfAddressName' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VATREGISTRATION' ).
    lo_primitive_property->set_edm_name( 'VATRegistration' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ONE_TIME_ACCT_CNTRY_SPECIF' ).
    lo_primitive_property->set_edm_name( 'OneTimeAcctCntrySpecificRef1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 140 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IBAN' ).
    lo_primitive_property->set_edm_name( 'IBAN' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 34 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SWIFTCODE' ).
    lo_primitive_property->set_edm_name( 'SWIFTCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ONE_TIME_BUSINESS_PARTNER' ).
    lo_primitive_property->set_edm_name( 'OneTimeBusinessPartnerEmail' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 130 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_a_supplier_invoice_item__2.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_SUPPLIER_INVOICE_ITEM__2'
                                    is_structure              = VALUE tys_a_supplier_invoice_item__2( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_SupplierInvoiceItemAssetType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_SUPPLIER_INVOICE_ITEM_AS' ).
    lo_entity_set->set_edm_name( 'A_SupplierInvoiceItemAsset' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_ITEM' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_CODE' ).
    lo_primitive_property->set_edm_name( 'CompanyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MASTER_FIXED_ASSET' ).
    lo_primitive_property->set_edm_name( 'MasterFixedAsset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXED_ASSET' ).
    lo_primitive_property->set_edm_name( 'FixedAsset' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFIT_CENTER' ).
    lo_primitive_property->set_edm_name( 'ProfitCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLACCOUNT' ).
    lo_primitive_property->set_edm_name( 'GLAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_ITEM_AMOU' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceItemAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_DETERMINATION_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxDeterminationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEBIT_CREDIT_CODE' ).
    lo_primitive_property->set_edm_name( 'DebitCreditCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_ITEM_TEXT' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceItemText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ASSIGNMENT_REFERENCE' ).
    lo_primitive_property->set_edm_name( 'AssignmentReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_NOT_CASH_DISCOUNT_LIABL' ).
    lo_primitive_property->set_edm_name( 'IsNotCashDiscountLiable' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ASSET_VALUE_DATE' ).
    lo_primitive_property->set_edm_name( 'AssetValueDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY_UNIT' ).
    lo_primitive_property->set_edm_name( 'QuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_ITM_QTY_UNIT_SA' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcItmQtyUnitSAPCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_ITM_QTY_UNIT_IS' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcItmQtyUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY' ).
    lo_primitive_property->set_edm_name( 'Quantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_a_supplier_invoice_item__3.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_SUPPLIER_INVOICE_ITEM__3'
                                    is_structure              = VALUE tys_a_supplier_invoice_item__3( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_SupplierInvoiceItemGLAcctType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_SUPPLIER_INVOICE_ITEM_GL' ).
    lo_entity_set->set_edm_name( 'A_SupplierInvoiceItemGLAcct' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_ITEM' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_CODE' ).
    lo_primitive_property->set_edm_name( 'CompanyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COST_CENTER' ).
    lo_primitive_property->set_edm_name( 'CostCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CONTROLLING_AREA' ).
    lo_primitive_property->set_edm_name( 'ControllingArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_AREA' ).
    lo_primitive_property->set_edm_name( 'BusinessArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROFIT_CENTER' ).
    lo_primitive_property->set_edm_name( 'ProfitCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNCTIONAL_AREA' ).
    lo_primitive_property->set_edm_name( 'FunctionalArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GLACCOUNT' ).
    lo_primitive_property->set_edm_name( 'GLAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER' ).
    lo_primitive_property->set_edm_name( 'SalesOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SALES_ORDER_ITEM' ).
    lo_primitive_property->set_edm_name( 'SalesOrderItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COST_OBJECT' ).
    lo_primitive_property->set_edm_name( 'CostObject' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COST_CTR_ACTIVITY_TYPE' ).
    lo_primitive_property->set_edm_name( 'CostCtrActivityType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PROCESS' ).
    lo_primitive_property->set_edm_name( 'BusinessProcess' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WBSELEMENT' ).
    lo_primitive_property->set_edm_name( 'WBSElement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_ITEM_AMOU' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceItemAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PERSONNEL_NUMBER' ).
    lo_primitive_property->set_edm_name( 'PersonnelNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 8 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'WORK_ITEM' ).
    lo_primitive_property->set_edm_name( 'WorkItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEBIT_CREDIT_CODE' ).
    lo_primitive_property->set_edm_name( 'DebitCreditCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_ITEM_TEXT' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceItemText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ASSIGNMENT_REFERENCE' ).
    lo_primitive_property->set_edm_name( 'AssignmentReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_NOT_CASH_DISCOUNT_LIABL' ).
    lo_primitive_property->set_edm_name( 'IsNotCashDiscountLiable' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INTERNAL_ORDER' ).
    lo_primitive_property->set_edm_name( 'InternalOrder' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PROJECT_NETWORK' ).
    lo_primitive_property->set_edm_name( 'ProjectNetwork' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 12 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NETWORK_ACTIVITY' ).
    lo_primitive_property->set_edm_name( 'NetworkActivity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMMITMENT_ITEM' ).
    lo_primitive_property->set_edm_name( 'CommitmentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 24 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUNDS_CENTER' ).
    lo_primitive_property->set_edm_name( 'FundsCenter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_BASE_AMOUNT_IN_TRANS_C' ).
    lo_primitive_property->set_edm_name( 'TaxBaseAmountInTransCrcy' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FUND' ).
    lo_primitive_property->set_edm_name( 'Fund' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'GRANT_ID' ).
    lo_primitive_property->set_edm_name( 'GrantID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY_UNIT' ).
    lo_primitive_property->set_edm_name( 'QuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_ITM_QTY_UNIT_SA' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcItmQtyUnitSAPCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_ITM_QTY_UNIT_IS' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcItmQtyUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY' ).
    lo_primitive_property->set_edm_name( 'Quantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PARTNER_BUSINESS_AREA' ).
    lo_primitive_property->set_edm_name( 'PartnerBusinessArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FINANCIAL_TRANSACTION_TYPE' ).
    lo_primitive_property->set_edm_name( 'FinancialTransactionType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EARMARKED_FUNDS_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'EarmarkedFundsDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'EARMARKED_FUNDS_DOCUMENT_I' ).
    lo_primitive_property->set_edm_name( 'EarmarkedFundsDocumentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUDGET_PERIOD' ).
    lo_primitive_property->set_edm_name( 'BudgetPeriod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'ServiceDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_DOCUMENT_ITEM' ).
    lo_primitive_property->set_edm_name( 'ServiceDocumentItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SERVICE_DOCUMENT_TYPE' ).
    lo_primitive_property->set_edm_name( 'ServiceDocumentType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_a_supplier_invoice_item__4.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_SUPPLIER_INVOICE_ITEM__4'
                                    is_structure              = VALUE tys_a_supplier_invoice_item__4( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_SupplierInvoiceItemMaterialType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_SUPPLIER_INVOICE_ITEM_MA' ).
    lo_entity_set->set_edm_name( 'A_SupplierInvoiceItemMaterial' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_ITEM' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceItem' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MATERIAL' ).
    lo_primitive_property->set_edm_name( 'Material' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'VALUATION_AREA' ).
    lo_primitive_property->set_edm_name( 'ValuationArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_CODE' ).
    lo_primitive_property->set_edm_name( 'CompanyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PLANT' ).
    lo_primitive_property->set_edm_name( 'Plant' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVENTORY_VALUATION_TYPE' ).
    lo_primitive_property->set_edm_name( 'InventoryValuationType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_DETERMINATION_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxDeterminationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_ITEM_AMOU' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceItemAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY_UNIT' ).
    lo_primitive_property->set_edm_name( 'QuantityUnit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_ITM_QTY_UNIT_SA' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcItmQtyUnitSAPCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_ITM_QTY_UNIT_IS' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcItmQtyUnitISOCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'QUANTITY' ).
    lo_primitive_property->set_edm_name( 'Quantity' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 13 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DEBIT_CREDIT_CODE' ).
    lo_primitive_property->set_edm_name( 'DebitCreditCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_NOT_CASH_DISCOUNT_LIABL' ).
    lo_primitive_property->set_edm_name( 'IsNotCashDiscountLiable' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_a_supplier_invoice_odntype.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_SUPPLIER_INVOICE_ODNTYPE'
                                    is_structure              = VALUE tys_a_supplier_invoice_odntype( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_SupplierInvoiceODNType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_SUPPLIER_INVOICE_ODN' ).
    lo_entity_set->set_edm_name( 'A_SupplierInvoiceODN' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'AFDFUNIQUE_KEY_UUID' ).
    lo_primitive_property->set_edm_name( 'AFDFUniqueKeyUUID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Guid' ) ##NO_TEXT.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OFFICIAL_DOCUMENT_NUMBER_C' ).
    lo_primitive_property->set_edm_name( 'OfficialDocumentNumberCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OFFICIAL_DOCUMENT_NUMBER_T' ).
    lo_primitive_property->set_edm_name( 'OfficialDocumentNumberType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OFFICIAL_DOCUMENT_NUMBER' ).
    lo_primitive_property->set_edm_name( 'OfficialDocumentNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 200 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ODNLEGAL_DATE_TIME_TEXT' ).
    lo_primitive_property->set_edm_name( 'ODNLegalDateTimeText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'OFFICIAL_DOCUMENT_NUMBER_I' ).
    lo_primitive_property->set_edm_name( 'OfficialDocumentNumberIntType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

  ENDMETHOD.


  METHOD def_a_supplier_invoice_tax_typ.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_SUPPLIER_INVOICE_TAX_TYP'
                                    is_structure              = VALUE tys_a_supplier_invoice_tax_typ( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_SupplierInvoiceTaxType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_SUPPLIER_INVOICE_TAX' ).
    lo_entity_set->set_edm_name( 'A_SupplierInvoiceTax' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_CODE' ).
    lo_primitive_property->set_edm_name( 'TaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_TAX_COUNT' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceTaxCounter' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 6 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'TaxAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_BASE_AMOUNT_IN_TRANS_C' ).
    lo_primitive_property->set_edm_name( 'TaxBaseAmountInTransCrcy' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_JURISDICTION' ).
    lo_primitive_property->set_edm_name( 'TaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'TaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_DETERMINATION_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxDeterminationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_RATE_VALIDITY_START_DA' ).
    lo_primitive_property->set_edm_name( 'TaxRateValidityStartDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

  ENDMETHOD.


  METHOD def_a_supplier_invoice_type.

    DATA:
      lo_complex_property    TYPE REF TO /iwbep/if_v4_pm_cplx_prop,
      lo_entity_type         TYPE REF TO /iwbep/if_v4_pm_entity_type,
      lo_entity_set          TYPE REF TO /iwbep/if_v4_pm_entity_set,
      lo_navigation_property TYPE REF TO /iwbep/if_v4_pm_nav_prop,
      lo_primitive_property  TYPE REF TO /iwbep/if_v4_pm_prim_prop.


    lo_entity_type = mo_model->create_entity_type_by_struct(
                                    iv_entity_type_name       = 'A_SUPPLIER_INVOICE_TYPE'
                                    is_structure              = VALUE tys_a_supplier_invoice_type( )
                                    iv_do_gen_prim_props         = abap_true
                                    iv_do_gen_prim_prop_colls    = abap_true
                                    iv_do_add_conv_to_prim_props = abap_true ).

    lo_entity_type->set_edm_name( 'A_SupplierInvoiceType' ) ##NO_TEXT.


    lo_entity_set = lo_entity_type->create_entity_set( 'A_SUPPLIER_INVOICE' ).
    lo_entity_set->set_edm_name( 'A_SupplierInvoice' ) ##NO_TEXT.


    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FISCAL_YEAR' ).
    lo_primitive_property->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_key( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'COMPANY_CODE' ).
    lo_primitive_property->set_edm_name( 'CompanyCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_DATE' ).
    lo_primitive_property->set_edm_name( 'DocumentDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'POSTING_DATE' ).
    lo_primitive_property->set_edm_name( 'PostingDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CREATION_DATE' ).
    lo_primitive_property->set_edm_name( 'CreationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_LST_CHG_DTE_TME' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcLstChgDteTmeTxt' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 23 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_IDBY_INVC' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceIDByInvcgParty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 16 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICING_PARTY' ).
    lo_primitive_property->set_edm_name( 'InvoicingParty' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_CURRENCY' ).
    lo_primitive_property->set_edm_name( 'DocumentCurrency' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_GROSS_AMOUNT' ).
    lo_primitive_property->set_edm_name( 'InvoiceGrossAmount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNPLANNED_DELIVERY_COST' ).
    lo_primitive_property->set_edm_name( 'UnplannedDeliveryCost' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DOCUMENT_HEADER_TEXT' ).
    lo_primitive_property->set_edm_name( 'DocumentHeaderText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RECONCILIATION_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'ReconciliationAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'MANUAL_CASH_DISCOUNT' ).
    lo_primitive_property->set_edm_name( 'ManualCashDiscount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 14 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_TERMS' ).
    lo_primitive_property->set_edm_name( 'PaymentTerms' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DUE_CALCULATION_BASE_DATE' ).
    lo_primitive_property->set_edm_name( 'DueCalculationBaseDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_1_PERCENT' ).
    lo_primitive_property->set_edm_name( 'CashDiscount1Percent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_1_DAYS' ).
    lo_primitive_property->set_edm_name( 'CashDiscount1Days' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_2_PERCENT' ).
    lo_primitive_property->set_edm_name( 'CashDiscount2Percent' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'CASH_DISCOUNT_2_DAYS' ).
    lo_primitive_property->set_edm_name( 'CashDiscount2Days' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'NET_PAYMENT_DAYS' ).
    lo_primitive_property->set_edm_name( 'NetPaymentDays' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_BLOCKING_REASON' ).
    lo_primitive_property->set_edm_name( 'PaymentBlockingReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ACCOUNTING_DOCUMENT_TYPE' ).
    lo_primitive_property->set_edm_name( 'AccountingDocumentType' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BPBANK_ACCOUNT_INTERNAL_ID' ).
    lo_primitive_property->set_edm_name( 'BPBankAccountInternalID' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_STATUS' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INDIRECT_QUOTED_EXCHANGE_R' ).
    lo_primitive_property->set_edm_name( 'IndirectQuotedExchangeRate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DIRECT_QUOTED_EXCHANGE_RAT' ).
    lo_primitive_property->set_edm_name( 'DirectQuotedExchangeRate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Decimal' ) ##NO_TEXT.
    lo_primitive_property->set_precision( 9 ) ##NUMBER_OK.
    lo_primitive_property->set_scale( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'STATE_CENTRAL_BANK_PAYMENT' ).
    lo_primitive_property->set_edm_name( 'StateCentralBankPaymentReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLYING_COUNTRY' ).
    lo_primitive_property->set_edm_name( 'SupplyingCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_METHOD' ).
    lo_primitive_property->set_edm_name( 'PaymentMethod' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_METHOD_SUPPLEMENT' ).
    lo_primitive_property->set_edm_name( 'PaymentMethodSupplement' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_REFERENCE' ).
    lo_primitive_property->set_edm_name( 'PaymentReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 30 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_REFERENCE' ).
    lo_primitive_property->set_edm_name( 'InvoiceReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_REFERENCE_FISCAL_Y' ).
    lo_primitive_property->set_edm_name( 'InvoiceReferenceFiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'FIXED_CASH_DISCOUNT' ).
    lo_primitive_property->set_edm_name( 'FixedCashDiscount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNPLANNED_DELIVERY_COST_TA' ).
    lo_primitive_property->set_edm_name( 'UnplannedDeliveryCostTaxCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNPLND_DELIV_COST_TAX_JURI' ).
    lo_primitive_property->set_edm_name( 'UnplndDelivCostTaxJurisdiction' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 15 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'UNPLND_DELIVERY_COST_TAX_C' ).
    lo_primitive_property->set_edm_name( 'UnplndDeliveryCostTaxCountry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ASSIGNMENT_REFERENCE' ).
    lo_primitive_property->set_edm_name( 'AssignmentReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 18 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_POSTING_LINE_ITEM' ).
    lo_primitive_property->set_edm_name( 'SupplierPostingLineItemText' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_IS_CALCULATED_AUTOMATI' ).
    lo_primitive_property->set_edm_name( 'TaxIsCalculatedAutomatically' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_PLACE' ).
    lo_primitive_property->set_edm_name( 'BusinessPlace' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_SECTION_CODE' ).
    lo_primitive_property->set_edm_name( 'BusinessSectionCode' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'BUSINESS_AREA' ).
    lo_primitive_property->set_edm_name( 'BusinessArea' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_IS_CAPITAL_GOOD' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcIsCapitalGoodsRelated' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_IS_CREDIT' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceIsCreditMemo' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYT_SLIP_WTH_REF_SUBSCRIB' ).
    lo_primitive_property->set_edm_name( 'PaytSlipWthRefSubscriber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 11 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYT_SLIP_WTH_REF_CHECK_DI' ).
    lo_primitive_property->set_edm_name( 'PaytSlipWthRefCheckDigit' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 2 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYT_SLIP_WTH_REF_REFERENC' ).
    lo_primitive_property->set_edm_name( 'PaytSlipWthRefReference' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 27 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_DETERMINATION_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxDeterminationDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_REPORTING_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxReportingDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'TAX_FULFILLMENT_DATE' ).
    lo_primitive_property->set_edm_name( 'TaxFulfillmentDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'INVOICE_RECEIPT_DATE' ).
    lo_primitive_property->set_edm_name( 'InvoiceReceiptDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'DELIVERY_OF_GOODS_REPORTIN' ).
    lo_primitive_property->set_edm_name( 'DeliveryOfGoodsReportingCntry' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_VATREGISTRATION' ).
    lo_primitive_property->set_edm_name( 'SupplierVATRegistration' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_EUTRIANGULAR_DEAL' ).
    lo_primitive_property->set_edm_name( 'IsEUTriangularDeal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_DEBIT_CRDT_CODE' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcDebitCrdtCodeDelivery' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPLR_INVC_DEBIT_CRDT_CO_2' ).
    lo_primitive_property->set_edm_name( 'SuplrInvcDebitCrdtCodeReturns' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'RETENTION_DUE_DATE' ).
    lo_primitive_property->set_edm_name( 'RetentionDueDate' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'PAYMENT_REASON' ).
    lo_primitive_property->set_edm_name( 'PaymentReason' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_BANK' ).
    lo_primitive_property->set_edm_name( 'HouseBank' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'HOUSE_BANK_ACCOUNT' ).
    lo_primitive_property->set_edm_name( 'HouseBankAccount' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 5 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'ALTERNATIVE_PAYEE_PAYER' ).
    lo_primitive_property->set_edm_name( 'AlternativePayeePayer' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_ORIGIN' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceOrigin' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 1 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REVERSE_DOCUMENT' ).
    lo_primitive_property->set_edm_name( 'ReverseDocument' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'REVERSE_DOCUMENT_FISCAL_YE' ).
    lo_primitive_property->set_edm_name( 'ReverseDocumentFiscalYear' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 4 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_REVERSAL' ).
    lo_primitive_property->set_edm_name( 'IsReversal' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IS_REVERSED' ).
    lo_primitive_property->set_edm_name( 'IsReversed' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_PAYMENT_S' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoicePaymentStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 20 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'SUPPLIER_INVOICE_APPROVAL' ).
    lo_primitive_property->set_edm_name( 'SupplierInvoiceApprovalStatus' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 40 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IN_GSTPARTNER' ).
    lo_primitive_property->set_edm_name( 'IN_GSTPartner' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IN_GSTPLACE_OF_SUPPLY' ).
    lo_primitive_property->set_edm_name( 'IN_GSTPlaceOfSupply' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 3 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'IN_INVOICE_REFERENCE_NUMBE' ).
    lo_primitive_property->set_edm_name( 'IN_InvoiceReferenceNumber' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 64 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JRNL_ENTRY_CNTRY_SPECIFIC' ).
    lo_primitive_property->set_edm_name( 'JrnlEntryCntrySpecificRef1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 80 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JRNL_ENTRY_CNTRY_SPECIFI_2' ).
    lo_primitive_property->set_edm_name( 'JrnlEntryCntrySpecificDate1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JRNL_ENTRY_CNTRY_SPECIFI_3' ).
    lo_primitive_property->set_edm_name( 'JrnlEntryCntrySpecificRef2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JRNL_ENTRY_CNTRY_SPECIFI_4' ).
    lo_primitive_property->set_edm_name( 'JrnlEntryCntrySpecificDate2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JRNL_ENTRY_CNTRY_SPECIFI_5' ).
    lo_primitive_property->set_edm_name( 'JrnlEntryCntrySpecificRef3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 25 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JRNL_ENTRY_CNTRY_SPECIFI_6' ).
    lo_primitive_property->set_edm_name( 'JrnlEntryCntrySpecificDate3' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JRNL_ENTRY_CNTRY_SPECIFI_7' ).
    lo_primitive_property->set_edm_name( 'JrnlEntryCntrySpecificRef4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JRNL_ENTRY_CNTRY_SPECIFI_8' ).
    lo_primitive_property->set_edm_name( 'JrnlEntryCntrySpecificDate4' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JRNL_ENTRY_CNTRY_SPECIFI_9' ).
    lo_primitive_property->set_edm_name( 'JrnlEntryCntrySpecificRef5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 50 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JRNL_ENTRY_CNTRY_SPECIF_10' ).
    lo_primitive_property->set_edm_name( 'JrnlEntryCntrySpecificDate5' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'Date' ) ##NO_TEXT.
    lo_primitive_property->set_is_nullable( ).
    lo_primitive_property->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JRNL_ENTRY_CNTRY_SPECIF_11' ).
    lo_primitive_property->set_edm_name( 'JrnlEntryCntrySpecificBP1' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_primitive_property = lo_entity_type->get_primitive_property( 'JRNL_ENTRY_CNTRY_SPECIF_12' ).
    lo_primitive_property->set_edm_name( 'JrnlEntryCntrySpecificBP2' ) ##NO_TEXT.
    lo_primitive_property->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_property->set_max_length( 10 ) ##NUMBER_OK.
    lo_primitive_property->set_is_nullable( ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_BR_SUPPLIER_INVOICE_NFD' ).
    lo_navigation_property->set_edm_name( 'to_BR_SupplierInvoiceNFDocument' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_BR_SUPPLIER_INVOICE_NF_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SELECTED_DELIVERY_NOTES' ).
    lo_navigation_property->set_edm_name( 'to_SelectedDeliveryNotes' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_SUPLR_INVC_SELD_INB_DE_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SELECTED_PURCHASE_ORDER' ).
    lo_navigation_property->set_edm_name( 'to_SelectedPurchaseOrders' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_SUPLR_INVC_SELD_PURG_D_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SELECTED_SERVICE_ENTRY' ).
    lo_navigation_property->set_edm_name( 'to_SelectedServiceEntrySheets' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_SUPLR_INVC_SELD_SRVC_E_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SUPLR_INVC_ITEM_ASSET' ).
    lo_navigation_property->set_edm_name( 'to_SuplrInvcItemAsset' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_SUPPLIER_INVOICE_ITEM__2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SUPLR_INVC_ITEM_MATERIA' ).
    lo_navigation_property->set_edm_name( 'to_SuplrInvcItemMaterial' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_SUPPLIER_INVOICE_ITEM__4' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SUPLR_INVC_ITEM_PUR_ORD' ).
    lo_navigation_property->set_edm_name( 'to_SuplrInvcItemPurOrdRef' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_SUPLR_INVC_ITEM_PUR_OR_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SUPLR_INVOICE_ADDITIONA' ).
    lo_navigation_property->set_edm_name( 'to_SuplrInvoiceAdditionalData' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_SUPLR_INVOICE_ADDITION_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_one ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SUPPLIER_INVOICE_ITEM_G' ).
    lo_navigation_property->set_edm_name( 'to_SupplierInvoiceItemGLAcct' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_SUPPLIER_INVOICE_ITEM__3' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SUPPLIER_INVOICE_ODN' ).
    lo_navigation_property->set_edm_name( 'to_SupplierInvoiceODN' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_SUPPLIER_INVOICE_ODNTYPE' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SUPPLIER_INVOICE_TAX' ).
    lo_navigation_property->set_edm_name( 'to_SupplierInvoiceTax' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_SUPPLIER_INVOICE_TAX_TYP' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

    lo_navigation_property = lo_entity_type->create_navigation_property( 'TO_SUPPLIER_INVOICE_WHLDG' ).
    lo_navigation_property->set_edm_name( 'to_SupplierInvoiceWhldgTax' ) ##NO_TEXT.
    lo_navigation_property->set_target_entity_type_name( 'A_SUPLR_INVC_HEADER_WHLD_2' ).
    lo_navigation_property->set_target_multiplicity( /iwbep/if_v4_pm_types=>gcs_nav_multiplicity-to_many_optional ).

  ENDMETHOD.


  METHOD def_cancel.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'CANCEL' ).
    lo_function->set_edm_name( 'Cancel' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_1( ) ).

    lo_function_import = lo_function->create_function_import( 'CANCEL' ).
    lo_function_import->set_edm_name( 'Cancel' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'POST' ).


    lo_parameter = lo_function->create_parameter( 'POSTING_DATE' ).
    lo_parameter->set_edm_name( 'PostingDate' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'POSTING_DATE' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'REVERSAL_REASON' ).
    lo_parameter->set_edm_name( 'ReversalReason' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'REVERSAL_REASON' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'FISCAL_YEAR' ).
    lo_parameter->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'FISCAL_YEAR_3' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'SUPPLIER_INVOICE' ).
    lo_parameter->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SUPPLIER_INVOICE_3' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_complex_type( 'CANCEL_INVOICE_EXPORT_PARA' ).

  ENDMETHOD.


  METHOD def_post.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'POST' ).
    lo_function->set_edm_name( 'Post' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_2( ) ).

    lo_function_import = lo_function->create_function_import( 'POST' ).
    lo_function_import->set_edm_name( 'Post' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'POST' ).


    lo_parameter = lo_function->create_parameter( 'SUPPLIER_INVOICE' ).
    lo_parameter->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SUPPLIER_INVOICE' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'FISCAL_YEAR' ).
    lo_parameter->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'FISCAL_YEAR' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_complex_type( 'POST_INVOICE_EXPORT_PARAME' ).

  ENDMETHOD.


  METHOD def_release.

    DATA:
      lo_function        TYPE REF TO /iwbep/if_v4_pm_function,
      lo_function_import TYPE REF TO /iwbep/if_v4_pm_func_imp,
      lo_parameter       TYPE REF TO /iwbep/if_v4_pm_func_param,
      lo_return          TYPE REF TO /iwbep/if_v4_pm_func_return.


    lo_function = mo_model->create_function( 'RELEASE' ).
    lo_function->set_edm_name( 'Release' ) ##NO_TEXT.

    " Name of the runtime structure that represents the parameters of this operation
    lo_function->/iwbep/if_v4_pm_fu_advanced~set_parameter_structure_info( VALUE tys_parameters_3( ) ).

    lo_function_import = lo_function->create_function_import( 'RELEASE' ).
    lo_function_import->set_edm_name( 'Release' ) ##NO_TEXT.
    lo_function_import->/iwbep/if_v4_pm_func_imp_v2~set_http_method( 'POST' ).


    lo_parameter = lo_function->create_parameter( 'SUPPLIER_INVOICE' ).
    lo_parameter->set_edm_name( 'SupplierInvoice' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'SUPPLIER_INVOICE_2' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'FISCAL_YEAR' ).
    lo_parameter->set_edm_name( 'FiscalYear' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'FISCAL_YEAR_2' ).
    lo_parameter->set_is_nullable( ).

    lo_parameter = lo_function->create_parameter( 'DISCOUNT_DAYS_HAVE_TO_BE_S' ).
    lo_parameter->set_edm_name( 'DiscountDaysHaveToBeShifted' ) ##NO_TEXT.
    lo_parameter->set_primitive_type( 'DISCOUNT_DAYS_HAVE_TO_BE_S' ).
    lo_parameter->set_is_nullable( ).

    lo_return = lo_function->create_return( ).
    lo_return->set_complex_type( 'RELEASE_INVOICE_EXPORT_PAR' ).

  ENDMETHOD.


  METHOD define_primitive_types.

    DATA lo_primitive_type TYPE REF TO /iwbep/if_v4_pm_prim_type.


    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'DISCOUNT_DAYS_HAVE_TO_BE_S'
                            iv_element             = VALUE tys_types_for_prim_types-discount_days_have_to_be_s( ) ).
    lo_primitive_type->set_edm_type( 'Boolean' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'FISCAL_YEAR'
                            iv_element             = VALUE tys_types_for_prim_types-fiscal_year( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'FISCAL_YEAR_2'
                            iv_element             = VALUE tys_types_for_prim_types-fiscal_year_2( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'FISCAL_YEAR_3'
                            iv_element             = VALUE tys_types_for_prim_types-fiscal_year_3( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'POSTING_DATE'
                            iv_element             = VALUE tys_types_for_prim_types-posting_date( ) ).
    lo_primitive_type->set_edm_type( 'DateTimeOffset' ) ##NO_TEXT.
    lo_primitive_type->set_edm_type_v2( 'DateTime' ) ##NO_TEXT.

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'REVERSAL_REASON'
                            iv_element             = VALUE tys_types_for_prim_types-reversal_reason( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SUPPLIER_INVOICE'
                            iv_element             = VALUE tys_types_for_prim_types-supplier_invoice( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SUPPLIER_INVOICE_2'
                            iv_element             = VALUE tys_types_for_prim_types-supplier_invoice_2( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

    lo_primitive_type = mo_model->create_primitive_type_by_elem(
                            iv_primitive_type_name = 'SUPPLIER_INVOICE_3'
                            iv_element             = VALUE tys_types_for_prim_types-supplier_invoice_3( ) ).
    lo_primitive_type->set_edm_type( 'String' ) ##NO_TEXT.
    lo_primitive_type->set_scale_variable( ).

  ENDMETHOD.

ENDCLASS.
