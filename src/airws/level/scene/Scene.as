/**
 * Created by valpc on 18/12/2014.
 */
package airws.level.scene {
import airws.Constant;

import flash.display.DisplayObjectContainer;

import starling.animation.Tween;
import starling.core.Starling;

import starling.display.DisplayObject;
import starling.display.Sprite;
import starling.filters.ColorMatrixFilter;
import starling.utils.AssetManager;
import starling.utils.Color;

public class Scene extends Sprite {

    private var mountain1:BackgroundPlane;
    private var clouds1:BackgroundPlane;
    private var clouds2:BackgroundPlane;
    private var ground:BackgroundPlane;
    private var mountain2:BackgroundPlane;
    private var collines1:BackgroundPlane;
    private var collines2:BackgroundPlane;

    public var playerPlane:Sprite;

    private var _tintColor:uint;

    public function Scene() {
        //clouds1   = new BackgroundPlane(Constant.assetManager.getTexture("clouds1"), 15, BackgroundPlane.TOP_ALIGNED_PLANE);
        //clouds2   = new BackgroundPlane(Constant.assetManager.getTexture("clouds2"), 20, BackgroundPlane.TOP_ALIGNED_PLANE);
        ground    = new BackgroundPlane(Constant.assetManager.getTexture("normalSol"),     3, BackgroundPlane.BOTTOM_ALIGNED_PLANE);
        mountain1 = new BackgroundPlane(Constant.assetManager.getTexture("normalPlan3"), 40, BackgroundPlane.BOTTOM_ALIGNED_PLANE);
        collines1 = new BackgroundPlane(Constant.assetManager.getTexture("normalPlan1"), 25, BackgroundPlane.BOTTOM_ALIGNED_PLANE);
//        collines2 = new BackgroundPlane(Constant.assetManager.getTexture("normalPlan1"), 30, BackgroundPlane.BOTTOM_ALIGNED_PLANE);
        //mountain2 = new BackgroundPlane(Constant.assetManager.getTexture("mountain2"), 40, BackgroundPlane.FULL_HEIGHT_PLANE);

        playerPlane = new Sprite();

    }

    public function init():void {
        initBackgroundPane(mountain1);
//        initBackgroundPane(collines2);
        initBackgroundPane(collines1);
        addChild(playerPlane);
        initBackgroundPane(ground);

//        var tween:Tween = new Tween(this, 5);
//        tween.animate("tintColor", 0xff0000);
//        Starling.juggler.add(tween);

    }

    private function initBackgroundPane(backgroundPane: BackgroundPlane) {
        addChild(backgroundPane);
        backgroundPane.init();
    }

    public function setTint(backgroundPane: BackgroundPlane, color:uint):void {
        backgroundPane.setTint(color);
    }

    public function get tintColor():uint {
        return _tintColor;
    }

    public function set tintColor(color:uint):void {
        _tintColor = color;
        setTint(ground, color);
        setTint(mountain1, color);
        setTint(collines1, color);
//        setTint(collines2, color);
    }
}
}
