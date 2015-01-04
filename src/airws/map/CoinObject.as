/**
 * Created by valpc on 03/01/2015.
 */
package airws.map {
import airws.Constant;
import airws.game.game.GameEvent;
import airws.level.level.LevelEvent;

import starling.core.Starling;

import starling.display.MovieClip;
import starling.display.Sprite;

public class CoinObject extends Sprite implements IMapObject {
    private var objectMovieClip:MovieClip;

    public function CoinObject() {
        objectMovieClip = new MovieClip(Constant.assetManager.getTextureAtlas("pieces").getTextures(), 30);
        addChild(objectMovieClip);
        Starling.juggler.add(objectMovieClip);
        objectMovieClip.play();
    }

    public function getTouchEvent():LevelEvent {
        this.visible = false;
        return new LevelEvent(LevelEvent.PLAYER_TOUCHED_COIN);
    }
}
}
