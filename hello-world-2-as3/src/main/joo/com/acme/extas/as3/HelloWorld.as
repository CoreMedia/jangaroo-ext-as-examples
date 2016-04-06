package com.acme.extas.as3 {

import ext.MessageBox;
import ext.StringUtil;
import ext.button.Button;
import ext.container.Viewport;
import ext.panel.Panel;
import ext.toolbar.Toolbar;

public class HelloWorld extends Viewport {

  //noinspection JSUnusedGlobalSymbols
  public static function main(config:Viewport):void {
    new HelloWorld(config);
  }

  public function HelloWorld(config:Viewport) {
    super(config);
  }

  public native function get user():String;

  override protected function initComponent():void {
    super.initComponent();

    var buttonConfig:Button = Button({});
    buttonConfig.text = "Click me, Dude!";
    buttonConfig.handler = onClick;

    var toolbarConfig:Toolbar = Toolbar({});
    toolbarConfig.items = [buttonConfig];

    var panelConfig:Panel = Panel({});
    panelConfig['header'] = true;
    panelConfig.tbar = toolbarConfig;
    panelConfig.title = "Hello World!";

    add(panelConfig); // add automatically creates the component sub-tree from the config objects!
    // you could also explicitly build the component by using
    //  add(new ext.Panel(panelConfig));
  }

  private function onClick(button:Button):void {
    MessageBox.alert(StringUtil.format("Hello {0}!", user),
      StringUtil.format("{0} clicked on button '{1}'.", user, button.getText()));
  }
}
}