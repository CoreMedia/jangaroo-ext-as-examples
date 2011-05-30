package com.acme.extas.as3 {

import ext.Button;
import ext.MessageBox;
import ext.Panel;
import ext.Toolbar;
import ext.Viewport;
import ext.util.StringUtil;

public class HelloWorld extends Viewport {

  public static function main(config:Object):void {
    new HelloWorld(config);
  }

  public function HelloWorld(config:Object) {
    super(config);
  }

  public native function get user():String;

  override protected function initComponent():void {
    super.initComponent();

    var button:Button = new Button();
    button.setText("Click me!");
    button.setHandler(onClick);
    var toolbar:Toolbar = new Toolbar();
    toolbar.addButton(button);
    var panel:Panel = new Panel({
        header: true,
        tbar: toolbar
      });
    panel.setTitle("Hello World!");
    add(panel);
  }

  private function onClick(button:Button):void {
    MessageBox.alert(StringUtil.format("Hello {0}!", user),
      StringUtil.format("{0} clicked on button '{1}'.", user, button.getText()));
  }
}
}