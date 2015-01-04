/**
 * Created by valpc on 03/01/2015.
 */
package airws.ui {
import starling.display.Sprite;

public class UIManager extends Sprite{

    private var mainMenuUI: MainMenuUI;
    private var inGameUI:InGameUI;

    public function UIManager() {

    }

    public function init():void {
        mainMenuUI = new MainMenuUI();
        mainMenuUI.addEventListener(UIEvent.CLICK_START, onMainMenuClickStart);
        addChild(mainMenuUI);
        mainMenuUI.init();

        inGameUI = new InGameUI();
        inGameUI.addEventListener(UIEvent.CLICK_PAUSE, onInGameClickPause);
        inGameUI.addEventListener(UIEvent.CLICK_RESET, onInGameClickReset);
        inGameUI.addEventListener(UIEvent.CLICK_QUIT,  onInGameClickQuit);
        addChild(inGameUI);
        inGameUI.init();


        showMainMenuUI();
    }

    public function showMainMenuUI():void {
        inGameUI.visible = false;
        mainMenuUI.visible = true;
    }

    public function showInGameUI():void {
        inGameUI.visible = true;
        mainMenuUI.visible = false;
    }

    private function onInGameClickReset(event:UIEvent):void {
        dispatchEvent(event);
    }

    private function onInGameClickQuit(event:UIEvent):void {
        showMainMenuUI();
        dispatchEvent(event);
    }

    private function onInGameClickPause(event:UIEvent):void {
        dispatchEvent(event);
    }

    private function onMainMenuClickStart(event:UIEvent):void {
        showInGameUI();
        dispatchEvent(event);
    }


}
}
