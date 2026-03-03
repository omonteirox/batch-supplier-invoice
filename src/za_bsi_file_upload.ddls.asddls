@EndUserText.label: 'BSI File Upload - Action Parameter'
define abstract entity ZA_BSI_FILE_UPLOAD
{
  FileContent : abap.string(0);
  FileName    : abap.char(255);
  CompanyCode : bukrs;
}
