/**
 * Created by vledrapier on 05/01/2015.
 */
package airws.game.gameState {

public class GameStateSlow implements GameState{

    public function GameStateNormal() {
    }

    public function getMoveSpeed():uint {
        return 150;
    }

    public function getJumpForce():uint {
        return 1800;
    }

    public function getGravityForce():uint {
        return 12;
    }

    public function getPlayerSprite():String {
        return "lentPerso";
    }

    public function getSceneTint():uint {
        return 0x0099cc;
    }

    public function getBgColor():uint {
        return 0xace0f1;
    }

    public function getType():String {
        return "slow";
    }

    public function getPlane1SpriteName():String {
        return "lentPlan1";
    }

    public function getPlane2SpriteName():String {
        return "normalPlan2";
    }

    public function getPlane3SpriteName():String {
        return "lentPlan3";
    }

    public function getGroundSpriteName():String {
        return "lentSol";
    }

    public function getCeilingSpriteName():String {
        return "lentPlafond";
    }

    public function getEnemySpriteName(type:uint):String {
        if (type == 1) {
            return "lentEnnemi1";
        }
        else if (type == 2) {
            return "lentEnnemi2";
        }
        else if (type == 3) {
            return "lentEnnemi2";
        }
        return null;
    }
}
}
