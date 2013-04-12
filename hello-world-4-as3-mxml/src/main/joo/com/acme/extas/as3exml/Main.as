package com.acme.extas.as3exml {

import ext.ComponentMgr;

//noinspection JSUnusedGlobalSymbols
public class Main {

  //noinspection JSUnusedGlobalSymbols
  public function Main(config:Object):void {
    window.document.title = "Hello World in AS3 and EXML";
    var hello:HelloWorld = new HelloWorld();
    if (config && config.user) {
      hello.firstName = config.user;
    }
  }

}
}
