package com.acme.extas.localized {

import ext.Action;
import ext.config.action;

/**
 * Change the current locale of the Jangaroo Ext AS application.
 */
public class ChangeLocaleAction extends Action {

  public function ChangeLocaleAction() {
    this.handler = doIt;
    // TODO: disabling!
  }

  /**
   * The new locale to set.
   */
  public var locale:String;

  //noinspection JSUnusedGlobalSymbols,JSMethodCanBeStatic
  public function doIt():void {
    // TODO.setLocale(locale);
    window.location.reload();
  }
}
}