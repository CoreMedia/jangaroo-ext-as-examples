package com.acme.extas.localized {
import ext.MessageBox;
import ext.StringUtil;
import ext.button.Button;
import ext.container.Viewport;

use namespace StringUtil;

use namespace MessageBox;

public class HelloWorldBase extends Viewport {

  internal static const BUNDLE:HelloWorld_properties = HelloWorld_properties.INSTANCE;

  public function HelloWorldBase(config:HelloWorld = null) {
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
