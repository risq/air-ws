/**
 * Created by vledrapier on 19/12/2014.
 */
package airws.player {
import airws.Static;

import starling.animation.IAnimatable;
import starling.animation.Tween;
import starling.core.Starling;
import starling.display.MovieClip;
import starling.display.Sprite;
import starling.utils.AssetManager;

public class Player extends Sprite {

    private var playerMovieClip:MovieClip;
    private var playerBaseY:Number;
    private var velY: Number = 0;

    private var friction:Number = 0.05;
    private var isJumping:Boolean = false;
    private var doubleJumped = false;

    public function Player() {
//        playerMovieClip = new MovieClip(Static.assetManager.getTextureAtlas("normalPerso").getTextures(), 30);
        setPlayerSprite(Static.currentGameState.getPlayerSprite());

    }

    public function init() {
        addChild(playerMovieClip);
        playerBaseY = stage.stageHeight - playerMovieClip.height - 25;
        playerMovieClip.y = playerBaseY;
        playerMovieClip.x = 200;
    }

    public function jump():void {
        if (canJump()){
            doubleJumped = false;
            isJumping = true;
            velY = Static.currentGameState.getJumpForce();
            playerMovieClip.setFrameDuration(playerMovieClip.numFrames - 1, 999);
        }
        else if (canDoubleJump()) {
            doubleJumped = true;
            velY = Static.currentGameState.getJumpForce();
        }
    }

    private function getTimeFromSpeed(speed:uint): Number {
        return 1 / speed * 10;
    }

    private function canJump():Boolean {
        return !isJumping || (playerBaseY - playerMovieClip.y < 50);
    }

    private function canDoubleJump():Boolean {
        return isJumping && !doubleJumped;
    }

    public function updatePosition(time:Number):void {
        if (isJumping) {
            playerMovieClip.y -= velY * time;
            velY -= (velY * friction + Static.currentGameState.getGravityForce()) * time * 60;

            if (playerMovieClip.y > playerBaseY) {
                playerMovieClip.y = playerBaseY;
                isJumping = false; // TODO: double jump ?
            }
        }
        else {
            playerMovieClip.setFrameDuration(playerMovieClip.numFrames - 1, 0);
        }
    }

    public function setPlayerSprite(filename:String):void {
        trace("Setting player sprite to", filename);
        removeChild(playerMovieClip);
        playerMovieClip = new MovieClip(Static.assetManager.getTextureAtlas(filename).getTextures(), 50);
        playerMovieClip.y = playerBaseY;
        playerMovieClip.x = 200;
        Starling.juggler.add(playerMovieClip);
        playerMovieClip.play();
        addChild(playerMovieClip);
    }

    public function pauseMovieClip():void {
        playerMovieClip.pause();
    }

    public function playMovieClip():void {
        playerMovieClip.play();
    }
}
}
