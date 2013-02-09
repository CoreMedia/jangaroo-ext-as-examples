package com.acme.extas.exml {

import com.acme.extas.exml.config.helloWorld;

import ext.ComponentMgr;

import net.jangaroo.ext.ExtDefaultTheme;

//noinspection JSUnusedGlobalSymbols
public class Main {

  //noinspection JSUnusedGlobalSymbols
  public function Main(config:Object = null):void {
    window.document.title = "Hello World in EXML";
    ExtDefaultTheme.load(function():void {
      ComponentMgr.create(new helloWorld(config));
    });
  }

}
}