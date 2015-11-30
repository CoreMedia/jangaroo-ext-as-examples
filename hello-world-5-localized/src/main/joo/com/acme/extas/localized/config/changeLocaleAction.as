package com.acme.extas.localized.config {

import ext.config.action;

// Do not edit. This is an auto-generated class.

/**
 * Change the current locale of the Jangaroo Ext AS application.
 *
 * <p>This class serves as a typed config object for the constructor of the class <code>com.acme.extas.localized.ChangeLocaleAction</code>.
 * It defines the EXML element <code>&lt;caelc:changeLocaleAction></code> with <code>xmlns:caelc="exml:com.acme.extas.localized.config"</code>.</p>
 *
 * @see com.acme.extas.localized.ChangeLocaleAction
 */
[ExtConfig(target="com.acme.extas.localized.ChangeLocaleAction")]
public class changeLocaleAction extends ext.config.action {

  /**
   * <p>Use this constructor to create a typed config object for the constructor of the class
   * <code>com.acme.extas.localized.ChangeLocaleAction</code>.
   * </p>
   *
   * @see com.acme.extas.localized.ChangeLocaleAction
   */
  public function changeLocaleAction(config:Object = null) {
    super(config || {});
  }

  /**
   * The new locale to set.
   */
  public native function get locale():String;
  /**
   * @private
   */
  public native function set locale(value:String):void;
}
}
