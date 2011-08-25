package com.acme.extas.localized {

import com.acme.extas.*;
import com.acme.extas.localized.config.helloWorldBase;

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

  internal function getBundle():HelloWorld_properties {
    return HelloWorld_properties.INSTANCE;
  }

  internal function onClick(button:Button):void {
    MessageBox.alert(StringUtil.format(getBundle().dialog_title, user),
      StringUtil.format(getBundle().dialog_message, user, button.getText()));
  }
}
}
