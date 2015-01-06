/**
 * Created by vledrapier on 18/12/2014.
 */
package airws.game.game {
import airws.Static;
import airws.game.gameState.GameStateNormal;
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

    public var level:Level;
    public var player:Player;
    private var started:Boolean = false;
    private var paused:Boolean = false;
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
            unpause();
            var gameStarted:GameEvent = new GameEvent(GameEvent.GAME_STARTED);
            dispatchEvent(gameStarted);
        }
    }

    public function pause():void {
        if (!isPaused()) {
            trace("pause game");
            paused = true;
            level.scene.pausePanes();
            player.pauseMovieClip();
        }
    }

    public function unpause():void {
        if (isPaused()) {
            trace("unpause game");
            paused = false;
            level.scene.unpausePanes();
            player.playMovieClip();
        }
    }

    public function stop():void {
        started = false;
        level.loadMap();
    }

    public function isStarted(): Boolean{
        return started;
    }

    public function isPaused(): Boolean{
        return paused;
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
        var gameLosed:GameEvent = new GameEvent(GameEvent.GAME_LOOSED);
        dispatchEvent(gameLosed);
    }

    private function onPlayerTouchBonus(event:LevelEvent):void {
        var gameGetBonus:GameEvent = new GameEvent(GameEvent.GAME_GET_BONUS);
        dispatchEvent(gameGetBonus);
    }

    private function onPlayerTouchCoin(event:LevelEvent):void {

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
//                var localPos:Point = touch.getLocation(stage);
                player.jump();
            }
        }
    }

    public function advanceTime(time:Number):void {
        player.updatePosition(time);
        if (isStarted() && !isPaused()) {
            level.updatePosition(time, player.getBounds(level));
        }
    }

}
}
