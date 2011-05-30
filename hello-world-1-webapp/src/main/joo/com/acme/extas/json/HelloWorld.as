package com.acme.extas.json {

import ext.Button;
import ext.MessageBox;
import ext.Viewport;
import ext.util.StringUtil;

public class HelloWorld {

  public static function main(config:Object):void {
    new Viewport(
      {
        items: {
          xtype: "panel",
          title: "Hello World!",
          tbar: {
            xtype: "toolbar",
            items: {
              xtype: "button",
              text: "Click me!",
              handler: function(button:Button):void {
                MessageBox.alert(StringUtil.format('Hello {0}!', config.user),
                  StringUtil.format('{0} clicked on button \'{1}\'.',
                    config.user, button.getText()));
              }
            }
          }
        }
      }
    );
  }

}
}