/**
 * Created by valpc on 04/01/2015.
 */
package airws.level.level {
import starling.events.Event;

public class LevelEvent extends Event {

    public static const PLAYER_TOUCHED_COIN:String = "playerTouchedCoin";
    public static const PLAYER_TOUCHED_BONUS:String = "playerTouchedBonus";
    public static const PLAYER_TOUCHED_ENEMY:String = "playerTouchedEnemy";

    public function LevelEvent(type:String, bubbles:Boolean = false, data:Object = null) {
        super(type, bubbles, data);
    }
}
}
