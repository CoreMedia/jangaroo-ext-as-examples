package com.acme.extas.localized {

import ext.Action;
import ext.Ext;

import js.Location;

/**
 * Change the current locale of the Jangaroo Ext AS application.
 */
public class ChangeLocaleAction extends Action {

  internal static const CURRENT_LOCALE:String = Ext.manifest.locale;

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
    Ext.apply(superConfig, config);
    superConfig.disabled = config.locale === CURRENT_LOCALE;
    superConfig.handler = changeLocale;
    super(superConfig);
  }

  private static const LOCALE_PATTERN:RegExp = /locale=[a-z_]+/g;

  internal function changeLocale():void {
    var newLocale:String = "locale=" + ChangeLocaleAction(initialConfig).locale;
    var location:Location = window.location;
    var href:String = location.href;
    location.href = LOCALE_PATTERN.test(href)
      ? href.replace(LOCALE_PATTERN, newLocale)
      : href + "&" + newLocale;
  }
}
}