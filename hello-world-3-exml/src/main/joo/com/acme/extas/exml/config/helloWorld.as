package com.acme.extas.exml.config {

import ext.Button;
import ext.MessageBox;
import ext.config.viewport;
import ext.util.StringUtil;

// Do not edit. This is an auto-generated class.

/**
 * 
 *
 * <p>This class serves as a typed config object for the constructor of the class <code>com.acme.extas.exml.HelloWorld</code>.
 * It defines the EXML element <code>&lt;caeec:helloWorld></code> with <code>xmlns:caeec="exml:com.acme.extas.exml.config"</code>.</p>
 * <p>Using this config class also takes care of registering the target class under the xtype
 * <code>"com.acme.extas.exml.config.helloWorld"</code> with Ext JS.</p>
 *
 * @see com.acme.extas.exml.HelloWorld
 */
[ExtConfig(target="com.acme.extas.exml.HelloWorld", xtype)]
public class helloWorld extends ext.config.viewport {

  public static native function get xtype():String;

  /**
   * <p>Use this constructor to create a typed config object for the constructor of the class
   * <code>com.acme.extas.exml.HelloWorld</code>.
   * Using this config class also takes care of registering the target class under the xtype
   * "com.acme.extas.exml.config.helloWorld" with Ext JS.
   * </p>
   *
   * @see com.acme.extas.exml.HelloWorld
   */
  public function helloWorld(config:Object = null) {
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
