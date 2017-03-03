package com.acme.extas.json {

import ext.*;

public class HelloWorld {

  public static function main(config):void {
    Ext.create({
      xtype: "viewport",
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
    });
  }

}
}