package com.acme.extas.localized {

import ext.Button;
import ext.MessageBox;
import ext.Viewport;
import ext.util.StringUtil;

public class HelloWorldBase extends Viewport {

  internal static const BUNDLE:HelloWorld_properties = HelloWorld_properties.INSTANCE;

  /**
   * The name of the user to greet.
   */
  public var user:String;

  public function HelloWorldBase(config:HelloWorldBase = null) {
    super(config);
  }

  internal function onClick(button:Button):void {
    MessageBox.alert(StringUtil.format(BUNDLE.dialog_title, user),
      StringUtil.format(BUNDLE.dialog_message, user, button.getText()));
  }
}
}
