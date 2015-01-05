/**
 * Created by valpc on 03/01/2015.
 */
package airws.map {
import airws.game.game.GameEvent;
import airws.level.level.LevelEvent;

import starling.core.Starling;
import starling.display.MovieClip;
import starling.display.Sprite;

public interface MapObject {

    function MapObject();

    function getTouchEvent():LevelEvent;
    function getType():String;
    function setSprite():void;
}
}
