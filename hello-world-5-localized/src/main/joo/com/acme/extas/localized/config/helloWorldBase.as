package com.acme.extas.localized.config {

import ext.config.viewport;

/**
 * 
 *
 * <p>This class serves as a typed config object for the constructor of the component class <code>HelloWorldBase</code>.
 * Instantiating this class for the first time also registers the corresponding component class under the xtype
 * "com.acme.extas.localized.config.helloWorldBase" with ExtJS.</p>
 *
 * @see com.acme.extas.localized.HelloWorldBase
 */
[ExtConfig(target="com.acme.extas.localized.HelloWorldBase", xtype)]
public dynamic class helloWorldBase extends ext.config.viewport {

  public static native function get xtype():String;

  /**
   * <p>Use this constructor to create a typed config object for the constructor of the component class
   * <code>HelloWorldBase</code> and register the component with ExtJS.</p>
   *
   * @see com.acme.extas.localized.HelloWorldBase
   */
  public function helloWorldBase(config:Object = null) {
    super(config || {});
  }

  /**
   * the name of the user to greet
   */
  public native function get user():String;
  /**
   * @private
   */
  public native function set user(value:String):void;
}
}