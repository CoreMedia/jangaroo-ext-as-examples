package com.acme.extas.localized {

import com.acme.extas.localized.config.helloWorld;

import ext.Button;
import ext.MessageBox;
import ext.Viewport;
import ext.util.StringUtil;

public class HelloWorldBase extends Viewport {

  internal static const BUNDLE:HelloWorld_properties = HelloWorld_properties.INSTANCE;

  public function HelloWorldBase(config:helloWorld = null) {
    super(config);
  }

  /**
   * The name of the user to greet.
   */
  internal native function get user():String;

  internal function onClick(button:Button):void {
    MessageBox.alert(StringUtil.format(BUNDLE.dialog_title, user),
      StringUtil.format(BUNDLE.dialog_message, user, button.getText()));
  }
}
}
