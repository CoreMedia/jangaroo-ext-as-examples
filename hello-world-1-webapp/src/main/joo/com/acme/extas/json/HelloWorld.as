package com.acme.extas.json {

import ext.*;
import ext.config.*;
import ext.util.*;

public class HelloWorld {

  public static function main(config):void {
    new ext.Viewport(
      viewport({
        items: {
          xtype: "panel",
          title: "Hello World!",
          tbar: {
            xtype: "toolbar",
            items: {
              xtype: "button",
              text: "Click me!",
              handler: function onClick(button) {
                ext.MessageBox.alert(ext.util.StringUtil.format('Hello {0}!', config.user),
                  ext.util.StringUtil.format('{0} clicked on button \'{1}\'.',
                    config.user, button.getText()));
              }
            }
          }
        }
      })
    );
  }

}
}