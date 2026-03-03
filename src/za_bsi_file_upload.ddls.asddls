@EndUserText.label: 'BSI File Upload - Action Parameter'
define abstract entity ZA_BSI_FILE_UPLOAD
{
  @EndUserText.label: 'Conteúdo do CSV (Cole as Linhas Aqui)'
  @UI.multiLineText: true
  FileContent : abap.string(0);
  
  @EndUserText.label: 'Referência / Nome do Arquivo'
  FileName    : abap.char(255);
  
  @EndUserText.label: 'Empresa (Company Code)'
  CompanyCode : bukrs;
}
