package com.acme.extas.as3exml {

import com.acme.extas.as3exml.config.helloWorld;

import ext.ComponentMgr;

//noinspection JSUnusedGlobalSymbols
public class Main {

  //noinspection JSUnusedGlobalSymbols
  public function Main(config:Object):void {
    window.document.title = "Hello World in AS3 and EXML";
    var hello:helloWorld = new helloWorld();
    if (config && config.user) {
      hello.user = config.user;
    }
    ComponentMgr.create(hello);
  }

}
}
