/**
 * Created by valpc on 18/12/2014.
 */
package airws.level.levelLoader {
import airws.level.level.Level;

import starling.events.Event;

public class LevelLoaderEvent extends Event {

    public static const LEVEL_LOADED  = "levelLoaded";

    public var level: Level;

    public function LevelLoaderEvent(type:String, bubbles:Boolean = false, data:Object = null) {
        super(type, bubbles, data);
    }
}
}
