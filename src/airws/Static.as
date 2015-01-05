/**
 * Created by vledrapier on 19/12/2014.
 */
package airws {
import airws.game.game.Game;
import airws.game.gameState.GameState;

import starling.utils.AssetManager;

public class Static {

    public static var assetManager:AssetManager;
    public static var currentGame:Game;
    public static var currentGameState:GameState;

    public function Static() {
    }

    public static function initAssetManager():void {
        assetManager = new AssetManager();
    }
}
}
