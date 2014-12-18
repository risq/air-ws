/**
 * Created by valpc on 18/12/2014.
 */
package airws.level.scene {
import starling.animation.Tween;
import starling.core.Starling;
import starling.display.Image;
import starling.display.Sprite;
import starling.textures.Texture;

public class BackgroundPlane extends Sprite {

    public static const FULL_HEIGHT_PLANE = "fullHeightPane";
    public static const BOTTOM_ALIGNED_PLANE = "bottomAlignedPlane";
    public static const TOP_ALIGNED_PLANE = "topAlignedPlane";


    private var image1:Image;
    private var image2:Image;
    private var tween:Tween;
    private var textureWidth:Number;
    private var time:Number;
    private var align:String;

    public function BackgroundPlane(texture:Texture, time:Number, align:String = TOP_ALIGNED_PLANE) {
        super();

        textureWidth = texture.width;
        this.time = time;
        this.align = align;

        image1 = new Image(texture);
        image2 = new Image(texture);
        tween = new Tween(this, time);
        tween.repeatCount = 0;
        tween.onComplete = function(): void {
            trace("tween complete!");
        };
    }

    private function onTweenComplete(): void {
        trace('tween complete');
    }

    public function init() {
        switch (align) {
            case TOP_ALIGNED_PLANE:

                break;
            case BOTTOM_ALIGNED_PLANE:
                image1.y = stage.stageHeight - image1.height + 1;
                image2.y = stage.stageHeight - image2.height + 1;

                break;
            case FULL_HEIGHT_PLANE:
                image1.height = stage.stageHeight + 1;
                image2.height = stage.stageHeight + 1;

                break;
        }

        image2.x = image1.width - 1;

        addChild(image1);
        addChild(image2);

        tween.animate("x", -textureWidth);
        Starling.juggler.add(tween);
    }
}
}
