package com.acme.extas.as3exml.config {

import ext.config.viewport;

// Do not edit. This is an auto-generated class.

/**
 * 
 *
 * <p>This class serves as a typed config object for the constructor of the class <code>com.acme.extas.as3exml.HelloWorld</code>.
 * It defines the EXML element <code>&lt;caeac:helloWorld></code> with <code>xmlns:caeac="exml:com.acme.extas.as3exml.config"</code>.</p>
 * <p>Using this config class also takes care of registering the target class under the xtype
 * <code>"com.acme.extas.as3exml.config.helloWorld"</code> with Ext JS.</p>
 *
 * @see com.acme.extas.as3exml.HelloWorld
 */
[ExtConfig(target="com.acme.extas.as3exml.HelloWorld", xtype)]
public class helloWorld extends ext.config.viewport {

  public static native function get xtype():String;

  /**
   * <p>Use this constructor to create a typed config object for the constructor of the class
   * <code>com.acme.extas.as3exml.HelloWorld</code>.
   * Using this config class also takes care of registering the target class under the xtype
   * "com.acme.extas.as3exml.config.helloWorld" with Ext JS.
   * </p>
   *
   * @see com.acme.extas.as3exml.HelloWorld
   */
  public function helloWorld(config:Object = null) {
    super(config || {});
  }

}
}
