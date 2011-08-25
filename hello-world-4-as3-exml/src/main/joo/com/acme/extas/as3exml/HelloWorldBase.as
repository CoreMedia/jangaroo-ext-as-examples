package com.acme.extas.as3exml {

import com.acme.extas.as3exml.config.helloWorldBase;

import ext.Button;
import ext.ComponentMgr;
import ext.MessageBox;
import ext.Viewport;
import ext.util.StringUtil;

public class HelloWorldBase extends Viewport {

  public function HelloWorldBase(config:helloWorldBase = null) {
    super(config);
  }

  /**
   * The name of the user to greet.
   */
  internal native function get user():String;

  internal function onClick(button:Button):void {
    MessageBox.alert(StringUtil.format('Hello {0}!', user),
      StringUtil.format('{0} clicked on button \'{1}\'.', user, button.getText()));
  }
}
}
