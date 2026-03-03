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
            var oFileUploader = this.oView.byId("fileUploader");
            var aFiles = oFileUploader.FUEl.files; // Access dom files

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
                this._parseExcel(oFile, sCompanyCode);
            } else if (sFileName.endsWith(".csv")) {
                this._parseCsv(oFile, sCompanyCode);
            } else {
                this.oUploadDialog.setBusy(false);
                MessageBox.error("Tipo de arquivo não suportado. Use .xlsx ou .csv");
            }
        },

        /* =========================================================== */
        /* Internal: Parse Excel & CSV                                  */
        /* =========================================================== */

        _parseExcel: function (oFile, sCompanyCode) {
            var that = this;

            if (typeof XLSX === "undefined") {
                this.oUploadDialog.setBusy(false);
                MessageBox.error("Biblioteca SheetJS (xlsx) não encontrada.");
                return;
            }

            var oReader = new FileReader();
            oReader.onload = function (e) {
                try {
                    var oWorkbook = XLSX.read(e.target.result, { type: "binary" });
                    var sSheetName = oWorkbook.SheetNames[0];
                    var aData = XLSX.utils.sheet_to_json(oWorkbook.Sheets[sSheetName], {
                        raw: false,
                        defval: ""
                    });

                    if (!aData || aData.length === 0) {
                        that.oUploadDialog.setBusy(false);
                        MessageBox.error("O arquivo está vazio ou não possui dados válidos.");
                        return;
                    }

                    var aItems = that._mapExcelData(aData);
                    that._createDraftEntities(aItems, sCompanyCode);

                } catch (oError) {
                    that.oUploadDialog.setBusy(false);
                    MessageBox.error("Erro ao processar o arquivo: " + oError.message);
                }
            };
            oReader.readAsBinaryString(oFile);
        },

        _parseCsv: function (oFile, sCompanyCode) {
            var that = this;
            var oReader = new FileReader();

            oReader.onload = function (e) {
                try {
                    var sContent = e.target.result;
                    var aLines = sContent.split(/\r?\n/).filter(function (s) { return s.trim(); });

                    if (aLines.length < 2) {
                        that.oUploadDialog.setBusy(false);
                        MessageBox.error("O arquivo está vazio ou não possui dados válidos.");
                        return;
                    }

                    var sDelimiter = aLines[0].indexOf(";") >= 0 ? ";" : ",";
                    var aHeaders = aLines[0].split(sDelimiter).map(function (h) {
                        return h.trim().toUpperCase().replace(/"/g, "");
                    });

                    var aItems = [];
                    for (var i = 1; i < aLines.length; i++) {
                        var aValues = aLines[i].split(sDelimiter).map(function (v) {
                            return v.trim().replace(/"/g, "");
                        });

                        var oRow = {};
                        aHeaders.forEach(function (sHeader, idx) {
                            oRow[sHeader] = aValues[idx] || "";
                        });

                        aItems.push(that._mapRowToItem(oRow, i));
                    }

                    that._createDraftEntities(aItems, sCompanyCode);

                } catch (oError) {
                    that.oUploadDialog.setBusy(false);
                    MessageBox.error("Erro ao processar o arquivo: " + oError.message);
                }
            };
            oReader.readAsText(oFile, "UTF-8");
        },

        _mapExcelData: function (aRawData) {
            var that = this;
            return aRawData.map(function (oRow, iIndex) {
                var oNorm = {};
                Object.keys(oRow).forEach(function (k) {
                    oNorm[k.toUpperCase().trim()] = (oRow[k] || "").toString().trim();
                });
                return that._mapRowToItem(oNorm, iIndex + 1);
            });
        },

        _mapRowToItem: function (oRow, iLine) {
            return {
                DocumentDate: this._toEdmDate(this._parseDate(oRow["DATA_FATURA"] || oRow["DOCUMENTDATE"] || "")),
                PostingDate: this._toEdmDate(this._parseDate(oRow["DATA_LANCAMENTO"] || oRow["POSTINGDATE"] || "")),
                Reference: oRow["REFERENCIA"] || oRow["REFERENCE"] || "",
                InvoicingParty: oRow["FORNECEDOR"] || oRow["INVOICINGPARTY"] || "",
                GrossAmount: this._parseAmount(oRow["MONTANTE"] || oRow["GROSSAMOUNT"] || "0"),
                Currency: (oRow["MOEDA"] || oRow["CURRENCY"] || "BRL").toUpperCase(),
                PurchaseOrder: oRow["PEDIDO"] || oRow["PURCHASEORDER"] || "",
                PoItem: this._padPoItem(oRow["ITEM_PEDIDO"] || oRow["POITEM"] || ""),
                TaxCode: (oRow["CODIGO_IMPOSTO"] || oRow["TAXCODE"] || "").toUpperCase(),
                NfCategory: oRow["CATEGORIA_NF"] || oRow["NFCATEGORY"] || ""
            };
        },

        /* =========================================================== */
        /* Internal: Creation of Draft Entities directly in Fiori List */
        /* =========================================================== */

        _createDraftEntities: function (aItems, sCompanyCode) {
            var that = this;

            // Get OData V4 Model List Binding representing the Table data
            var oTable = this.oView.byId("zbsi.batchsupplierinvoice::ZC_BSI_UploadList--fe::table::ZC_BSI_Upload::LineItem-innerTable");
            var oListBinding = oTable.getBinding("items");

            var oModel = oListBinding.getModel();
            var oExtensionAPI = this.extensionAPI;

            // Prevent UI refreshing concurrently
            oListBinding.suspend();

            // Create each entity as Draft Context in the backend
            aItems.forEach(function (oItem) {
                oItem.CompanyCode = sCompanyCode;
                oListBinding.create(oItem, true); // true = skip inactive validation (creates as Draft)
            });

            // Resume and submit the batch of requests generated by list.bind.create()
            oListBinding.resume();

            oModel.submitBatch(oModel.getUpdateGroupId()).then(function () {
                that.oUploadDialog.setBusy(false);
                that.oUploadDialog.close();
                oExtensionAPI.refresh(); // Refresh List Report table
                MessageToast.show(aItems.length + " faturas preparadas (Draft). Valide-as e clique em 'Executar Lançamento'.");
            }).catch(function (oError) {
                that.oUploadDialog.setBusy(false);
                MessageBox.error("Erro na comunicação com o servidor ao salvar os rascunhos.");
                console.error(oError);
            });
        },

        /* =========================================================== */
        /* Internal: Parsing Utilities                                  */
        /* =========================================================== */

        _parseDate: function (sDate) {
            if (!sDate) return "";
            var aParts = sDate.split(/[.\/\-]/);
            if (aParts.length === 3) {
                var sDay = aParts[0].padStart(2, "0");
                var sMonth = aParts[1].padStart(2, "0");
                var sYear = aParts[2];
                if (sYear.length === 2) {
                    sYear = "20" + sYear;
                }
                return sYear + "-" + sMonth + "-" + sDay;
            }
            if (/^\d{4}-\d{2}-\d{2}$/.test(sDate)) {
                return sDate;
            }
            if (/^\d{8}$/.test(sDate)) {
                return sDate.substring(0, 4) + "-" + sDate.substring(4, 6) + "-" + sDate.substring(6, 8);
            }
            return sDate;
        },

        _parseAmount: function (sAmount) {
            if (!sAmount) return "0";
            var sClean = sAmount.toString()
                .replace(/\s/g, "")
                .replace(/\./g, "")
                .replace(",", ".");
            return isNaN(parseFloat(sClean)) ? "0" : sClean;
        },

        _padPoItem: function (sItem) {
            if (!sItem) return "";
            var sClean = sItem.replace(/\D/g, "");
            return sClean.padStart(5, "0");
        },

        _toEdmDate: function (sDate) {
            return sDate || null;
        }
    };
});
