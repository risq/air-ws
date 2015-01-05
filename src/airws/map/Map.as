/**
 * Created by vledrapier on 18/12/2014.
 */
package airws.map {
import airws.Static;

import starling.display.Sprite;

public class Map extends Sprite{

    private var mapData:Object;
    public var columns:Array;

    public function Map(filename:String) {
        columns = new Array();
        mapData = Static.assetManager.getObject(filename);
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
                    createMapObject(data[rowCount * rowLength + colCount], colCount, rowCount);
                }
            }
        }
    }

    private function createMapObject(type:uint, column:uint, row:uint):void {
        var newObject:Sprite;
        if (type == 1) { //ground 1
            newObject = new EnemyObject(2);
        }
        else if (type == 2) { //ground 2
            newObject = new EnemyObject(3);
        }
        else if (type == 3) { //coin
            newObject = new CoinObject();
        }
        else if (type == 4) { //bonus
            newObject = new BonusObject();
        }
        else if (type == 5) { //air
            newObject = new EnemyObject(1);
        }

        if (!columns[column]) {
            columns[column] = new Array();
        }
        newObject.x = column * 80 + newObject.width / 2;
        newObject.y = row * 80 + newObject.height / 2;
        columns[column][row] = newObject;
    }

    public function addColumn(column:int) {
        if(column >= 0 && columns[column]) {
            for (var index:int = 0; index < 8; index++ ) {
                if (columns[column][index]) {
                    (columns[column][index] as MapObject).setSprite();
                    addChild(columns[column][index] as Sprite);
                }
            }
        }
    }

    public function removeColumn(column:int):void {
        if(column >= 0 && columns[column]) {
            for (var index:int = 0; index < 8; index++ ) {
                if (columns[column][index]) {
                    removeChild(columns[column][index]);
                    columns[column][index].dispose();
                    columns[column][index] = null;
                }
            }
            columns[column] = null;
        }
    }

    public function updateEnemySprites():void {
        for (var column = columns.length; column >= 0; column--) {
            if (columns[column]) {
                for (var index:int = 0; index < 8; index++) {
                    if (columns[column][index] && (columns[column][index] as MapObject).getType() == "enemy") {
                        (columns[column][index] as EnemyObject).setSprite();
                    }
                }
            }
        }
    }
}
}
