/**
 * Created by valpc on 03/01/2015.
 */
package airws.map {
import airws.Static;
import airws.level.level.LevelEvent;

import starling.core.Starling;

import starling.display.MovieClip;
import starling.display.Sprite;

public class EnemyObject extends Sprite implements MapObject {
    private var objectMovieClip:MovieClip;
    private var enemyType:uint;

    public function EnemyObject(enemyType) {
        this.enemyType = enemyType;
//        setEnemySprite();
    }

    public function getTouchEvent():LevelEvent {
        this.visible = false;
        trace("touch enemy");
        return new LevelEvent(LevelEvent.PLAYER_TOUCHED_ENEMY);
    }

    public function setSprite():void {
        trace("Setting enemy sprite to", Static.currentGameState.getEnemySpriteName(enemyType));
        removeChild(objectMovieClip);
        objectMovieClip = new MovieClip(Static.assetManager.getTextureAtlas(Static.currentGameState.getEnemySpriteName(enemyType)).getTextures(), 30);
//        objectMovieClip.x = - objectMovieClip.width  / 2;
//        objectMovieClip.y = - objectMovieClip.height / 2;
        Starling.juggler.add(objectMovieClip);
        objectMovieClip.play();
        addChild(objectMovieClip);
    }

    public function getType():String {
        return "enemy";
    }
}
}
