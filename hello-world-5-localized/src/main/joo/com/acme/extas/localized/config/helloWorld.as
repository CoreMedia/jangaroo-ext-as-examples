package com.acme.extas.localized.config {

import ext.config.viewport;

// Do not edit. This is an auto-generated class.

/**
 * 
 *
 * <p>This class serves as a typed config object for the constructor of the class <code>com.acme.extas.localized.HelloWorld</code>.
 * It defines the EXML element <code>&lt;caelc:helloWorld></code> with <code>xmlns:caelc="exml:com.acme.extas.localized.config"</code>.</p>
 * <p>Using this config class also takes care of registering the target class under the xtype
 * <code>"com.acme.extas.localized.config.helloWorld"</code> with Ext JS.</p>
 *
 * @see com.acme.extas.localized.HelloWorld
 */
[ExtConfig(target="com.acme.extas.localized.HelloWorld", xtype)]
public class helloWorld extends ext.config.viewport {

  public static native function get xtype():String;

  /**
   * <p>Use this constructor to create a typed config object for the constructor of the class
   * <code>com.acme.extas.localized.HelloWorld</code>.
   * Using this config class also takes care of registering the target class under the xtype
   * "com.acme.extas.localized.config.helloWorld" with Ext JS.
   * </p>
   *
   * @see com.acme.extas.localized.HelloWorld
   */
  public function helloWorld(config:Object = null) {
    super(config || {});
  }

  /**
   * The name of the user to greet.
   */
  public native function get user():String;
  /**
   * @private
   */
  public native function set user(value:String):void;
}
}
