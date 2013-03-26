package com.acme.extas.portal {
import ext.Panel;

public class Portlet extends Panel {

  private var closing:Boolean;

  public function Portlet(config:Object = null) {
    super(config);
  }

  override public function doClose():void {
    if (!this.closing) {
      this.closing = true;
      this.el.animate({
        opacity: 0,
        callback: function():void {
          var closeAction:String = this.closeAction;
          this.closing = false;
          this.fireEvent('close', this);
          this[closeAction]();
          if (closeAction == 'hide') {
            this.el.setOpacity(1);
          }
        },
        scope: this
      });
    }
  }
}
}