/**
 * Created by vledrapier on 05/01/2015.
 */
package airws.map {
import airws.Static;
import airws.level.level.LevelEvent;

import starling.core.Starling;

import starling.display.MovieClip;
import starling.display.Sprite;

public class BonusObject extends Sprite implements MapObject {
    private var objectMovieClip:MovieClip;

    public function BonusObject() {

    }

    public function getTouchEvent():LevelEvent {
        this.visible = false;
        return new LevelEvent(LevelEvent.PLAYER_TOUCHED_BONUS);
    }

    public function getType():String {
        return "bonus";
    }

    public function setSprite():void {
        objectMovieClip = new MovieClip(Static.assetManager.getTextureAtlas("bonus").getTextures(), 30);
        objectMovieClip.x = - objectMovieClip.width  / 2;
        objectMovieClip.y = - objectMovieClip.height / 2;
        addChild(objectMovieClip);
        Starling.juggler.add(objectMovieClip);
        objectMovieClip.play();
    }
}
}
