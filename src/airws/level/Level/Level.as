/**
 * Created by valpc on 18/12/2014.
 */
package airws.level.Level {
import airws.level.scene.BackgroundPlane;

import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;
import starling.textures.Texture;
import starling.utils.AssetManager;

public class Level extends Sprite {

    private var mountain1:BackgroundPlane;
    private var clouds1:BackgroundPlane;
    private var clouds2:BackgroundPlane;
    private var ground:BackgroundPlane;
    private var mountain2:BackgroundPlane;

    public function Level(assetManager: AssetManager) {
        clouds1 = new BackgroundPlane(assetManager.getTexture("clouds1"), 15, BackgroundPlane.TOP_ALIGNED_PLANE);
        clouds2 = new BackgroundPlane(assetManager.getTexture("clouds2"), 20, BackgroundPlane.TOP_ALIGNED_PLANE);
        ground = new BackgroundPlane(assetManager.getTexture("ground"), 3, BackgroundPlane.BOTTOM_ALIGNED_PLANE);
        mountain1 = new BackgroundPlane(assetManager.getTexture("mountain1"), 20, BackgroundPlane.FULL_HEIGHT_PLANE);
        mountain2 = new BackgroundPlane(assetManager.getTexture("mountain2"), 40, BackgroundPlane.FULL_HEIGHT_PLANE);
    }


    public function init():void {
        addChild(mountain2);
        addChild(mountain1);
        addChild(clouds1);
        addChild(clouds2);
        addChild(ground);
        mountain1.init();
        clouds1.init();
        clouds2.init();
        ground.init();
        mountain2.init();
    }
}
}
