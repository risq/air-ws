/**
 * Created by valpc on 18/12/2014.
 */
package airws.ui {
import airws.level.level.Level;

import starling.events.Event;

public class UIEvent extends Event {

    public static const CLICK_START  = "clickStart";
    public static const CLICK_PAUSE:String = "clickPause";
    public static const CLICK_QUIT:String = "clickQuit";
    public static const CLICK_RESET:String = "clickReset";

    public var level: Level;

    public function UIEvent(type:String, bubbles:Boolean = false, data:Object = null) {
        super(type, bubbles, data);
    }
}
}
