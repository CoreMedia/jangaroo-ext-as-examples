package com.acme.extas.portal.dd {

import com.acme.extas.portal.PortalPanelBase;

import ext.Component;
import ext.Container;
import ext.Ext;
import ext.IEventObject;
import ext.Panel;
import ext.config.droptarget;
import ext.dd.DragSource;
import ext.dd.DropTarget;
import ext.dd.IDDScrollConfig;
import ext.dd.ScrollManager;
import ext.dd.StatusProxy;
import ext.panel.DD;

import js.HTMLElement;

/**
 * Internal class that manages drag/drop for {@link PortalPanelBase}.
 */
public class DropZone extends DropTarget {

  public function DropZone(portal:PortalPanelBase, cfg:droptarget) {
    this.portal = portal;
    ScrollManager.register(portal.body);
    super(portal.body, cfg);
    portal.body.ddScrollConfig = ddScrollConfig;
  }

  private static var ddScrollConfig:IDDScrollConfig = IDDScrollConfig({});
  ddScrollConfig.vthresh = 50;
  ddScrollConfig.hthresh = -1;
  ddScrollConfig.animate = true;
  ddScrollConfig.increment = 200;

  private function createEvent(dd:DragSource, e:IEventObject, data:Object, col:int, c:Container, pos:Number):DropEvent {
      return new DropEvent(
              this,
              dd,
              e,
              data,
              col,
              c,
              pos
      );
  }

  override public function notifyOver(ds:DragSource, e:IEventObject, data:Object):String {
    var dd:DD = DD(ds);
    var xy:Object = e.getXY(),
            portal:PortalPanelBase = this.portal,
            proxy:StatusProxy = dd.getProxy();

    // case column widths
    if (!this.grid) {
      this.grid = this.getGrid();
    }

    // handle case scroll where scrollbars appear during drag
    var cw:Number = portal.body.dom.clientWidth;
    if (!this.lastCW) {
      // set initial client width
      this.lastCW = cw;
    } else if (this.lastCW != cw) {
      // client width has changed, so refresh layout & grid calcs
      this.lastCW = cw;
      //portal.doLayout();
      this.grid = this.getGrid();
    }

    // determine column
        var colIndex:int = 0,
            colRight:int = 0,
            cols:Array = this.grid.columnX,
            len:int = cols.length,
            cmatch:Boolean = false;

        for (len; colIndex < len; colIndex++) {
            colRight = cols[colIndex].x + cols[colIndex].w;
            if (xy[0] < colRight) {
                cmatch = true;
                break;
            }
        }
        // no match, fix last index
        if (!cmatch) {
            colIndex--;
        }

        // find insert position
        var overPortlet:Component, pos:int = 0,
            h:int = 0,
            match:Boolean = false,
            overColumn:Container = Container(portal.itemCollection.getAt(colIndex)),
            portlets:Array = overColumn.itemCollection.getRange(),
            overSelf:Boolean = false;

        len = portlets.length;

        for (len; pos < len; pos++) {
            overPortlet = portlets[pos];
            h = overPortlet.el.getHeight();
            if (h === 0) {
                overSelf = true;
            } else if ((overPortlet.el.getY() + (h / 2)) > xy[1]) {
                match = true;
                break;
            }
        }

        pos = (match && overPortlet ? pos : overColumn.itemCollection.getCount()) + (overSelf ? -1 : 0);
        var overEvent:DropEvent = this.createEvent(dd, e, data, colIndex, overColumn, pos);

        if (portal.fireEvent('validatedrop', overEvent) !== false && portal.fireEvent('beforedragover', overEvent) !== false) {

            // make sure proxy width is fluid in different width columns
            proxy.getProxy().setWidth('auto');
            if (overPortlet) {
                dd.panelProxy.moveProxy(HTMLElement(overPortlet.el.dom.parentNode), match ? overPortlet.el.dom : null);
            } else {
                dd.panelProxy.moveProxy(overColumn.el.dom, null);
            }

            this.lastPos = {
                c: overColumn,
                col: colIndex,
                p: overSelf || (match && overPortlet) ? pos : false
            };
            this.scrollPos = portal.body.getScroll();

            portal.fireEvent('dragover', overEvent);
      return overEvent.status;
    } else {
      return overEvent.status;
    }

  }

  override public function notifyOut(source:DragSource, e:IEventObject, data:Object):void {
    this.grid = null;
  }

  override public function notifyDrop(ds:DragSource, e:IEventObject, data:Object):Boolean {
    var dd:DD = DD(ds);
    this.grid = null;
    if (!this.lastPos) {
      return false;
    }
    var c:Container = this.lastPos.c,
            col:int = this.lastPos.col,
            pos:* = this.lastPos.p,
            panel:Panel = dd.panel,
            dropEvent:DropEvent = this.createEvent(dd, e, data, col, c, pos !== false ? pos : c.itemCollection.getCount());

    if (this.portal.fireEvent('validatedrop', dropEvent) !== false &&
            this.portal.fireEvent('beforedrop', dropEvent) !== false) {

            Ext.suspendLayouts();

            // make sure panel is visible prior to inserting so that the layout doesn't ignore it
            panel.el.dom.style.display = '';
            dd.panelProxy.hide();
            dd.getProxy().hide();

      if (pos !== false) {
        c.insert(pos, panel);
      } else {
        c.add(panel);
      }

            Ext.resumeLayouts(true);

      this.portal.fireEvent('drop', dropEvent);

      // scroll position is lost on drop, fix it
      var st:int = this.scrollPos.top;
      if (st) {
        var d:HTMLElement = this.portal.body.dom;
        window.setTimeout(function():void {
          d.scrollTop = st;
        }, 10);
      }

    }

    this.lastPos = null;
    return true;
  }

    // internal cache of body and column coords
  private function getGrid():Object {
    var box:Object = this.portal.body['getBox']();
    box.columnX = [];
    this.portal.itemCollection.each(function (c:Component):void {
      box.columnX.push({
        x: c.el.getX(),
        w: c.el.getWidth()
      });
    });
    return box;
  }

  // unregister the dropzone from ScrollManager
  override public function unreg():void {
    ScrollManager.unregister(this.portal.body);
    super.unreg();
  }

  internal var portal:PortalPanelBase;
  private var grid:Object;
  private var lastCW:Number;
  private var lastPos:Object;
  private var scrollPos:Object;
}
}
