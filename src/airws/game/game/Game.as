/**
 * Created by vledrapier on 18/12/2014.
 */
package airws.game.game {
import airws.level.level.Level;
import airws.level.levelLoader.LevelLoader;
import airws.level.levelLoader.LevelLoaderEvent;
import airws.player.Player;

import flash.geom.Point;

import starling.core.Starling;

import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class Game extends Sprite {

    private var level:Level;
    private var player:Player;

    public function Game() {
        player = new Player();
        Starling.juggler.add(player);
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
        stage.addEventListener(TouchEvent.TOUCH, onTouch);
        level.init();
        level.addPlayerToScene(player);
    }

    private function onTouch(event:TouchEvent):void {
        var touch:Touch = event.getTouch(stage, TouchPhase.BEGAN);
        if (touch) {
            var localPos:Point = touch.getLocation(stage);
            player.jump();
        }
    }
}
}
