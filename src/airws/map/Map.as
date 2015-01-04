/**
 * Created by vledrapier on 18/12/2014.
 */
package airws.map {
import airws.Constant;

import starling.display.Sprite;

public class Map extends Sprite{

    private var mapData:Object;
    public var columns:Array;

    public function Map(filename:String) {
        columns = new Array();
        mapData = Constant.assetManager.getObject(filename);
        loadMapData(mapData.layers[0].data);
    }

    private function loadMapData(data:Array):void {
        var numTiles: Number = data.length;
        var rowLength: Number = numTiles / 8;
        var rowCount:Number;
        var colCount:Number;
        for(rowCount = 0; rowCount < 8; rowCount++ ) {
            for(colCount = 0; colCount < rowLength; colCount++ ) {
                //trace("col num." + colCount + ", row num." + rowCount + "(total " + (rowCount * rowLength + colCount) + "): " + data[rowCount * rowLength + colCount]);

                if (data[rowCount * rowLength + colCount] != 0) {
                    addMapObject(data[rowCount * rowLength + colCount], colCount, rowCount);
                }
            }
        }
    }

    private function addMapObject(type:uint, column:uint, row:uint):void {
        var newObject:Sprite;
        if (type == 1) { //ground 1
            newObject = new EnemyObject("normalEnnemi2");
        }
        else if (type == 2) { //ground 2
            newObject = new EnemyObject("normalEnnemi2");
        }
        else if (type == 3) { //coin
            newObject = new CoinObject();
        }
        else if (type == 4) { //bonus
            newObject = new CoinObject();
        }
        else if (type == 5) { //air
            newObject = new EnemyObject("normalEnnemi1");
        }

        if (!columns[column]) {
            columns[column] = new Array();
        }
        newObject.x = column * 80 + newObject.width / 2;
        newObject.y = row * 80 + newObject.height / 2;
        columns[column][row] = newObject;
        addChild(newObject);
    }
}
}
