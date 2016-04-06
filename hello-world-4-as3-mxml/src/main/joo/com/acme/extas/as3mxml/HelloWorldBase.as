package com.acme.extas.as3mxml {

import ext.MessageBox;
import ext.StringUtil;
import ext.button.Button;
import ext.container.Viewport;

public class HelloWorldBase extends Viewport {

  public function HelloWorldBase(config:HelloWorld = null) {
    super(config);
  }

  [Bindable]
  /**
   * The name of the user to greet.
   */
  public var user:String;

  internal function onClick(button:Button):void {
    MessageBox.alert(StringUtil.format('Hello {0}!', user),
            StringUtil.format('{0} clicked on button \'{1}\'.', user, button.getText()));
  }
}
}
