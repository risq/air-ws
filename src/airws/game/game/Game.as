/**
 * Created by vledrapier on 18/12/2014.
 */
package airws.game.game {
import airws.level.level.Level;
import airws.level.level.LevelEvent;
import airws.level.levelLoader.LevelLoader;
import airws.level.levelLoader.LevelLoaderEvent;
import airws.player.Player;

import flash.geom.Point;

import starling.animation.IAnimatable;

import starling.core.Starling;

import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class Game extends Sprite implements IAnimatable {

    private var level:Level;
    private var player:Player;
    private var started:Boolean = false;
    private var levelLoader:LevelLoader;

    public function Game() {
        player = new Player();
    }

    public function init(levelLoader: LevelLoader): void {
        this.levelLoader = levelLoader;
        this.levelLoader.addEventListener(LevelLoaderEvent.LEVEL_LOADED, onLevelLoaded);
    }

    public function loadLevel(levelID:uint = 1): void {
        levelLoader.loadLevel(levelID);
    }



    public function start(): void {
        if (!isStarted()) {
            started = true;
            var gameStarted:GameEvent = new GameEvent(GameEvent.GAME_STARTED);
            dispatchEvent(gameStarted);
        }
    }

    public function pause():void {
        if (isStarted()) {
            started = false;
        }
    }

    public function stop():void {
        pause();
        level.loadMap();
    }

    public function isStarted(): Boolean{
        return started;
    }

    private function onLevelLoaded(event:LevelLoaderEvent):void {
        trace("levelLoaded (game)");
        level = event.level;
        level.addEventListener(LevelEvent.PLAYER_TOUCHED_COIN, onPlayerTouchCoin);
        level.addEventListener(LevelEvent.PLAYER_TOUCHED_BONUS, onPlayerTouchBonus);
        level.addEventListener(LevelEvent.PLAYER_TOUCHED_ENEMY, onPlayerTouchEnemy);
        addChild(level);
        var gameLoaded:GameEvent = new GameEvent(GameEvent.GAME_LOADED);
        dispatchEvent(gameLoaded);
    }

    private function onPlayerTouchEnemy(event:LevelEvent):void {

    }

    private function onPlayerTouchBonus(event:LevelEvent):void {

    }

    private function onPlayerTouchCoin(event:LevelEvent):void {
        trace("player touched coin");
    }

    public function initLevel():void {
        stage.addEventListener(TouchEvent.TOUCH, onTouch);
        level.init();
        level.addPlayerToScene(player);
    }

    private function onTouch(event:TouchEvent):void {
        if (started) {
            var touch:Touch = event.getTouch(stage, TouchPhase.BEGAN);
            if (touch) {
                var localPos:Point = touch.getLocation(stage);
                player.jump();
            }
        }
    }

    public function advanceTime(time:Number):void {
        player.updatePosition(time);
        if (isStarted()) {
            level.updatePosition(time, player.getBounds(level));
        }
    }
}
}
