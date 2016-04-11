package com.acme.extas.localized {

import ext.Action;
import joo.ResourceBundleAwareClassLoader;

/**
 * Change the current locale of the Jangaroo Ext AS application.
 */
public class ChangeLocaleAction extends Action {

  internal static const CURRENT_LOCALE:String = ResourceBundleAwareClassLoader.INSTANCE.getLocale();

  [ExtConfig]
  /**
   * The new locale to set.
   */
  public var locale:String;

  /**
   * Change the current locale of the Jangaroo Ext AS application.
   */
  public function ChangeLocaleAction(config:ChangeLocaleAction = null) {
    var superConfig:ChangeLocaleAction = {};
    superConfig.disabled = config.locale === CURRENT_LOCALE;
    superConfig.handler = changeLocale;
    superConfig.locale = config.locale;
    super(superConfig);
  }

  internal function changeLocale():void {
    ResourceBundleAwareClassLoader.INSTANCE.setLocale(ChangeLocaleAction(initialConfig).locale);
    window.location.reload();
  }
}
}