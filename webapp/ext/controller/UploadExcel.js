sap.ui.define([
    "sap/m/MessageToast",
    "sap/m/MessageBox",
    "sap/ui/core/Fragment",
    "sap/ui/model/json/JSONModel"
], function (MessageToast, MessageBox, Fragment, JSONModel) {
    "use strict";

    return {
        openUploadDialog: function (oEvent) {
            this.oView = this.editFlow.getView();
            this.oRouting = this.routing;

            if (!this.oUploadDialog) {
                Fragment.load({
                    id: this.oView.getId(),
                    name: "zbsi.batchsupplierinvoice.ext.fragment.UploadDialog",
                    controller: this
                }).then(function (oDialog) {
                    this.oUploadDialog = oDialog;
                    this.oView.addDependent(this.oUploadDialog);

                    // Model to hold Company Code state inside the Dialog
                    var oDialogModel = new JSONModel({
                        companyCode: ""
                    });
                    this.oUploadDialog.setModel(oDialogModel, "dialog");

                    this.oUploadDialog.open();
                }.bind(this));
            } else {
                // Reset model on open
                this.oUploadDialog.getModel("dialog").setProperty("/companyCode", "");
                var oFileUploader = this.oView.byId("fileUploader");
                if (oFileUploader) {
                    oFileUploader.clear();
                }
                this.oUploadDialog.open();
            }
        },

        onCloseDialog: function () {
            this.oUploadDialog.close();
        },

        onCompanyCodeChange: function (oEvent) {
            var sValue = oEvent.getParameter("value");
            if (sValue) {
                sValue = sValue.toUpperCase().replace(/[^A-Z0-9]/g, "");
                this.oUploadDialog.getModel("dialog").setProperty("/companyCode", sValue);
            }
        },

        onTypeMismatch: function () {
            MessageBox.error("Tipo de arquivo não suportado. Use .xlsx ou .csv");
        },

        onUploadPress: function () {
            // FIX WARN-01: Stop using private DOM property FUEl.
            // Getting the input DOM element directly by ID instead of using FUEl
            var oFileUploader = this.oView.byId("fileUploader");
            var oDomRef = document.getElementById(oFileUploader.getId() + "-fu");
            var aFiles = oDomRef ? oDomRef.files : null;

            var sCompanyCode = this.oUploadDialog.getModel("dialog").getProperty("/companyCode");

            if (!sCompanyCode) {
                MessageBox.error("Selecione uma empresa antes de executar a carga.");
                return;
            }

            if (!aFiles || aFiles.length === 0) {
                MessageBox.error("Por favor, selecione um arquivo.");
                return;
            }

            var oFile = aFiles[0];
            var sFileName = oFile.name.toLowerCase();
            this.oUploadDialog.setBusy(true);

            if (sFileName.endsWith(".xlsx") || sFileName.endsWith(".xls")) {
                this._parseExcel(oFile, sFileName, sCompanyCode);
            } else if (sFileName.endsWith(".csv")) {
                this._parseCsv(oFile, sFileName, sCompanyCode);
            } else {
                this.oUploadDialog.setBusy(false);
                MessageBox.error("Tipo de arquivo não suportado. Use .xlsx ou .csv");
            }
        },

        /* =========================================================== */
        /* Internal: Parse Excel & CSV                                  */
        /* =========================================================== */

        _parseExcel: function (oFile, sFileName, sCompanyCode) {
            var that = this;

            if (typeof XLSX === "undefined") {
                this.oUploadDialog.setBusy(false);
                MessageBox.error("Biblioteca SheetJS (xlsx) não encontrada. Verifique o manifest.json.");
                return;
            }

            var oReader = new FileReader();
            oReader.onload = function (e) {
                try {
                    var oWorkbook = XLSX.read(e.target.result, { type: "binary" });
                    var sSheetName = oWorkbook.SheetNames[0];

                    // Convert sheet to CSV - backend will do the heavy lifting parsing the data
                    // Use ; as our standard backend delimiter for safety across locales
                    var sCsvData = XLSX.utils.sheet_to_csv(oWorkbook.Sheets[sSheetName], { FS: ";" });

                    if (!sCsvData) {
                        that.oUploadDialog.setBusy(false);
                        MessageBox.error("O arquivo está vazio ou não possui dados válidos.");
                        return;
                    }

                    that._callBackendAction(sCsvData, sFileName, sCompanyCode);

                } catch (oError) {
                    that.oUploadDialog.setBusy(false);
                    MessageBox.error("Erro ao converter o arquivo Excel: " + oError.message);
                }
            };
            oReader.readAsBinaryString(oFile);
        },

        _parseCsv: function (oFile, sFileName, sCompanyCode) {
            var that = this;
            var oReader = new FileReader();

            oReader.onload = function (e) {
                try {
                    var sContent = e.target.result;
                    if (!sContent || sContent.trim().length === 0) {
                        that.oUploadDialog.setBusy(false);
                        MessageBox.error("O arquivo CSV está vazio.");
                        return;
                    }
                    that._callBackendAction(sContent, sFileName, sCompanyCode);
                } catch (oError) {
                    that.oUploadDialog.setBusy(false);
                    MessageBox.error("Erro ao ler o arquivo CSV: " + oError.message);
                }
            };
            oReader.readAsText(oFile, "UTF-8");
        },

        /* =========================================================== */
        /* Internal: RAP Factory Action Call                           */
        /* =========================================================== */

        _callBackendAction: function (sCsvContent, sFileName, sCompanyCode) {
            var that = this;

            // Get OData V4 Model
            var oModel = this.oView.getModel();

            // Get OData context bound to the list report inner table
            var oTable = this.oView.byId("zbsi.batchsupplierinvoice::ZC_BSI_UploadList--fe::table::ZC_BSI_Upload::LineItem-innerTable");
            var oListBinding = oTable.getBinding("items");

            // Use standard OData V4 static factory action invocation naming
            // Path is usually <ModelNamespace>.<ActionName> on the entity collection
            var oActionContext = oModel.bindContext("com.sap.gateway.srvd.zsd_bsi_upload.v0001.ImportFromFile(...)", oListBinding.getHeaderContext());

            oActionContext.setParameter("FileContent", sCsvContent);
            oActionContext.setParameter("FileName", sFileName);
            oActionContext.setParameter("CompanyCode", sCompanyCode);

            oActionContext.execute().then(function () {
                that.oUploadDialog.setBusy(false);
                that.oUploadDialog.close();
                if (that.extensionAPI) that.extensionAPI.refresh();
                MessageToast.show("Importação RAP concluída com sucesso. Valide as pendências na lista.");
            }).catch(function (oError) {
                that.oUploadDialog.setBusy(false);
                MessageBox.error(oError.message || "Erro na comunicação com o backend durante a importação.");
            });
        }
    };
});
