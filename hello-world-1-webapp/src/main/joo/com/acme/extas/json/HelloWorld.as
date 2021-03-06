package com.acme.extas.json {

import ext.*;
import ext.config.viewport;
import ext.util.StringUtil;

public class HelloWorld {

  public static function main(config):void {
    new ext.Viewport(
      new viewport({
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