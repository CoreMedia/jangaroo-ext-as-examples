package com.acme.extas.as3 {

import ext.Button;
import ext.MessageBox;
import ext.Viewport;
import ext.config.button;
import ext.config.panel;
import ext.config.toolbar;
import ext.config.viewport;
import ext.util.StringUtil;

public class HelloWorld extends Viewport {

  //noinspection JSUnusedGlobalSymbols
  public static function main(config:viewport):void {
    //noinspection ObjectAllocationIgnored
    new HelloWorld(config);
  }

  public function HelloWorld(config:viewport) {
    super(config);
  }

  public native function get user():String;

  override protected function initComponent():void {
    super.initComponent();

    var buttonConfig:button = new button();
    buttonConfig.text = "Click me!";
    buttonConfig.handler = onClick;

    var toolbarConfig:toolbar = new toolbar();
    toolbarConfig.items = [buttonConfig];

    var panelConfig:panel = new panel();
    panelConfig.header = true;
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