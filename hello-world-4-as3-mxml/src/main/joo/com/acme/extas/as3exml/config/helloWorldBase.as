package com.acme.extas.as3exml.config {

import ext.Button;
import ext.MessageBox;
import ext.config.viewport;
import ext.events.ButtonClickEvent;
import ext.util.StringUtil;

public class helloWorldBase extends viewport {

  /**
   * The name of the user to greet.
   */
  public native function get user():String;

  /**
   * @private
   */
  public native function set user(value:String):void;

  protected function onClick(event:ButtonClickEvent):void {
    var button:Button = event.source;
    MessageBox.alert(StringUtil.format('Hello {0}!', user),
            StringUtil.format('{0} clicked on button \'{1}\'.', user, button.getText()));
  }
}
}
