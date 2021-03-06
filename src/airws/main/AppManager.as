/**
 * Created by vledrapier on 15/12/2014.
 */
package airws.main {
import airws.Static;
import airws.game.gameManager.GameManager;
import airws.game.gameManager.GameManagerEvent;
import airws.main.*;
import airws.ui.UIManager;

import flash.filesystem.File;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.TouchEvent;
import starling.utils.AssetManager;

public class AppManager extends Sprite
{

    private var gameManager:GameManager;

    public function AppManager() {
        super();
    }

    public function init() : void {
        loadAssets();
    }

    private function loadAssets() {
        Static.initAssetManager();
        var appDir:File = File.applicationDirectory;
        Static.assetManager.enqueue(appDir.resolvePath("assets/"));

        Static.assetManager.loadQueue(function(ratio:Number):void {
//            trace('loading...', ratio);
            if (ratio >= 1.0) {
                onAssetsLoaded();
            }
        });
    }

    private function onAssetsLoaded():void {
        trace("assetManager loaded");
        Splash.hide();

        initGameManager();
    }

    private function initGameManager():void {
        gameManager = new GameManager(stage);
        gameManager.addEventListener(GameManagerEvent.GAMEMANAGER_LOADED, onGameManagerLoaded);
        gameManager.init();
    }

    private function onGameManagerLoaded(event:GameManagerEvent):void {
        trace("Game manager loaded");
    }


}
}