/**
 * The Application that bootstraps HelloWorld start.
 * Essentially, it delegates to HelloWorld.main().
 */
package com.acme.extas.localized {
import ext.app.Application;

//noinspection JSUnusedGlobalSymbols
public class HelloWorldApplication extends Application {

  //noinspection JSUnusedGlobalSymbols
  public function HelloWorldApplication() {
    var config:Application = {};
    config.name = "HelloWorld";
    super(config);
  }

  override public function launch(profile:String):Boolean {
    new HelloWorld({
      user: "Joe"
    });
    return false;
  }
}
}
