/**
 * Created by vledrapier on 18/12/2014.
 */
package airws.main {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;

import starling.animation.Tween;
import starling.core.Starling;

public class Splash extends Sprite {

    [Embed(source = "../../../bin/assets/textures/splash.png")]
    private static var SplashImage:Class;
    private static var tween:Tween;
    public static var splashTexture:Bitmap;

    public function Splash() {

    }

    public static function init() {
        splashTexture = new SplashImage();
    }

    public static function hide() {
        tween = new Tween(splashTexture, 0.2);
        tween.animate("alpha", 0);
        tween.onComplete = onFadeOutComplete;
        Starling.juggler.add(tween);
    }

    private static function onFadeOutComplete(): void {
        splashTexture = null;
    }
}
}
