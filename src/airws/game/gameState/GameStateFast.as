/**
 * Created by vledrapier on 05/01/2015.
 */
package airws.game.gameState {
import airws.Static;
import airws.game.game.Game;
import airws.game.gameState.GameState;

public class GameStateFast implements GameState{

    public function GameStateFast() {
    }

    public function getMoveSpeed():uint {
        return 450;
    }

    public function getJumpForce():uint {
        return 3500;
    }

    public function getGravityForce():uint {
        return 120;
    }

    public function getPlayerSprite():String {
        return "rapidePerso";
    }

    public function getSceneTint():uint {
        return 0xff9900;
    }

    public function getBgColor():uint {
        return 0xeacc9f;
    }

    public function getType():String {
        return "fast";
    }

    public function getPlane1SpriteName():String {
        return "normalPlan1";
    }

    public function getPlane2SpriteName():String {
        return "normalPlan2";
    }

    public function getPlane3SpriteName():String {
        return "normalPlan3";
    }

    public function getGroundSpriteName():String {
        return "normalSol";
    }

    public function getCeilingSpriteName():String {
        return "lentPlafond";
    }

    public function getEnemySpriteName(type:uint):String {
        if (type == 1) {
            return "normalEnnemi1";
        }
        else if (type == 2) {
            return "normalEnnemi2";
        }
        else if (type == 3) {
            return "normalEnnemi2";
        }
        return null;
    }
}
}
