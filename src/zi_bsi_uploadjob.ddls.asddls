@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Upload Job Root Entity'
define root view entity ZI_BSI_UploadJob
  as select from zbsi_upld_job
  composition [0..*] of ZI_BSI_Upload as _Invoices
{
  key job_uuid              as JobUuid,
      content_id            as ContentId,
      file_name             as FileName,
      @Semantics.mimeType: true
      mime_type             as MimeType,
      @Semantics.largeObject: {
        mimeType: 'MimeType',
        fileName: 'FileName',
        contentDispositionPreference: #INLINE
      }
      file_content          as FileContent,
      status                as Status,
      case status
        when 'S' then 3 
        when 'E' then 1
        when 'P' then 2
        else 0
      end                   as StatusCriticality,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      
      _Invoices
}
