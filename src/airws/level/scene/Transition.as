/**
 * Created by vledrapier on 06/01/2015.
 */
package airws.level.scene {
import airws.Static;

import starling.animation.Transitions;

import starling.animation.Tween;
import starling.core.Starling;

import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;

public class Transition extends Sprite {

    private var spirale:Image;
    private var bg:Quad;
    private var callback:Function;

    public function Transition() {

    }

    public function init() {
        bg = new Quad(stage.stageWidth, stage.stageHeight);
        bg.alpha = 0;
        addChild(bg);

        spirale = new Image(Static.assetManager.getTexture("spirale"));
        spirale.alignPivot();
        spirale.x = stage.stageWidth / 2;
        spirale.y = stage.stageHeight/ 2;
        spirale.scaleX = 0;
        spirale.scaleY = 0;
        addChild(spirale);

        this.alpha = 0;
    }


    public function animate(callback:Function = null) {
        this.alpha = 1;

        spirale.scaleX = 0;
        spirale.scaleY = 0;
        bg.alpha = 0;

        this.callback = callback;

        var tweenSpirale : Tween = new Tween(spirale, 2, Transitions.EASE_IN);
        tweenSpirale.animate("rotation", Math.PI * 6);
        tweenSpirale.scaleTo(1);
        Starling.juggler.add(tweenSpirale);

        var tweenBgIn : Tween = new Tween(bg, 1.5, Transitions.EASE_IN);
        tweenBgIn.delay = 0.5;
        tweenBgIn.fadeTo(1);
        tweenBgIn.onComplete = onTweenBgInComplete;
        Starling.juggler.add(tweenBgIn);

    }

    private function onTweenBgInComplete():void {

        var tweenOut : Tween = new Tween(this, 1, Transitions.EASE_OUT);
        tweenOut.delay = 0.5;
        tweenOut.animate("alpha", 0);
        Starling.juggler.add(tweenOut);

        if (callback) {
            callback();
            callback = null;
        }
    }






}
}
