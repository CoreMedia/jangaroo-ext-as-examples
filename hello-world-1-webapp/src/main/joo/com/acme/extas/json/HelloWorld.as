package com.acme.extas.json {

import ext.*;
import ext.container.*;

public class HelloWorld {

  public static function main(config):void {
    new ext.container.Viewport(
      {
        items: {
          xtype: "panel",
          title: "Hello World!",
          tbar: {
            xtype: "toolbar",
            items: {
              xtype: "button",
              text: "Click me!",
              handler: function onClick(button) {
                ext.MessageBox.alert(ext.StringUtil.format('Hello {0}!', config.user),
                  ext.StringUtil.format('{0} clicked on button \'{1}\'.',
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