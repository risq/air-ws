/**
 * Created by vledrapier on 19/12/2014.
 */
package airws.player {
import airws.Constant;

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

    private var jumpSpeed:uint = 3500;
    private var friction:Number = 0.05;
    private var gravity:Number = -90;
    private var isJumping:Boolean= false;

    public function Player() {
        playerMovieClip = new MovieClip(Constant.assetManager.getTextureAtlas("normalPersoCourt").getTextures(), 30);
        Starling.juggler.add(playerMovieClip);
        playerMovieClip.play();
    }

    public function init() {
        addChild(playerMovieClip);
        playerBaseY = stage.stageHeight - playerMovieClip.height - 25;
        playerMovieClip.y = playerBaseY;
        playerMovieClip.x = 200;
    }

    public function jump():void {
        if (canJump()){
            isJumping = true;
            velY = jumpSpeed;
        }
    }

    private function getTimeFromSpeed(speed:uint): Number {
        return 1 / speed * 10;
    }

    private function canJump():Boolean {
        return !isJumping || (playerBaseY - playerMovieClip.y < 50);
    }

    public function updatePosition(time:Number):void {
        if (isJumping) {
            playerMovieClip.y -= velY * time;
            velY -= (velY * friction - gravity) * time * 60;

            if (playerMovieClip.y > playerBaseY) {
                playerMovieClip.y = playerBaseY;
                isJumping = false; // TODO: double jump ?
            }
        }
    }
}
}
