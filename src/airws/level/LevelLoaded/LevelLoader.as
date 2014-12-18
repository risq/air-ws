/**
 * Created by valpc on 18/12/2014.
 */
package airws.level.LevelLoaded {
import airws.level.*;
import airws.game.game.*;
import airws.level.Level.Level;

import starling.events.EventDispatcher;
import starling.utils.AssetManager;

public class LevelLoader extends EventDispatcher{

    private var assetManager:AssetManager;


    public function LevelLoader(assetManager: AssetManager) {
        this.assetManager = assetManager;
    }

    public function loadLevel(levelID: uint): void {
        var level:Level = new Level(assetManager);

        var levelLoadedEvent = new LevelLoaderEvent(LevelLoaderEvent.LEVEL_LOADED);
        levelLoadedEvent.level = level;
        dispatchEvent(levelLoadedEvent);
    }
}
}
