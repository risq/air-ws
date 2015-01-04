/**
 * Created by vledrapier on 18/12/2014.
 */
package airws.game.gameManager {
import airws.game.game.Game;
import airws.game.game.GameEvent;
import airws.level.levelLoader.LevelLoader;
import airws.ui.UIEvent;
import airws.ui.UIManager;

import starling.core.Starling;

import starling.display.Stage;
import starling.events.EventDispatcher;
import starling.utils.AssetManager;

public class GameManager extends EventDispatcher {

    private var game:Game;
    private var uiManager:UIManager;
    private var stage:Stage;
    private var levelLoader:LevelLoader;
    //private var assetManager:AssetManager;

    public function GameManager(stage: Stage) {
        this.stage = stage;
        //this.assetManager = assetManager;

        levelLoader = new LevelLoader();
    }

    public function init(): void {
        uiManager = new UIManager();
        uiManager.addEventListener(UIEvent.CLICK_START, onUIClickStart);
        uiManager.addEventListener(UIEvent.CLICK_QUIT, onUIClickQuit);
        uiManager.addEventListener(UIEvent.CLICK_RESET, onUIClickReset);
        game = new Game();
        game.addEventListener(GameEvent.GAME_LOADED, onGameLoaded);
        game.init(levelLoader);
        game.loadLevel(3);
    }

    private function stopGame():void {
        Starling.juggler.remove(game);
        game.stop();
    }

    public function startGame():void {
        game.start();
        Starling.juggler.add(game);
    }

    public function resetGame():void {
        game.stop();
        game.start();
    }

    private function onUIClickStart(event:UIEvent):void {
        trace("(GameManager) onUIClickStart");
        startGame();
    }

    private function onUIClickQuit(event:UIEvent):void {
        stopGame();
    }

    private function onUIClickReset(event:UIEvent):void {
        resetGame();
    }

    private function onGameLoaded(event:GameEvent):void {
        trace("Game loaded");
        game.removeEventListener(GameEvent.GAME_LOADED, onGameLoaded);
        var gameManagerLoaded:GameManagerEvent = new GameManagerEvent(GameManagerEvent.GAMEMANAGER_LOADED);
        stage.addChild(game);
        stage.addChild(uiManager);
        uiManager.init();
        game.initLevel();
        dispatchEvent(gameManagerLoaded);
    }
}
}
