/**
 * Created by valpc on 03/01/2015.
 */
package airws.map {
import airws.game.game.GameEvent;
import airws.level.level.LevelEvent;

import starling.core.Starling;
import starling.display.MovieClip;
import starling.display.Sprite;

public interface IMapObject {

    function IMapObject();

    function getTouchEvent():LevelEvent;
}
}
