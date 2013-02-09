package com.acme.extas.localized {
import ext.ComponentMgr;

import net.jangaroo.ext.ExtDefaultTheme;

//noinspection JSUnusedGlobalSymbols
public class Main {

  //noinspection JSUnusedGlobalSymbols
  public function Main(config:Object) {
    window.document.title = "Ext AS Localization";
    ExtDefaultTheme.load(function():void {
      var hello:helloWorld = new helloWorld();
      if (config && config.user) {
        hello.user = config.user;
      }
      ComponentMgr.create(hello);
    });
  }
}
}