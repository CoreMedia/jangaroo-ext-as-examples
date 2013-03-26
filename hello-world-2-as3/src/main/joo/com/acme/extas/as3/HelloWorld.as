package com.acme.extas.as3 {

import ext.Button;
import ext.ComponentMgr;
import ext.MessageBox;
import ext.config.button;
import ext.config.panel;
import ext.config.toolbar;
import ext.config.viewport;
import ext.util.StringUtil;

//noinspection JSUnusedGlobalSymbols
public class HelloWorld {

  private var user:String;

  //noinspection JSUnusedGlobalSymbols
  public function HelloWorld(config:Object = null):void {
    user = config.user;
    window.document.title = "Hello World in Object-Oriented ActionScript";
    buildUI();
  }

  private function buildUI():void {

    var buttonConfig:button = new button();
    buttonConfig.text = "Click me!";
    buttonConfig.handler = onClick;

    var toolbarConfig:toolbar = new toolbar();
    toolbarConfig.items = [buttonConfig];

    var panelConfig:panel = new panel();
    panelConfig.header = true;
    panelConfig.tbar = toolbarConfig;
    panelConfig.title = "Hello World!";

    var viewportConfig:viewport = new viewport();
    viewportConfig.items = [ panelConfig ];
    
    ComponentMgr.create(viewportConfig);
  }

  private function onClick(button:Button):void {
    MessageBox.alert(StringUtil.format("Hello {0}!", user),
      StringUtil.format("{0} clicked on button '{1}'.", user, button.getText()));
  }
}
}