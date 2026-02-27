# Batch Supplier Invoice Upload

Aplicativo Fiori para **carga em massa de faturas de fornecedor** (Supplier Invoice) consumindo a API `API_SUPPLIERINVOICE_PROCESS_SRV` via **RAP Clean Core** (ABAP Cloud).

## 📋 Funcionalidades

- Upload de arquivo `.xlsx` ou `.csv` com dados de faturas
- Validação de campos obrigatórios e montantes
- Criação em massa de Supplier Invoices via Communication Scenario `SAP_COM_0057`
- Exibição de resultados (sucesso/erro) por linha
- Testes unitários ABAP com CDS Test Doubles

## 🏗️ Arquitetura

```
┌──────────────────────┐     ┌─────────────────────┐     ┌──────────────────┐
│  Fiori App (UI5)     │────▶│  RAP Backend (BO)   │────▶│ API_SUPLRINVC    │
│  Upload XLSX/CSV     │     │  ZI_BSI_Upload       │     │ SAP_COM_0057     │
│  OData V4            │     │  Managed + Draft     │     │ OData V2         │
└──────────────────────┘     └─────────────────────┘     └──────────────────┘
```

## 📦 Estrutura do Projeto

```
src/                              # Artefatos ABAP (abapGit)
├── zbsi_upload.tabl.xml          # Tabela staging
├── zbsi_upload_d.tabl.xml        # Tabela draft
├── zi_bsi_upload.ddls.asddls     # CDS Interface View
├── zc_bsi_upload.ddls.asddls     # CDS Projection View
├── zc_bsi_upload.ddlx.asddlxs   # Metadata Extension (UI annotations)
├── zi_bsi_upload.dcls.asdcls     # Access Control (Interface)
├── zc_bsi_upload.dcls.asdcls     # Access Control (Projection)
├── zi_bsi_upload.bdef.asbdef     # Behavior Definition (Interface)
├── zc_bsi_upload.bdef.asbdef     # Behavior Definition (Projection)
├── zbp_i_bsi_upload.clas.*       # Behavior Implementation
├── zsd_bsi_upload.srvd.srvdsrv   # Service Definition
├── zsb_bsi_upload.srvb.srvbsrv   # Service Binding (OData V4)
├── z_bsi_suplrinvc.cscn.xml      # Communication Scenario
├── zcl_bsi_upload_test.clas.*    # Unit Tests
└── package.devc.xml              # Package descriptor

webapp/                           # Fiori App (UI5 Freestyle)
├── manifest.json
├── Component.js
├── index.html
├── view/Upload.view.xml
├── controller/Upload.controller.js
├── i18n/i18n.properties
└── lib/xlsx.full.min.js          # SheetJS (baixar separadamente)
```

## 🚀 Como Importar

### 1. abapGit (Backend ABAP)
1. Clonar este repositório
2. No SAP ADT, abrir **abapGit Repositories** → **Link** → colar URL do repositório
3. Pull para o pacote desejado (ex: `ZBSI_BATCH_INVOICE`)
4. Ativar todos os objetos

### 2. Communication Arrangement
1. Fiori Launchpad → **Maintain Communication Arrangements**
2. Cenário: `Z_BSI_SUPLRINVC`
3. Configurar o endpoint e credenciais para `API_SUPPLIERINVOICE_PROCESS_SRV`

### 3. Frontend (webapp)
- Fazer deploy via **SAP Business Application Studio** ou `cf deploy`
- Ou usar diretamente via Fiori Launchpad referenciando o Semantic Object `BatchSupplierInvoice`

### 4. SheetJS
- Baixar `xlsx.full.min.js` de https://cdn.sheetjs.com/xlsx-latest/package/dist/xlsx.full.min.js
- Colocar em `webapp/lib/xlsx.full.min.js`

## 📄 Template do Arquivo de Upload

| DATA_FATURA | DATA_LANCAMENTO | REFERENCIA | FORNECEDOR | MONTANTE  | MOEDA | PEDIDO     | ITEM_PEDIDO | CODIGO_IMPOSTO | CATEGORIA_NF |
|-------------|-----------------|------------|------------|-----------|-------|------------|-------------|----------------|--------------|
| 01.03.2026  | 01.03.2026      | NF-12345   | 100001     | 15000.00  | BRL   | 4500000001 | 00010       | B1             | 01           |
| 01.03.2026  | 01.03.2026      | NF-12346   |            | 8500.50   | BRL   | 4500000002 | 00020       | B2             |              |

## 🧪 Testes Unitários

Executar via ADT: `Ctrl+Shift+F10` na classe `ZCL_BSI_UPLOAD_TEST`

Testes disponíveis:
- `test_validate_mandatory_ok` - Validação com campos preenchidos
- `test_validate_mandatory_fail` - Validação com campo faltando
- `test_validate_amount_positive` - Montante positivo aceito
- `test_validate_amount_negative` - Montante negativo rejeitado
- `test_set_defaults` - Status padrão = Pendente
- `test_execute_batch_feature` - Feature control (action desabilitada para status S)
