/**
 * Created by valpc on 18/12/2014.
 */
package airws.level.scene {
import airws.Static;

import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;

public class Scene extends Sprite {

    private var plan1:BackgroundPlane;
    private var plan2:BackgroundPlane;
    private var plan3:BackgroundPlane;
    private var ground:BackgroundPlane;
    private var ceiling:BackgroundPlane;
    private var mountain2:BackgroundPlane;
    private var fx:BackgroundPlane;

    private var mask:Image;
    private var bg:Quad;

    private var _tintColor:uint;

    public var playerPlane:Sprite;
    public var mapPlane:Sprite;
    public var transition:Transition;

    public function Scene() {
        //clouds1   = new BackgroundPlane(Constant.assetManager.getTexture("clouds1"), 15, BackgroundPlane.TOP_ALIGNED_PLANE);
        //clouds2   = new BackgroundPlane(Constant.assetManager.getTexture("clouds2"), 20, BackgroundPlane.TOP_ALIGNED_PLANE);
        ground    = new BackgroundPlane(Static.assetManager.getTexture("normalSol"),     13, BackgroundPlane.BOTTOM_ALIGNED_PLANE);
        ceiling   = new BackgroundPlane(Static.assetManager.getTexture("lentPlafond"),     13, BackgroundPlane.TOP_ALIGNED_PLANE);
        plan3     = new BackgroundPlane(Static.assetManager.getTexture("normalPlan3"), 45, BackgroundPlane.BOTTOM_ALIGNED_PLANE);
        plan2     = new BackgroundPlane(Static.assetManager.getTexture("normalPlan2"), 30, BackgroundPlane.TOP_ALIGNED_PLANE);
        plan1     = new BackgroundPlane(Static.assetManager.getTexture("normalPlan1"), 25, BackgroundPlane.BOTTOM_ALIGNED_PLANE);
        fx        = new BackgroundPlane(Static.assetManager.getTexture("fx"), 20, BackgroundPlane.BOTTOM_ALIGNED_PLANE);
        //mountain2 = new BackgroundPlane(Constant.assetManager.getTexture("mountain2"), 40, BackgroundPlane.FULL_HEIGHT_PLANE);


        bg = new Quad(1280, 768);

        mask = new Image(Static.assetManager.getTexture("mask"));

        mapPlane = new Sprite();
        playerPlane = new Sprite();

        transition = new Transition();

    }

    public function init():void {

        addChild(bg);

        initBackgroundPane(plan3);
        initBackgroundPane(plan2);
        initBackgroundPane(plan1);
        initBackgroundPane(fx);

        addChild(mapPlane);
        addChild(playerPlane);

        initBackgroundPane(ground);
        initBackgroundPane(ceiling);

        addChild(mask);

        addChild(transition);
        transition.init();



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

    public function setTintColor(color:uint):void {
        _tintColor = color;
        setTint(ground, color);
        setTint(plan1, color);
        setTint(plan2, color);
        setTint(plan3, color);
    }

    public function setBgColor(color:uint):void {
        bg.color = color;
    }

    public function setPlanesTextures(plane1SpriteName:String, plane2SpriteName:String, plane3SpriteName:String, groundSpriteName:String, ceilingSpriteName:String):void {
        plan1.setTexture(Static.assetManager.getTexture(plane1SpriteName));
        plan2.setTexture(Static.assetManager.getTexture(plane2SpriteName));
        plan3.setTexture(Static.assetManager.getTexture(plane3SpriteName));
        ground.setTexture(Static.assetManager.getTexture(groundSpriteName));
        ceiling.setTexture(Static.assetManager.getTexture(ceilingSpriteName));
    }

    public function pausePanes() {
        plan1.pause();
        plan2.pause();
        plan3.pause();
        ground.pause();
        ceiling.pause();
        fx.pause();
    }

    public function unpausePanes() {
        plan1.unpause();
        plan2.unpause();
        plan3.unpause();
        ground.unpause();
        ceiling.unpause();
        fx.unpause();
    }
}
}
