package com.acme.extas.util {
import ext.data.Model;
import ext.grid.GridPanel;
import ext.grid.feature.RowBody;

/**
 * The Preview RowBody Feature enables toggle of a configurable preview of all visible records.
 *
 * Note: This feature does NOT assert itself against an existing RowBody feature and may conflict with
 * another instance of the same feature.
 */
public class PreviewRowBodyFeature extends RowBody {

  public var id:String = "preview";
  public var $configPrefixed:Boolean = false;

  public static function getInstance(grid:GridPanel):PreviewRowBodyFeature {
    return PreviewRowBodyFeature(grid.getView().getFeature("preview"));
  }

  /**
   * css class to use to hide the body
   */
  [ExtConfig]
  public var hideBodyCls:String = 'x-grid-row-body-hidden';

  /**
   * Field to display in the preview. Must be a field within the Model definition
   * that the store is using.
   */
  [ExtConfig]
  public var bodyField:String = '';

  [Bindable]
  public var previewExpanded:Boolean = true;

  public function PreviewRowBodyFeature(config:PreviewRowBodyFeature = null) {
    super(config);
  }

  override protected function getAdditionalData(data:Object, idx:Number, record:Model, orig:Object):Object {
    return {
      rowBody: data[bodyField],
      rowBodyCls: previewExpanded ? '' : hideBodyCls
    };
  }

  //noinspection JSUnusedGlobalSymbols
  public function updatePreviewExpanded(newExpanded:Boolean, oldExpanded:Boolean):Boolean {
    if (newExpanded !== oldExpanded) {
      view['refreshView']();
      // If we are using the touch scroller, ensure that the scroller knows about
      // the correct scrollable range
      var scrollManager:* = view['scrollManager'];
      if (scrollManager) {
        var bufferedRenderer:* = view['bufferedRenderer'];
        if (bufferedRenderer) {
          bufferedRenderer.stretchView(view, bufferedRenderer.getScrollHeight(true));
        } else {
          scrollManager.refresh(true);
        }
      }
    }
  }
}
}
