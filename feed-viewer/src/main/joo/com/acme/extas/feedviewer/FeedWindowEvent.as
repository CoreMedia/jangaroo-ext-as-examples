/**
 * Events fired by FeedWindow.
 */
package com.acme.extas.feedviewer {
import net.jangaroo.ext.FlExtEvent;

public class FeedWindowEvent extends FlExtEvent {
  //noinspection JSUnusedGlobalSymbols
  public static const __PARAMETER_SEQUENCE__:Array = ["source", "title", "url", "description", "eOpts"];

  //noinspection JSUnusedGlobalSymbols
  /**
   * @eventType onFeedValid
   */
  public static const FEED_VALID:String = "onFeedValid";

  public function FeedWindowEvent(type:String, arguments:Array) {
    super(type, arguments);
  }

  public native function get source():FeedWindow;
  public native function get title():String;
  public native function get url():String;
  public native function get description():String;
}
}
