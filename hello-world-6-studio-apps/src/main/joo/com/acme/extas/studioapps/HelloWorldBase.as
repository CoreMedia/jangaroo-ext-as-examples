package com.acme.extas.studioapps {

import com.coremedia.ui.apps.global.serviceAgent;

import ext.ComponentQuery;
import ext.IPromise;

import ext.MessageBox;
import ext.StringUtil;
import ext.button.Button;
import ext.form.Label;
import ext.form.field.TextField;
import ext.panel.Panel;

public class HelloWorldBase extends Panel {
  public static const SEARCH_TEXT_FIELD_ITEM_ID:String = "searchTextField";
  public static const SHOW_ITEMS_LABEL_ITEM_ID:String = "showItemsLabel";

  public function HelloWorldBase(config:HelloWorld = null) {
    super(config);
  }

  internal function search(button:Button):void {
    if (serviceAgent == null) {
      initializeServiceAgent();
    }

    var libraryService:Object = serviceAgent.getService("libraryService");

    if (libraryService) {
      var search:SearchState = new SearchState();
      var searchTextField:TextField = ComponentQuery.query("#" + SEARCH_TEXT_FIELD_ITEM_ID)[0] as TextField;
      var searchValue:String = searchTextField.getValue();
      search.searchText = searchValue;
      libraryService.openSearchResult(search);
      MessageBox.alert("Search performed successfully!",StringUtil.format('Search term: {0}' +
              '<br/>Switch to the Studio window to see the results.', searchValue));
    } else {
      MessageBox.alert("ERROR",
              "Library Service not available.<br/>Have you logged in to Studio?");
    }

  }

  internal function showItems(button:Button):void {
    if (serviceAgent == null) {
      initializeServiceAgent();
    }

    var workAreaService:Object = serviceAgent.getService("workAreaService");

    if (workAreaService) {
      var openedEntities:IPromise = workAreaService.getOpenedEntities();
      openedEntities.then(function(result:Array){
        var showItemsLabel:Label = ComponentQuery.query("#" + SHOW_ITEMS_LABEL_ITEM_ID)[0] as Label;
        var contentItemsList:String = "<b>Content items opened in Studio:</b>";

        for each (var contentItem:String in result) {
          contentItemsList = contentItemsList.concat("<br/>", contentItem);
        }

        showItemsLabel.html=contentItemsList;
      });
      MessageBox.alert("Successful operation","Showing content items opened in Studio");
    } else {
      MessageBox.alert("ERROR",
              "Work Area Service not available.<br/>Have you logged in to Studio?");
    }

  }

  function initializeServiceAgent():void {
    joo.getOrCreatePackage("com.coremedia.ui.apps.global").serviceAgent = window["cmApps"].serviceAgent;
  }

}
}
