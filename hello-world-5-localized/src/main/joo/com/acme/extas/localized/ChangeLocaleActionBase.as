package com.acme.extas.localized {

import com.acme.extas.localized.config.changeLocaleAction;

import ext.Action;

import joo.ResourceBundleAwareClassLoader;

public class ChangeLocaleActionBase extends Action {

  internal static const CURRENT_LOCALE:String = ResourceBundleAwareClassLoader.INSTANCE.getLocale();

  /**
   * Change the current locale of the Jangaroo Ext AS application.
   */
  public function ChangeLocaleActionBase(config:changeLocaleAction) {
    super(config);
  }

  internal function changeLocale():void {
    ResourceBundleAwareClassLoader.INSTANCE.setLocale(initialConfig.locale);
    window.location.reload();
  }
}
}