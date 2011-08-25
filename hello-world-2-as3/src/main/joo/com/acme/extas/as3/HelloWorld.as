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

  public static function main(config:viewport):void {
    new HelloWorld(config);
  }

  public function HelloWorld(config:viewport) {
    super(config);
  }

  public native function get user():String;

  override protected function initComponent():void {
    super.initComponent();

    var btn:button = new button();
    btn.text = "Click me!";
    btn.handler = onClick;

    var tb:toolbar = new toolbar();
    tb.items = [btn];

    var pnl:panel = new panel();
    pnl.header = true;
    pnl.tbar = tb;
    pnl.title = "Hello World!";

    add(pnl);
  }

  private function onClick(button:Button):void {
    MessageBox.alert(StringUtil.format("Hello {0}!", user),
      StringUtil.format("{0} clicked on button '{1}'.", user, button.getText()));
  }
}
}