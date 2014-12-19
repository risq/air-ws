/**
 * Created by valpc on 18/12/2014.
 */
package airws.level.levelLoader {
import airws.level.*;
import airws.game.game.*;
import airws.level.level.Level;

import starling.events.EventDispatcher;
import starling.utils.AssetManager;

public class LevelLoader extends EventDispatcher{

    public function LevelLoader() {

    }

    public function loadLevel(levelID: uint): void {
        var level:Level = new Level();

        var levelLoadedEvent = new LevelLoaderEvent(LevelLoaderEvent.LEVEL_LOADED);
        levelLoadedEvent.level = level;
        dispatchEvent(levelLoadedEvent);
    }
}
}
