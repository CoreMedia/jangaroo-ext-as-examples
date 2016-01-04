package com.acme.extas.localized {

import ext.Action;

import joo.ResourceBundleAwareClassLoader;

/**
 * Change the current locale of the Jangaroo Ext AS application.
 */
public class ChangeLocaleActionBase extends Action {

  internal static const CURRENT_LOCALE:String = ResourceBundleAwareClassLoader.INSTANCE.getLocale();

  internal function changeLocale():void {
    ResourceBundleAwareClassLoader.INSTANCE.setLocale(ChangeLocaleAction(initialConfig).locale);
    window.location.reload();
  }
}
}