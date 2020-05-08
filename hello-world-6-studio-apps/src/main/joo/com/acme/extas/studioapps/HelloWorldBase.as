package com.acme.extas.studioapps {

import com.coremedia.ui.apps.global.serviceAgent;

import ext.ComponentQuery;

import ext.MessageBox;
import ext.StringUtil;
import ext.button.Button;
import ext.form.field.TextField;
import ext.panel.Panel;

public class HelloWorldBase extends Panel {
  public static const SEARCH_TEXT_FIELD_ITEM_ID:String = "searchTextField";

  public function HelloWorldBase(config:HelloWorld = null) {
    super(config);
  }

  internal function onClick(button:Button):void {
    if (serviceAgent == null) {
      joo.getOrCreatePackage("com.coremedia.ui.apps.global").serviceAgent = window["cmApps"].serviceAgent;
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

}
}
