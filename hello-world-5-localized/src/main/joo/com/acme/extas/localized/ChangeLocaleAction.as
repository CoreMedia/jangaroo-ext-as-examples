package com.acme.extas.localized {

import com.acme.extas.localized.config.changeLocaleAction;

import ext.Action;
import ext.Ext;
import ext.config.action;

import joo.ResourceBundleAwareClassLoader;

public class ChangeLocaleAction extends Action {

  /**
   * Change the current locale of the Jangaroo Ext AS application.
   */
  public function ChangeLocaleAction(config:changeLocaleAction) {
    super(action(Ext.applyIf({
        disabled: config.locale === ResourceBundleAwareClassLoader.INSTANCE.getLocale(),
        handler: changeLocale
      }, config)));
  }

  private function changeLocale():void {
    ResourceBundleAwareClassLoader.INSTANCE.setLocale(initialConfig.locale);
    window.location.reload();
  }
}
}