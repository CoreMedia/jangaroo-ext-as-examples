package com.acme.extas.localized.config {

import ext.config.action;

/**
 * 
 *
 * <p>This class serves as a typed config object for the constructor of the component class <code>ChangeLocaleAction</code>.
 * Instantiating this class for the first time also registers the corresponding component class under the xtype
 * "com.acme.extas.localized.config.changeLocaleAction" with ExtJS.</p>
 *
 * @see com.acme.extas.localized.ChangeLocaleAction
 */
[ExtConfig(target="com.acme.extas.localized.ChangeLocaleAction")]
public dynamic class changeLocaleAction extends ext.config.action {

  public static native function get xtype():String;

  /**
   * <p>Use this constructor to create a typed config object for the constructor of the component class
   * <code>ChangeLocaleAction</code> and register the component with ExtJS.</p>
   *
   * @see com.acme.extas.localized.ChangeLocaleAction
   */
  public function changeLocaleAction(config:Object = null) {
    super(config || {});
  }

  /**
   * the new locale to set
   */
  public native function get locale():String;
  /**
   * @private
   */
  public native function set locale(value:String):void;
}
}