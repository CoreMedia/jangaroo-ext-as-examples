package com.acme.extas.as3exml {

import ext.Button;
import ext.ComponentMgr;
import ext.MessageBox;
import ext.Viewport;
import ext.util.StringUtil;

public class HelloWorldBase extends Viewport {

  public static const xtype:String = "com.acme.extas.as3exml.HelloWorldBase";
  {
    ComponentMgr.registerType(xtype, HelloWorldBase);
  }

  public function HelloWorldBase(config:Object = null) {
    super(config);
  }

  /**
   * @cfg {String} user the name of the user to greet
   */
  internal native function get user():String;

  internal function onClick(button:Button):void {
    MessageBox.alert(StringUtil.format('Hello {0}!', user),
      StringUtil.format('{0} clicked on button \'{1}\'.', user, button.getText()));
  }
}
}
