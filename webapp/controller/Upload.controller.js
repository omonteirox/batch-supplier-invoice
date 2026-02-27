sap.ui.define(
    [
        "sap/ui/core/mvc/Controller",
        "sap/m/MessageBox",
        "sap/m/MessageToast",
        "sap/ui/model/json/JSONModel"
    ],
    function (Controller, MessageBox, MessageToast, JSONModel) {
        "use strict";

        return Controller.extend("zbsi.batchsupplierinvoice.controller.Upload", {

            /* =========================================================== */
            /* Lifecycle                                                    */
            /* =========================================================== */

            onInit: function () {
                this._oUploadModel = this.getOwnerComponent().getModel("upload");
            },

            /* =========================================================== */
            /* Event Handlers                                               */
            /* =========================================================== */

            onCompanyCodeChange: function (oEvent) {
                var sValue = oEvent.getParameter("value");
                if (sValue) {
                    sValue = sValue.toUpperCase().replace(/[^A-Z0-9]/g, "");
                    this._oUploadModel.setProperty("/companyCode", sValue);
                }
            },

            onTypeMismatch: function () {
                MessageBox.error(this._getText("errorFileType"));
            },

            onFileChange: function (oEvent) {
                var aFiles = oEvent.getParameter("files");
                if (!aFiles || aFiles.length === 0) {
                    return;
                }

                var oFile = aFiles[0];
                var sFileName = oFile.name.toLowerCase();

                if (sFileName.endsWith(".xlsx") || sFileName.endsWith(".xls")) {
                    this._parseExcel(oFile);
                } else if (sFileName.endsWith(".csv")) {
                    this._parseCsv(oFile);
                } else {
                    MessageBox.error(this._getText("errorFileType"));
                }
            },

            onExecuteBatch: function () {
                var that = this;
                var sCompanyCode = this._oUploadModel.getProperty("/companyCode");
                var aItems = this._oUploadModel.getProperty("/items");

                if (!sCompanyCode) {
                    MessageBox.error(this._getText("errorNoCompany"));
                    return;
                }

                if (!aItems || aItems.length === 0) {
                    MessageBox.error(this._getText("errorNoData"));
                    return;
                }

                MessageBox.confirm(
                    this._getText("confirmBatch", [aItems.length, sCompanyCode]),
                    {
                        title: this._getText("confirmTitle"),
                        onClose: function (sAction) {
                            if (sAction === MessageBox.Action.OK) {
                                that._executeBatchUpload(sCompanyCode, aItems);
                            }
                        }
                    }
                );
            },

            onClearData: function () {
                this._oUploadModel.setProperty("/items", []);
                this._oUploadModel.setProperty("/hasData", false);
                this._oUploadModel.setProperty("/hasResults", false);
                this._oUploadModel.setProperty("/totalSuccess", 0);
                this._oUploadModel.setProperty("/totalError", 0);
                this._oUploadModel.setProperty("/totalPending", 0);

                // Reset file uploader
                var oFileUploader = this.byId("fileUploader");
                if (oFileUploader) {
                    oFileUploader.clear();
                }

                MessageToast.show(this._getText("dataCleared"));
            },

            /* =========================================================== */
            /* Internal: File Parsing                                       */
            /* =========================================================== */

            _parseExcel: function (oFile) {
                var that = this;

                if (typeof XLSX === "undefined") {
                    // Try loading SheetJS dynamically
                    MessageBox.error(
                        "Biblioteca SheetJS (xlsx) não encontrada. " +
                        "Verifique se o arquivo lib/xlsx.full.min.js está disponível."
                    );
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
                            MessageBox.error(that._getText("errorEmptyFile"));
                            return;
                        }

                        var aItems = that._mapExcelData(aData);
                        that._setUploadData(aItems);

                    } catch (oError) {
                        MessageBox.error(that._getText("errorParsing") + ": " + oError.message);
                    }
                };
                oReader.readAsBinaryString(oFile);
            },

            _parseCsv: function (oFile) {
                var that = this;
                var oReader = new FileReader();

                oReader.onload = function (e) {
                    try {
                        var sContent = e.target.result;
                        var aLines = sContent.split(/\r?\n/).filter(function (s) { return s.trim(); });

                        if (aLines.length < 2) {
                            MessageBox.error(that._getText("errorEmptyFile"));
                            return;
                        }

                        // Detect delimiter (semicolon or comma)
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

                        that._setUploadData(aItems);

                    } catch (oError) {
                        MessageBox.error(that._getText("errorParsing") + ": " + oError.message);
                    }
                };
                oReader.readAsText(oFile, "UTF-8");
            },

            _mapExcelData: function (aRawData) {
                var that = this;
                return aRawData.map(function (oRow, iIndex) {
                    // Normalize keys to uppercase
                    var oNorm = {};
                    Object.keys(oRow).forEach(function (k) {
                        oNorm[k.toUpperCase().trim()] = (oRow[k] || "").toString().trim();
                    });
                    return that._mapRowToItem(oNorm, iIndex + 1);
                });
            },

            _mapRowToItem: function (oRow, iLine) {
                return {
                    line: iLine,
                    documentDate: this._parseDate(oRow["DATA_FATURA"] || oRow["DOCUMENTDATE"] || ""),
                    postingDate: this._parseDate(oRow["DATA_LANCAMENTO"] || oRow["POSTINGDATE"] || ""),
                    reference: oRow["REFERENCIA"] || oRow["REFERENCE"] || "",
                    invoicingParty: oRow["FORNECEDOR"] || oRow["INVOICINGPARTY"] || "",
                    grossAmount: this._parseAmount(oRow["MONTANTE"] || oRow["GROSSAMOUNT"] || "0"),
                    currency: (oRow["MOEDA"] || oRow["CURRENCY"] || "BRL").toUpperCase(),
                    purchaseOrder: oRow["PEDIDO"] || oRow["PURCHASEORDER"] || "",
                    poItem: this._padPoItem(oRow["ITEM_PEDIDO"] || oRow["POITEM"] || ""),
                    taxCode: (oRow["CODIGO_IMPOSTO"] || oRow["TAXCODE"] || "").toUpperCase(),
                    nfCategory: oRow["CATEGORIA_NF"] || oRow["NFCATEGORY"] || "",
                    status: "P",
                    statusText: "Pendente",
                    message: "",
                    supplierInvoice: "",
                    fiscalYear: ""
                };
            },

            _setUploadData: function (aItems) {
                this._oUploadModel.setProperty("/items", aItems);
                this._oUploadModel.setProperty("/hasData", aItems.length > 0);
                this._oUploadModel.setProperty("/hasResults", false);
                this._oUploadModel.setProperty("/totalPending", aItems.length);
                this._oUploadModel.setProperty("/totalSuccess", 0);
                this._oUploadModel.setProperty("/totalError", 0);

                MessageToast.show(this._getText("dataLoaded", [aItems.length]));
            },

            /* =========================================================== */
            /* Internal: Batch Execution via OData V4                       */
            /* =========================================================== */

            _executeBatchUpload: function (sCompanyCode, aItems) {
                var that = this;
                this._oUploadModel.setProperty("/isLoading", true);

                var oModel = this.getOwnerComponent().getModel();
                var oListBinding = oModel.bindList("/Upload");

                var iTotal = aItems.length;
                var iProcessed = 0;
                var iTotalSuccess = 0;
                var iTotalError = 0;

                // Process items sequentially to avoid overloading
                var fnProcessNext = function (iIndex) {
                    if (iIndex >= iTotal) {
                        // All done
                        that._oUploadModel.setProperty("/isLoading", false);
                        that._oUploadModel.setProperty("/hasResults", true);
                        that._oUploadModel.setProperty("/totalSuccess", iTotalSuccess);
                        that._oUploadModel.setProperty("/totalError", iTotalError);
                        that._oUploadModel.setProperty("/totalPending", 0);

                        MessageBox.information(
                            that._getText("batchComplete", [iTotalSuccess, iTotalError])
                        );
                        return;
                    }

                    var oItem = aItems[iIndex];

                    // Create the entity via OData V4
                    var oContext = oListBinding.create({
                        CompanyCode: sCompanyCode,
                        DocumentDate: that._toEdmDate(oItem.documentDate),
                        PostingDate: that._toEdmDate(oItem.postingDate),
                        Reference: oItem.reference,
                        InvoicingParty: oItem.invoicingParty,
                        GrossAmount: oItem.grossAmount,
                        Currency: oItem.currency,
                        PurchaseOrder: oItem.purchaseOrder,
                        PoItem: oItem.poItem,
                        TaxCode: oItem.taxCode,
                        NfCategory: oItem.nfCategory
                    });

                    // Submit and then activate (skip draft)
                    oModel.submitBatch("$auto").then(function () {
                        // After create, activate the draft
                        return oContext.execute("Activate", null, null, true);
                    }).then(function () {
                        // After activation, execute batch action
                        return oContext.execute("ExecuteBatch", null, null, true);
                    }).then(function (oResult) {
                        // Success path
                        var oData = oResult;
                        if (oData) {
                            oItem.status = oData.Status || "S";
                            oItem.statusText = oData.Status === "S" ? "Sucesso" : "Erro";
                            oItem.message = oData.Message || "";
                            oItem.supplierInvoice = oData.SupplierInvoice || "";
                            oItem.fiscalYear = oData.FiscalYear || "";

                            if (oData.Status === "S") {
                                iTotalSuccess++;
                            } else {
                                iTotalError++;
                            }
                        } else {
                            oItem.status = "S";
                            oItem.statusText = "Sucesso";
                            iTotalSuccess++;
                        }

                        iProcessed++;
                        that._oUploadModel.setProperty("/items/" + iIndex, oItem);
                        that._oUploadModel.setProperty("/totalPending", iTotal - iProcessed);

                        fnProcessNext(iIndex + 1);

                    }).catch(function (oError) {
                        // Error path
                        oItem.status = "E";
                        oItem.statusText = "Erro";
                        oItem.message = that._extractErrorMessage(oError);
                        iTotalError++;
                        iProcessed++;

                        that._oUploadModel.setProperty("/items/" + iIndex, oItem);
                        that._oUploadModel.setProperty("/totalPending", iTotal - iProcessed);

                        fnProcessNext(iIndex + 1);
                    });
                };

                fnProcessNext(0);
            },

            /* =========================================================== */
            /* Internal: Utilities                                          */
            /* =========================================================== */

            _parseDate: function (sDate) {
                if (!sDate) return "";

                // Handle DD.MM.YYYY or DD/MM/YYYY
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

                // Already in YYYY-MM-DD format
                if (/^\d{4}-\d{2}-\d{2}$/.test(sDate)) {
                    return sDate;
                }

                // YYYYMMDD format
                if (/^\d{8}$/.test(sDate)) {
                    return sDate.substring(0, 4) + "-" + sDate.substring(4, 6) + "-" + sDate.substring(6, 8);
                }

                return sDate;
            },

            _parseAmount: function (sAmount) {
                if (!sAmount) return "0";
                // Replace comma decimal separator with dot
                var sClean = sAmount.toString()
                    .replace(/\s/g, "")
                    .replace(/\./g, "")  // Remove thousand separators
                    .replace(",", ".");  // Replace decimal comma
                return isNaN(parseFloat(sClean)) ? "0" : sClean;
            },

            _padPoItem: function (sItem) {
                if (!sItem) return "";
                var sClean = sItem.replace(/\D/g, "");
                return sClean.padStart(5, "0");
            },

            _toEdmDate: function (sDate) {
                // Convert YYYY-MM-DD to YYYY-MM-DD (OData V4 uses ISO date)
                return sDate || null;
            },

            _extractErrorMessage: function (oError) {
                if (!oError) return "Erro desconhecido";

                if (oError.message) {
                    try {
                        var oParsed = JSON.parse(oError.message);
                        if (oParsed && oParsed.error && oParsed.error.message) {
                            return oParsed.error.message.value || oParsed.error.message;
                        }
                    } catch (e) {
                        // Not JSON, use as is
                    }
                    return oError.message;
                }

                return oError.toString();
            },

            _getText: function (sKey, aArgs) {
                var oBundle = this.getOwnerComponent().getModel("i18n").getResourceBundle();
                return oBundle.getText(sKey, aArgs);
            }
        });
    }
);
