package com.acme.extas.portal.dd {

import com.acme.extas.portal.PortalBase;

import ext4.Component;
import ext4.container.Container;
import ext4.Ext;
import ext4.SEventObject;
import ext4.panel.Panel;
import ext4.dd.DragSource;
import ext4.dd.DropTarget;
import ext4.panel.Proxy;
import ext4.dd.ScrollManager;

import js.HTMLElement;

/**
 * The drop zone of a Portal component.
 *
 * @see com.acme.extas.portal.PortalBase
 */
public class DropZone extends DropTarget {
  public function DropZone(portal:PortalBase, cfg:Object) {
    this.portal = portal;
    ScrollManager.register(portal.getLayout());
    var ddScrollConfig:Object = {};
    ddScrollConfig.vthresh = 50;
    ddScrollConfig.hthresh = -1;
    ddScrollConfig.animate = true;
    ddScrollConfig.increment = 200;
    super(portal['bwrap'].dom, Ext.apply(cfg, { ddScrollConfig:ddScrollConfig }));
    portal.getLayout()['ddScrollConfig'] = ddScrollConfig;
  }

  override public function notifyOver(dd:DragSource, e:SEventObject, data:Object):String {
    var xy:Object = e.getXY();
    var px:Proxy = Proxy(dd.getProxy());

    // case column widths
    if (!grid) {
      grid = getGrid();
    }

    // handle case scroll where scrollbars appear during drag
    var cw:Number = portal.getLayout()['dom'].clientWidth;
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
    var c:Container = portal.items.get(col) as Container;
    var items:Array = c.items.getRange();
    var overSelf:Boolean = false;

    for (len = items.length; pos < len; pos++) {
      p = items[pos];
      var h:int = p.getEl().getHeight();
      if (h === 0) {
        overSelf = true;
      }
      else if ((p.getEl().getY(null) + (h / 2)) > xy[1]) {
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
        px.moveProxy(HTMLElement(p.getEl().dom['parentNode']), match ? p.getEl().dom : null);
      } else {
        px.moveProxy(c.getEl().dom, null);
      }

      this.lastPos = {c: c, col: col, p: overSelf || (match && p) ? pos : false};
      this.scrollPos = portal.getLayout()['getScroll']();

      portal.fireEvent('dragover', overEvent);

      return overEvent.status;
    } else {
      return overEvent.status;
    }

  }

  override public function notifyOut(source:DragSource, e:SEventObject, data:Object):void {
    this.grid = null;
  }

  override public function notifyDrop(dd:DragSource, e:SEventObject, data:Object):Boolean {
    this.grid = null;
    if (!this.lastPos) {
      return false;
    }
    var c:Container = this.lastPos.c, col:int = this.lastPos.col, pos:* = this.lastPos.p;

    var dropEvent:DropEvent = new DropEvent(this, dd, e, data, col, c,
            pos !== false ? pos : c.items.getCount());

    if (this.portal.fireEvent('validatedrop', dropEvent) !== false &&
            this.portal.fireEvent('beforedrop', dropEvent) !== false) {

      Proxy(dd.getProxy()).getProxy().remove();
      var panel:Panel = dd['panel'];
      panel.getEl().dom.parentNode.removeChild(panel.getEl().dom);

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
        var d:HTMLElement = this.portal.getLayout()['dom'];
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
    var box:Object = this.portal.getEl().getBox();
    box.columnX = [];
    this.portal.items.each(function (c:Component):void {
      box.columnX.push({x: c.getEl().getX(null), w: c.getEl().getWidth()});
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
