package com.acme.extas.portal.config {

import ext.config.panel;

// Do not edit. This is an auto-generated class.

/**
 * 
 *
 * <p>This class serves as a typed config object for the constructor of the class <code>com.acme.extas.portal.Portal</code>.
 * It defines the EXML element <code>&lt;caepc:portal></code> with <code>xmlns:caepc="exml:com.acme.extas.portal.config"</code>.</p>
 * <p>Using this config class also takes care of registering the target class under the xtype
 * <code>"com.acme.extas.portal.config.portal"</code> with Ext JS.</p>
 *
 * @see com.acme.extas.portal.Portal
 */
[ExtConfig(target="com.acme.extas.portal.Portal", xtype)]
public class portal extends ext.config.panel {

  public static native function get xtype():String;

  /**
   * <p>Use this constructor to create a typed config object for the constructor of the class
   * <code>com.acme.extas.portal.Portal</code>.
   * Using this config class also takes care of registering the target class under the xtype
   * "com.acme.extas.portal.config.portal" with Ext JS.
   * </p>
   *
   * @see com.acme.extas.portal.Portal
   */
  public function portal(config:Object = null) {
    super(config || {});
  }

}
}
