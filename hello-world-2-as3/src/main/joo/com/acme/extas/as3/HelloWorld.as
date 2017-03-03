package com.acme.extas.as3 {

import ext.Ext;
import ext.MessageBox;
import ext.StringUtil;
import ext.button.Button;
import ext.button.events.Button_eEvent;
import ext.panel.Panel;
import ext.panel.PanelHeader;
import ext.toolbar.Toolbar;

public class HelloWorld extends Panel {

  [Bindable]
  public var user:String;

  public function HelloWorld(config:HelloWorld) {
    var superConfig:Panel = Panel({});
    superConfig.header = PanelHeader({});
    superConfig.header.title = "Hello ActionScript World!";

    var buttonConfig:Button = Button({});
    buttonConfig.text = "Click me!";
    buttonConfig.addEventListener(Button_eEvent.CLICK, onClick);

    var toolbarConfig:Toolbar = Toolbar({});
    toolbarConfig.dock = "top";
    toolbarConfig.items = [buttonConfig];

    superConfig.dockedItems = [toolbarConfig];

    Ext.apply(superConfig, config);
    super(superConfig);
  }

  private function onClick(event:Button_eEvent):void {
    MessageBox.alert(StringUtil.format("Hello {0}!", user),
      StringUtil.format("{0} clicked on button '{1}'.", user, event.source.text));
  }
}
}