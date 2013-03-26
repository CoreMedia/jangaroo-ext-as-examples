package com.acme.extas.portal {

import com.acme.extas.portal.config.portalpanel;
import com.acme.extas.portal.dd.DropZone;

import ext.Component;

import ext.Panel;

/**
 * Base class for the portal component.
 * A portal aggregates a number of portal columns, which in turn contain portlets.
 * The portal enables drap and drop of portlets between portal columns.
 *
 * @see PortalColumn
 * @see Portlet
 */
public class PortalPanel extends Panel {

  private var portalDropZone:DropZone;

  public function PortalPanel(config:portalpanel = null) {
    super(config);
  }

  override protected function initComponent():void {
    // Implement a Container beforeLayout call from the layout to this Container
    this.layout = {
      type: 'column'
    };
    super.initComponent();

    this.addEvents(
            'validatedrop',
            'beforedragover',
            'dragover',
            'beforedrop',
            'drop'
    );

  }

  // Set columnWidth, and set first and last column classes to allow exact CSS targeting.
  override public function beforeLayout():void {
    var items:Array = this.getLayout().getLayoutItems(),
            len:int = items.length,
            firstAndLast:Array = ['x-portal-column-first', 'x-portal-column-last'],
            i:int, item:Component, last:Boolean;

    for (i = 0; i < len; i++) {
      item = items[i];
      item.columnWidth = 1 / len;
      last = (i == len-1);

      if (i === 0) { // if (first)
        if (last) {
          item.addCls(firstAndLast);
        } else {
          item.addCls('x-portal-column-first');
          item.removeCls('x-portal-column-last');
        }
      } else if (last) {
        item.addCls('x-portal-column-last');
        item.removeCls('x-portal-column-first');
      } else {
        item.removeCls(firstAndLast);
      }
    }

    super.beforeLayout();
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
