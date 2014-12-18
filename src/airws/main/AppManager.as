/**
 * Created by vledrapier on 15/12/2014.
 */
package airws.main {
import airws.main.*;

import flash.filesystem.File;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.TouchEvent;
import starling.utils.AssetManager;

public class AppManager extends Sprite
{

    var _assets:AssetManager;
    //var car:Car;

    public function AppManager() {
        super();
    }

    public function init() : void {
        loadAssets();
    }

    private function initUI() {
        //car = new Car(assets);
        //car.scaleX = 0.5;
        //car.scaleY = 0.5;
        //addChild(car);
    }

    private function loadAssets() {
        _assets = new AssetManager();
        var appDir:File = File.applicationDirectory;
        _assets.enqueue(appDir.resolvePath("assets/"));

        _assets.loadQueue(function(ratio:Number):void
        {
            trace('loading...', ratio);
            if (ratio >= 1.0) {
                onAssetsLoaded();
            }
        });
    }

    private function onAssetsLoaded():void {
        trace("assets loaded");
        Splash.fadeOut();
        initUI();
    }

    private function _onTouch(event:TouchEvent):void {

    }

    private function _onEnterFrame(event:Event):void {
    }



}
}