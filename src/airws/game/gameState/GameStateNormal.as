/**
 * Created by vledrapier on 05/01/2015.
 */
package airws.game.gameState {
import airws.Static;
import airws.game.game.Game;
import airws.game.gameState.GameState;

public class GameStateNormal implements GameState{

    public function GameStateNormal() {
    }

    public function getMoveSpeed():uint {
        return 250;
    }

    public function getJumpForce():uint {
        return 3200;
    }

    public function getGravityForce():uint {
        return 90;
    }

    public function getPlayerSprite():String {
        return "normalPerso";
    }

    public function getSceneTint():uint {
        return 0x98576e;
    }

    public function getBgColor():uint {
        return 0xd8bbc6;
    }

    public function getType():String {
        return "normal";
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
