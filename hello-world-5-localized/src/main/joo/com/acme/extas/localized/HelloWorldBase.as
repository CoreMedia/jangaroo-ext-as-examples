package com.acme.extas.localized {
import ext.MessageBox;
import ext.StringUtil;
import ext.button.Button;
import ext.container.Viewport;

[ResourceBundle('com.acme.extas.localized.HelloWorld')]
public class HelloWorldBase extends Viewport {

  [Bindable]
  /**
   * The name of the user to greet.
   */
  public var user:String;

  public function HelloWorldBase(config:HelloWorld = null) {
    super(config);
  }

  internal function onClick(button:Button):void {
    MessageBox.alert(StringUtil.format(resourceManager.getString('com.acme.extas.localized.HelloWorld', 'dialog_title'), user),
            StringUtil.format(resourceManager.getString('com.acme.extas.localized.HelloWorld', 'dialog_message'), user, button.text));
  }
}
}
