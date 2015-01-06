/**
 * Created by vledrapier on 18/12/2014.
 */
package airws.game.gameManager {
import airws.Static;
import airws.game.game.Game;
import airws.game.game.GameEvent;
import airws.game.gameState.GameStateFast;
import airws.game.gameState.GameStateNormal;
import airws.game.gameState.GameStateSlow;
import airws.game.gameState.GameState;
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

    private var gameStateNormal:GameStateNormal;
    private var gameStateFast:GameStateFast;
    private var gameStateSlow:GameStateSlow;
    private var newState:GameState;

    //private var assetManager:AssetManager;

    public function GameManager(stage: Stage) {
        this.stage = stage;
        //this.assetManager = assetManager;

        levelLoader = new LevelLoader();

        gameStateNormal = new GameStateNormal();
        gameStateFast   = new GameStateFast();
        gameStateSlow   = new GameStateSlow();

        Static.currentGameState = gameStateNormal;
    }

    public function init(): void {
        uiManager = new UIManager();
        uiManager.addEventListener(UIEvent.CLICK_START, onUIClickStart);
        uiManager.addEventListener(UIEvent.CLICK_QUIT, onUIClickQuit);
        uiManager.addEventListener(UIEvent.CLICK_RESET, onUIClickReset);
        game = new Game();
        Static.currentGame = game;
        game.addEventListener(GameEvent.GAME_LOADED, onGameLoaded);
        game.addEventListener(GameEvent.GAME_LOOSED, onGameLoosed);
        game.addEventListener(GameEvent.GAME_GET_BONUS, onGameGetBonus);
        game.init(levelLoader);
        game.loadLevel(3);
        Starling.juggler.add(game);

        changeState(gameStateNormal);

    }

    private function stopGame():void {
        game.stop();
    }

    public function startGame():void {
        changeState(gameStateNormal);
        game.start();
    }

    public function resetGame():void {
        game.stop();
        game.start();
    }

    public function loose():void {
        stopGame();
        uiManager.showMainMenuUI();
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

    private function onGameLoosed(event:GameEvent):void {
        trace("you loosed");
        loose();
    }

    private function onGameGetBonus(event:GameEvent):void {
        var newGameState:GameState = null;

        while (!newGameState) {

            var randomState:uint = Math.floor(Math.random()*3);

            trace("random:", randomState);

            if (randomState == 0 && Static.currentGameState.getType() != "slow") {
                newGameState = gameStateSlow;
            }
            else if (randomState == 1 && Static.currentGameState.getType() != "normal") {
                newGameState = gameStateNormal;
            }
            else if (randomState == 2 && Static.currentGameState.getType() != "fast") {
                newGameState = gameStateFast;
            }
        }

        newState = newGameState;
        game.pause();
        game.level.scene.transition.animate(onTransitionDone);
    }

    private function onTransitionDone() {
        changeState(newState);
    }

    private function changeState(gameState:GameState) {
        Static.currentGameState = gameState;
        game.player.setPlayerSprite(Static.currentGameState.getPlayerSprite());
        game.level.scene.setTintColor(Static.currentGameState.getSceneTint());
        game.level.scene.setBgColor(Static.currentGameState.getBgColor());
        game.level.scene.setPlanesTextures(
                Static.currentGameState.getPlane1SpriteName(),
                Static.currentGameState.getPlane2SpriteName(),
                Static.currentGameState.getPlane3SpriteName(),
                Static.currentGameState.getGroundSpriteName(),
                Static.currentGameState.getCeilingSpriteName());

        game.level.map.updateEnemySprites();

        game.unpause();
    }


}
}
