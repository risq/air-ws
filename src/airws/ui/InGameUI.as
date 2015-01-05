/**
 * Created by vledrapier on 18/12/2014.
 */
package airws.ui {
import airws.Static;
import airws.level.scene.BackgroundPlane;

import starling.core.Starling;


import starling.display.Button;
import starling.display.DisplayObject;
import starling.display.Sprite;
import starling.events.Event;

public class InGameUI extends Sprite {

//    private var startButton:Button;
//    private var highScoresButton:Button;
    private var pauseButton:Button;
    private var resetButton:Button;
    private var quitButton:Button;
    private var buttonsContainer:Sprite;


    public function InGameUI() {

    }

    public function init() {
        buttonsContainer = new Sprite();
        addChild(buttonsContainer);


        pauseButton = new Button(Static.assetManager.getTexture("button"), "Pause");
        pauseButton.addEventListener(Event.TRIGGERED, onButtonPauseTriggered);
        buttonsContainer.addChild(pauseButton);

        resetButton = new Button(Static.assetManager.getTexture("button"), "Reset");
        resetButton.addEventListener(Event.TRIGGERED, onButtonResetTriggered);
        resetButton.x = 400;
        buttonsContainer.addChild(resetButton);

        quitButton = new Button(Static.assetManager.getTexture("button"), "Quit");
        quitButton.addEventListener(Event.TRIGGERED, onButtonQuitTriggered);
        quitButton.x = 800;
        buttonsContainer.addChild(quitButton);
//
//        highScoresButton = new Button(Constant.assetManager.getTexture("button"), "High Scores");
//        highScoresButton.addEventListener(Event.TRIGGERED, onButtonStartTriggered);
//        highScoresButton.y = 100;
//        buttonsContainer.addChild(highScoresButton);
//
//        buttonsContainer.x = stage.stageWidth / 2 - buttonsContainer.width / 2;
//        buttonsContainer.y = stage.stageHeight / 2 - buttonsContainer.height / 2;
    }

    private function onButtonPauseTriggered(event:Event):void
    {
        var clickEvent = new UIEvent(UIEvent.CLICK_PAUSE);
        dispatchEvent(clickEvent);
    }

    private function onButtonResetTriggered(event:Event):void
    {
        var clickEvent = new UIEvent(UIEvent.CLICK_RESET);
        dispatchEvent(clickEvent);
    }

    private function onButtonQuitTriggered(event:Event):void
    {
        var clickEvent = new UIEvent(UIEvent.CLICK_QUIT);
        dispatchEvent(clickEvent);
    }
}
}