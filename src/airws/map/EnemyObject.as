/**
 * Created by valpc on 03/01/2015.
 */
package airws.map {
import airws.Constant;
import airws.level.level.LevelEvent;

import starling.core.Starling;

import starling.display.MovieClip;
import starling.display.Sprite;

public class EnemyObject extends Sprite implements IMapObject {
    private var objectMovieClip:MovieClip;

    public function EnemyObject(sprite) {
        objectMovieClip = new MovieClip(Constant.assetManager.getTextureAtlas(sprite).getTextures(), 30);
        addChild(objectMovieClip);
        Starling.juggler.add(objectMovieClip);
        objectMovieClip.play();
    }

    public function getTouchEvent():LevelEvent {
        this.visible = false;
        return new LevelEvent(LevelEvent.PLAYER_TOUCHED_ENEMY);
    }
}
}
