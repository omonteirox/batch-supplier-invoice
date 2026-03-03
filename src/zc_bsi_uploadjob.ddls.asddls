@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'BSI Upload Job - Projection'
@ObjectModel.semanticKey: ['FileName']
define root view entity ZC_BSI_UploadJob
  provider contract transactional_query
  as projection on ZI_BSI_UploadJob
{
  key JobUuid,
      
      ContentId,
      
      @EndUserText.label: 'Nome do Arquivo'
      FileName,
      
      MimeType,
      
      @EndUserText.label: 'Anexo (Arquivo CSV)'
      FileContent,
      
      @EndUserText.label: 'Status'
      Status,
      
      StatusCriticality,
      
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      
      /* Associations */
      _Invoices : redirected to composition child ZC_BSI_Upload
}
