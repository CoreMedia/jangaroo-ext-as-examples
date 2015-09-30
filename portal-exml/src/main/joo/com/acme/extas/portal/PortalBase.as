package com.acme.extas.portal {

import com.acme.extas.portal.config.portal;
import com.acme.extas.portal.dd.DropZone;

import ext.Panel;

/**
 * Base class for the portal component.
 * A portal aggregates a number of portal columns, which in turn contain portlets.
 * The portal enables drap and drop of portlets between portal columns.
 *
 * @see PortalColumn
 * @see Portlet
 */
public class PortalBase extends Panel {

  private var portalDropZone:DropZone;

  public function PortalBase(config:portal = null) {
    super(config);
  }

  override protected function initComponent():void {
    super.initComponent();
    this.addEvents(
            'validatedrop',
            'beforedragover',
            'dragover',
            'beforedrop',
            'drop'
    );

  }

  override protected function initEvents():void {
    super.initEvents();
    this.portalDropZone = new DropZone(this, this['dropConfig']);
  }

  override protected function beforeDestroy():void {
    if (this.portalDropZone) {
      this.portalDropZone.unreg();
    }
    super.beforeDestroy();
  }
}

}
