package com.acme.extas.studioapps {

import ext.MessageBox;
import ext.StringUtil;
import ext.button.Button;
import ext.panel.Panel;

public class HelloWorldBase extends Panel {

  [Bindable]
  /**
   * The name of the user to greet.
   */
  public var user:String;

  public function HelloWorldBase(config:HelloWorld = null) {
    super(config);
  }

  internal function onClick(button:Button):void {
    MessageBox.alert(StringUtil.format('Hello {0}!', user),
            StringUtil.format('{0} clicked on button \'{1}\'.', user, button.text));
  }
}
}
