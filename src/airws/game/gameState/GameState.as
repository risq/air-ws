/**
 * Created by vledrapier on 05/01/2015.
 */
package airws.game.gameState {
import airws.game.game.Game;

public interface GameState {

    function getMoveSpeed():uint;
    function getJumpForce():uint;
    function getGravityForce():uint
    function getPlayerSprite():String;
    function getSceneTint():uint;
    function getBgColor():uint;
    function getType():String;
    function getPlane1SpriteName():String;
    function getPlane2SpriteName():String;
    function getPlane3SpriteName():String;
    function getGroundSpriteName():String;
    function getCeilingSpriteName():String;
    function getEnemySpriteName(type:uint):String;
}
}
