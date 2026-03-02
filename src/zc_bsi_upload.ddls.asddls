@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'BSI Upload - Projection'
@ObjectModel.semanticKey: ['CompanyCode', 'Reference']
define root view entity ZC_BSI_Upload
  provider contract transactional_query
  as projection on ZI_BSI_Upload
{
  key UploadUuid,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CompanyCode', element: 'CompanyCode' } }]
      @EndUserText.label: 'Empresa'
      CompanyCode,

      @EndUserText.label: 'Data da Fatura'
      DocumentDate,

      @EndUserText.label: 'Data de Lançamento'
      PostingDate,

      @EndUserText.label: 'Referência'
      Reference,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Supplier_VH', element: 'Supplier' } }]
      @EndUserText.label: 'Fornecedor'
      InvoicingParty,

      @EndUserText.label: 'Montante Bruto'
      GrossAmount,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' } }]
      @EndUserText.label: 'Moeda'
      Currency,

      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_PurchaseOrderStdVH', element: 'PurchaseOrder' } }]
      @EndUserText.label: 'Pedido de Compras'
      PurchaseOrder,

      @EndUserText.label: 'Item do Pedido'
      PoItem,

      @EndUserText.label: 'Código Imposto'
      TaxCode,

      @EndUserText.label: 'Categoria NF'
      NfCategory,

      @EndUserText.label: 'Status'
      Status,

      StatusCriticality,

      @EndUserText.label: 'Mensagem'
      Message,

      @EndUserText.label: 'Nº Fatura Criada'
      SupplierInvoice,

      @EndUserText.label: 'Ano Fiscal'
      FiscalYear,

      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt
}
