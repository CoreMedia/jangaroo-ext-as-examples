package com.acme.extas.localized {

import ext.Action;
import ext.config.action;

/**
 * Change the current locale of the Jangaroo Ext AS application.
 */
public class ChangeLocaleAction extends Action {

  public function ChangeLocaleAction() {
    super(action(this));
    // TODO: disabling!
  }

  /**
   * The new locale to set.
   */
  public var locale:String;

  public var text:String;

  //noinspection JSUnusedGlobalSymbols,JSMethodCanBeStatic
  public function handler():void {
    // TODO.setLocale(locale);
    window.location.reload();
  }
}
}