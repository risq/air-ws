/**
 * Created by valpc on 18/12/2014.
 */
package airws.game.gameManager {

import starling.events.Event;

public class GameManagerEvent extends Event {

    public static const GAMEMANAGER_LOADED: String  = "gameManagerLoaded";


    public function GameManagerEvent(type:String, bubbles:Boolean = false, data:Object = null) {
        super(type, bubbles, data);
    }
}
}
