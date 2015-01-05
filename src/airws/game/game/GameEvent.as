/**
 * Created by valpc on 18/12/2014.
 */
package airws.game.game {

import starling.events.Event;

public class GameEvent extends Event {

    public static const GAME_LOADED:String  = "gameLoaded";
    public static const GAME_STARTED:String = "gameStarted";
    public static const GAME_PAUSED:String  = "gamePaused";
    public static const GAME_ENDED:String   = "gameEnded";
    public static const GAME_LOOSED:String  = "gameLoosed";
    public static const GAME_GET_BONUS:String = "gameGetBonus";


    public function GameEvent(type:String, bubbles:Boolean = false, data:Object = null) {
        super(type, bubbles, data);
    }
}
}
