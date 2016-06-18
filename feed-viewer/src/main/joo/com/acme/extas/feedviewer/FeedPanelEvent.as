/**
 * Events fired by FeedPanel.
 */
package com.acme.extas.feedviewer {
import net.jangaroo.ext.FlExtEvent;

public class FeedPanelEvent extends FlExtEvent {
  //noinspection JSUnusedGlobalSymbols
  public static const __PARAMETER_SEQUENCE__:Array = ["source", "title", "url", "eOpts"];

  //noinspection JSUnusedGlobalSymbols
  /**
   * Fired when a feed is removed.
   * @eventType onFeedRemoved
   */
  public static const FEED_REMOVED:String = "onFeedRemoved";

  //noinspection JSUnusedGlobalSymbols
  /**
   * Fired when a feed is selected.
   * @eventType onFeedSelect
   */
  public static const FEED_SELECT:String = "onFeedSelect";

  public function FeedPanelEvent(type:String, arguments:Array) {
    super(type, arguments);
  }

  public native function get source():FeedPanel;

  /**
   * The title of the feed.
   */
  public native function get title():String;

  /**
   * The url of the feed.
   */
  public native function get url():String;
}
}
