package com.acme.extas.portal.config {

import ext.config.container;

// Do not edit. This is an auto-generated class.

/**
 * A portal column is placed in a portal and contains portlets.
 *
 * <p>This class serves as a typed config object for the constructor of the class <code>com.acme.extas.portal.PortalColumn</code>.
 * It defines the EXML element <code>&lt;caepc:portalColumn></code> with <code>xmlns:caepc="exml:com.acme.extas.portal.config"</code>.</p>
 * <p>Using this config class also takes care of registering the target class under the xtype
 * <code>"com.acme.extas.portal.config.portalColumn"</code> with Ext JS.</p>
 *
 * @see com.acme.extas.portal.PortalColumn
 */
[ExtConfig(target="com.acme.extas.portal.PortalColumn", xtype)]
public class portalColumn extends ext.config.container {

  public static native function get xtype():String;

  /**
   * <p>Use this constructor to create a typed config object for the constructor of the class
   * <code>com.acme.extas.portal.PortalColumn</code>.
   * Using this config class also takes care of registering the target class under the xtype
   * "com.acme.extas.portal.config.portalColumn" with Ext JS.
   * </p>
   *
   * @see com.acme.extas.portal.PortalColumn
   */
  public function portalColumn(config:Object = null) {
    super(config || {});
  }

}
}
