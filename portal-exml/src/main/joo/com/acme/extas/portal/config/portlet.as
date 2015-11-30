package com.acme.extas.portal.config {

import ext.config.panel;

// Do not edit. This is an auto-generated class.

/**
 * A portlet is placed in a portlet column, has some controls ("tools"), and can show
    arbitrary content. By default, a portlet is collapsible, has a setting tool ("gear")
    and a close tool.
 *
 * <p>This class serves as a typed config object for the constructor of the class <code>com.acme.extas.portal.Portlet</code>.
 * It defines the EXML element <code>&lt;caepc:portlet></code> with <code>xmlns:caepc="exml:com.acme.extas.portal.config"</code>.</p>
 * <p>Using this config class also takes care of registering the target class under the xtype
 * <code>"com.acme.extas.portal.config.portlet"</code> with Ext JS.</p>
 *
 * @see com.acme.extas.portal.Portlet
 */
[ExtConfig(target="com.acme.extas.portal.Portlet", xtype)]
public class portlet extends ext.config.panel {

  public static native function get xtype():String;

  /**
   * <p>Use this constructor to create a typed config object for the constructor of the class
   * <code>com.acme.extas.portal.Portlet</code>.
   * Using this config class also takes care of registering the target class under the xtype
   * "com.acme.extas.portal.config.portlet" with Ext JS.
   * </p>
   *
   * @see com.acme.extas.portal.Portlet
   */
  public function portlet(config:Object = null) {
    super(config || {});
  }

}
}
