/**
 * Created by valpc on 18/12/2014.
 */
package airws.level.level {
import airws.level.scene.Scene;
import airws.map.Map;
import airws.map.IMapObject;
import airws.player.Player;

import flash.geom.Rectangle;

import starling.display.Sprite;

public class Level extends Sprite {

    public var scene:Scene;
    public var map:Map;
    public var mapName:String;
    public var currentColumn:int;
    private const PLAYER_MARGIN:uint = 300;

    public function Level(mapName) {
        this.mapName = mapName;
        scene = new Scene();
        addChild(scene);
        loadMap();
    }

    public function loadMap():void {
        if (map) {
            removeChild(map);
        }

        map = new Map(mapName);
        map.x = 1300;
        map.y = 56;
        addChild(map);
    }

    public function init() {
        scene.init();
    }

    public function addPlayerToScene(player:Player):void {
        scene.playerPlane.addChild(player);
        player.init();
    }

    public function updatePosition(time:Number, bounds:Rectangle):void {
        map.x -= 300*time;
        if (map.x <= PLAYER_MARGIN) {
            currentColumn = Math.floor((-map.x + PLAYER_MARGIN) / 80);

            if(map.columns[currentColumn]) {
                for (var index:int = 0; index < 8; index++ ) {
                    if (map.columns[currentColumn][index] && isColliding(bounds, (map.columns[currentColumn][index] as Sprite))) {
                        var touchEvent:LevelEvent = (map.columns[currentColumn][index] as IMapObject).getTouchEvent();
                        dispatchEvent(touchEvent);
                    }
                }
            }
        }
    }

    public function isColliding(playerBounds:Rectangle, object:Sprite) {
        return (object.visible && playerBounds.intersects(object.getBounds(this)));
    }

}
}
