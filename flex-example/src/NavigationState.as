/**
 * Created with IntelliJ IDEA.
 * User: dhomann
 * Date: 27.03.13
 * Time: 16:13
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.events.Event;
import flash.events.EventDispatcher;

[Event(name="navigationChanged", type="flash.events.Event")]
public class NavigationState extends EventDispatcher {
  private var navState:String;
  private var id:Number;

  private static var id:Number = 0;

  public function NavigationState() {
    this.id = NavigationState.id++;
    trace(this.id + ": Initialized NavigationState");

  }

  public function set state(newState:String):void {
    trace(this.id + ": setState(" + newState + ")");

    navState = newState;

    dispatchEvent(new Event("navigationChanged", false, false));
  }

  [Bindable("navigationChanged")]
  public function get state():String {
    trace(this.id + ": getState() == " + navState);
    return navState;
  }
}
}
