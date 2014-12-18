package airws.main {

import airws.main.AppManager;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.geom.Rectangle;

import starling.core.Starling;
import starling.events.Event;

[SWF(frameRate="60")]
public class Main extends Sprite
{
    private var _starling:Starling;
    private var app:AppManager;


    public function Main()
    {

       // These settings are recommended to avoid problems with touch handling
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;

        Splash.init();
        addChild(Splash.splashTexture);

        // Create a Starling instance that will run the "App" class

        var viewport:Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
        _starling = new Starling(AppManager, stage, viewport);
        _starling.stage.stageWidth = 1280;
        _starling.stage.stageHeight = stage.fullScreenHeight / stage.fullScreenWidth * 1280;
        _starling.addEventListener(Event.ROOT_CREATED, _onRootCreated);
        _starling.start();
    }

    private function _onRootCreated(event:Event):void {
        trace("creating app...");
        app = AppManager(_starling.root);
        app.init();
    }
}
}