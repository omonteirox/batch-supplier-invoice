@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Batch Supplier Invoice Upload'
@ObjectModel.usageType:{
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
define root view entity ZI_BSI_Upload
  as select from zbsi_upload
{
  key upload_uuid          as UploadUuid,
      company_code         as CompanyCode,
      document_date        as DocumentDate,
      posting_date         as PostingDate,
      reference            as Reference,
      invoicing_party      as InvoicingParty,
      @Semantics.amount.currencyCode: 'Currency'
      gross_amount         as GrossAmount,
      currency             as Currency,
      purchase_order       as PurchaseOrder,
      po_item              as PoItem,
      tax_code             as TaxCode,
      nf_category          as NfCategory,
      status               as Status,
      message              as Message,
      supplier_invoice     as SupplierInvoice,
      fiscal_year          as FiscalYear,
      @Semantics.user.createdBy: true
      created_by           as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at           as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by      as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at      as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt
}
