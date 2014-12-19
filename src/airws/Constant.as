/**
 * Created by vledrapier on 19/12/2014.
 */
package airws {
import starling.utils.AssetManager;

public class Constant {

    public static var assetManager:AssetManager;

    public function Constant() {
    }

    public static function initAssetManager():void {
        assetManager = new AssetManager();
    }
}
}
