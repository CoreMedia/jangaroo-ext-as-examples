package com.acme.extas.portal.config {

import ext.config.viewport;

// Do not edit. This is an auto-generated class.

/**
 * 
 *
 * <p>This class serves as a typed config object for the constructor of the class <code>com.acme.extas.portal.PortalExample</code>.
 * It defines the EXML element <code>&lt;caepc:portalExample></code> with <code>xmlns:caepc="exml:com.acme.extas.portal.config"</code>.</p>
 * <p>Using this config class also takes care of registering the target class under the xtype
 * <code>"com.acme.extas.portal.config.portalExample"</code> with Ext JS.</p>
 *
 * @see com.acme.extas.portal.PortalExample
 */
[ExtConfig(target="com.acme.extas.portal.PortalExample", xtype)]
public class portalExample extends ext.config.viewport {
  /**
   * 
   */
  public static const shortBogusMarkup:String = "<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed metus nibh, sodales a, porta at, vulputate eget, dui. Pellentesque ut nisl. Maecenas tortor turpis, interdum non, sodales non, iaculis ac, lacus. Vestibulum auctor, tortor quis iaculis malesuada, libero lectus bibendum purus, sit amet tincidunt quam turpis vel lacus. In pellentesque nisl non sem. Suspendisse nunc sem, pretium eget, cursus a, fringilla vel, urna.<\/p>";

  public static native function get xtype():String;

  /**
   * <p>Use this constructor to create a typed config object for the constructor of the class
   * <code>com.acme.extas.portal.PortalExample</code>.
   * Using this config class also takes care of registering the target class under the xtype
   * "com.acme.extas.portal.config.portalExample" with Ext JS.
   * </p>
   *
   * @see com.acme.extas.portal.PortalExample
   */
  public function portalExample(config:Object = null) {
    super(config || {});
  }

}
}
