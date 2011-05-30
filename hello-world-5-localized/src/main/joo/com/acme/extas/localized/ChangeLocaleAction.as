package com.acme.extas.localized {

import ext.Action;
import ext.Ext;

import joo.ResourceBundleAwareClassLoader;

public class ChangeLocaleAction extends Action {

  public static const atype:String = "com.acme.extas.localized.ChangeLocaleAction";

  /**
   * Change the current locale of the Jangaroo Ext AS application.
   * @cfg {String} locale the new locale to set
   */
  public function ChangeLocaleAction(config:Object) {
    super(Ext.applyIf({
        disabled: config.locale === ResourceBundleAwareClassLoader.INSTANCE.getLocale(),
        handler: changeLocale
      }, config));
  }

  private function changeLocale():void {
    ResourceBundleAwareClassLoader.INSTANCE.setLocale(initialConfig.locale);
    window.location.reload();
  }
}
}