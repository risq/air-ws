/**
 * Created by vledrapier on 18/12/2014.
 */
package airws.game.game {
import airws.level.Level.Level;
import airws.level.LevelLoaded.LevelLoader;
import airws.level.LevelLoaded.LevelLoaderEvent;

import starling.display.Sprite;

public class Game extends Sprite {

    private var level:Level;

    public function Game() {
        super();
    }

    public function init(levelLoader: LevelLoader, levelID:uint = 1): void {
        levelLoader.addEventListener(LevelLoaderEvent.LEVEL_LOADED, onLevelLoaded);
        levelLoader.loadLevel(levelID);
    }

    private function onLevelLoaded(event:LevelLoaderEvent):void {
        level = event.level;
        addChild(level);
        var gameLoaded:GameEvent = new GameEvent(GameEvent.GAME_LOADED);
        dispatchEvent(gameLoaded);
    }

    public function initLevel():void {
        level.init();
    }
}
}
