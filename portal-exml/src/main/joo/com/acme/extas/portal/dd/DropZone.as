package com.acme.extas.portal.dd {

import com.acme.extas.portal.PortalBase;

import ext.Component;
import ext.Container;
import ext.Ext;
import ext.IEventObject;
import ext.Panel;
import ext.config.droptarget;
import ext.dd.DragSource;
import ext.dd.DropTarget;
import ext.dd.PanelProxy;
import ext.dd.ScrollManager;

import js.HTMLElement;

/**
 * The drop zone of a Portal component.
 *
 * @see com.acme.extas.portal.PortalBase
 */
public class DropZone extends DropTarget {
  public function DropZone(portal:PortalBase, cfg:Object) {
    this.portal = portal;
    ScrollManager.register(portal.body);
    super(portal.bwrap.dom, droptarget(Ext.apply(cfg, {
      ddScrollConfig: {
        vthresh:   50,
        hthresh:   -1,
        animate:   true,
        increment: 200
      }
    })));
    portal.body['ddScrollConfig'] = this['ddScrollConfig'];
  }

  override public function notifyOver(dd:DragSource, e:IEventObject, data:Object):String {
    var xy:Object = e.getXY();
    var px:PanelProxy = PanelProxy(dd.getProxy());

    // case column widths
    if (!grid) {
      grid = getGrid();
    }

    // handle case scroll where scrollbars appear during drag
    var cw:Number = portal.body.dom.clientWidth;
    if (!lastCW) {
      lastCW = cw;
    } else if (lastCW != cw) {
      lastCW = cw;
      portal.doLayout();
      grid = getGrid();
    }

    // determine column
    var col:int = 0;
    var xs:Array = grid.columnX;
    var cmatch:Boolean = false;
    for (var len:int = xs.length; col < len; col++) {
      if (xy[0] < (xs[col].x + xs[col].w)) {
        cmatch = true;
        break;
      }
    }
    // no match, fix last index
    if (!cmatch) {
      col--;
    }

    // find insert position
    var p:Component;
    var match:Boolean = false;
    var pos:Number = 0;
    var c:Container = portal.items.itemAt(col) as Container;
    var items:Array = c.items.getRange();
    var overSelf:Boolean = false;

    for (len = items.length; pos < len; pos++) {
      p = items[pos];
      var h:int = p.el.getHeight();
      if (h === 0) {
        overSelf = true;
      }
      else if ((p.el.getY() + (h / 2)) > xy[1]) {
        match = true;
        break;
      }
    }

    pos = (match && p ? pos : c.items.getCount()) + (overSelf ? -1 : 0);
    var overEvent:DropEvent = new DropEvent(this, dd, e, data, col, c, pos);

    if (portal.fireEvent('validatedrop', overEvent) !== false &&
            portal.fireEvent('beforedragover', overEvent) !== false) {

      // make sure proxy width is fluid
      px.getProxy().setWidth('auto');

      if (p) {
        px.moveProxy(p.el.dom.parentNode as HTMLElement, match ? p.el.dom : null);
      } else {
        px.moveProxy(c.el.dom, null);
      }

      this.lastPos = {c: c, col: col, p: overSelf || (match && p) ? pos : false};
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

  override public function notifyDrop(dd:DragSource, e:IEventObject, data:Object):Boolean {
    this.grid = null;
    if (!this.lastPos) {
      return false;
    }
    var c:Container = this.lastPos.c, col:int = this.lastPos.col, pos:* = this.lastPos.p;

    var dropEvent:DropEvent = new DropEvent(this, dd, e, data, col, c,
            pos !== false ? pos : c.items.getCount());

    if (this.portal.fireEvent('validatedrop', dropEvent) !== false &&
            this.portal.fireEvent('beforedrop', dropEvent) !== false) {

      PanelProxy(dd.getProxy()).getProxy().remove();
      var panel:Panel = dd['panel'];
      panel.el.dom.parentNode.removeChild(panel.el.dom);

      if (pos !== false) {
        if (c == panel.ownerCt && (c.items.indexOf(panel) <= pos)) {
          pos++;
        }
        c.insert(pos, panel);
      } else {
        c.add(panel);
      }

      c.doLayout();

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

  // internal cache of body and column coordinates
  private function getGrid():Object {
    var box:Object = this.portal.bwrap.getBox();
    box.columnX = [];
    this.portal.items.each(function (c:Component):void {
      box.columnX.push({x: c.el.getX(), w: c.el.getWidth()});
    });
    return box;
  }


  internal var portal:PortalBase;
  private var grid:Object;
  private var lastCW:Number;
  private var lastPos:Object;
  private var scrollPos:Object;
}
}
