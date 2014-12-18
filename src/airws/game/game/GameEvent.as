/**
 * Created by valpc on 18/12/2014.
 */
package airws.game.game {

import starling.events.Event;

public class GameEvent extends Event {

    public static const GAME_LOADED  = "gameLoaded";
    public static const GAME_STARTED = "gameStarted";
    public static const GAME_PAUSED  = "gamePaused";
    public static const GAME_ENDED   = "gameEnded";


    public function GameEvent(type:String, bubbles:Boolean = false, data:Object = null) {
        super(type, bubbles, data);
    }
}
}
