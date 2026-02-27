sap.ui.define(
  [
    "sap/ui/core/UIComponent",
    "sap/ui/model/json/JSONModel"
  ],
  function (UIComponent, JSONModel) {
    "use strict";

    return UIComponent.extend("zbsi.batchsupplierinvoice.Component", {
      metadata: {
        manifest: "json"
      },

      init: function () {
        UIComponent.prototype.init.apply(this, arguments);

        // Initialize upload JSON model
        var oUploadModel = new JSONModel({
          companyCode: "",
          items: [],
          results: [],
          isLoading: false,
          hasData: false,
          hasResults: false,
          totalSuccess: 0,
          totalError: 0,
          totalPending: 0
        });
        this.setModel(oUploadModel, "upload");

        // Initialize router
        this.getRouter().initialize();
      }
    });
  }
);
