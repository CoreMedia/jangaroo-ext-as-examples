package com.acme.extas.as3 {

import ext.Button;
import ext.Ext;
import ext.MessageBox;
import ext.Panel;
import ext.Toolbar;
import ext.Viewport;
import ext.util.StringUtil;

import net.jangaroo.ext.Exml;

//noinspection JSUnusedGlobalSymbols
public class HelloWorld extends Viewport {

  [Bindable]
  public var user:String = "Joe";

  //noinspection JSUnusedGlobalSymbols
  public function HelloWorld(config:HelloWorld = null) {
    var superConfig:Viewport = Viewport({});

    var button1:Button = Button({});
    button1.text = "Click me!";
    button1.handler = onClick;

    var button2:Button = Button({});
    button2.text = "Push me!";
    button2.handler = onClick;

    var toolbar:Toolbar = Toolbar({});
    toolbar.items = [button1, button2];

    var panel:Panel = Panel({});
    panel.header = true;
    panel.tbar = toolbar;
    panel.title = "Hello World!";

    superConfig.items = [panel];

    super(Viewport(Exml.apply(superConfig, config)));
  }

  private function onClick(button:Button):void {
    MessageBox.alert(StringUtil.format("Hello {0}!", user),
      StringUtil.format("{0} clicked on button '{1}'.", user, button.getText()));
  }
}
}