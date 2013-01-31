package com.acme.extas.portal {

import ext.ComponentMgr;

public class Main {
  public function Main() {
    window.document.title = "Ext JS Portal Demo in MXML";
    ComponentMgr.create(new portalExample());
  }
}
}