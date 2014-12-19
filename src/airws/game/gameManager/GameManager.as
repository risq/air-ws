/**
 * Created by vledrapier on 18/12/2014.
 */
package airws.game.gameManager {
import airws.game.game.Game;
import airws.game.game.GameEvent;
import airws.level.levelLoader.LevelLoader;

import starling.display.Stage;
import starling.events.EventDispatcher;
import starling.utils.AssetManager;

public class GameManager extends EventDispatcher {

    private var game:Game;
    private var stage:Stage;
    private var levelLoader:LevelLoader;
    //private var assetManager:AssetManager;

    public function GameManager(stage: Stage) {
        this.stage = stage;
        //this.assetManager = assetManager;

        levelLoader = new LevelLoader();
    }

    public function init(): void {
        game = new Game();
        game.addEventListener(GameEvent.GAME_LOADED, onGameLoaded);
        game.init(levelLoader);
    }

    private function onGameLoaded(event:GameEvent):void {
        trace("Game loaded");
        game.removeEventListener(GameEvent.GAME_LOADED, onGameLoaded);
        var gameManagerLoaded:GameManagerEvent = new GameManagerEvent(GameManagerEvent.GAMEMANAGER_LOADED);
        stage.addChild(game);
        game.initLevel();
        dispatchEvent(gameManagerLoaded);
    }
}
}
