/**
 * Created by valpc on 18/12/2014.
 */
package airws.level.level {
import airws.level.scene.BackgroundPlane;
import airws.level.scene.Scene;
import airws.player.Player;

import flash.geom.Point;

import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;
import starling.textures.Texture;
import starling.utils.AssetManager;

public class Level extends Sprite {

    public var scene:Scene;

    public function Level() {
        scene = new Scene();
        addChild(scene);
    }

    public function init() {
        scene.init();
    }

    public function addPlayerToScene(player:Player):void {
        scene.playerPlane.addChild(player);
        player.init();
    }
}
}
