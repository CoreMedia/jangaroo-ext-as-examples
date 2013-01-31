package com.acme.extas.localized {
import ext.ComponentMgr;

public class Main {
  public function Main(config:Object) {
    var hello:helloWorld = new helloWorld();
    if (config && config.user) {
      hello.user = config.user;
    }
    ComponentMgr.create(hello);
  }
}
}