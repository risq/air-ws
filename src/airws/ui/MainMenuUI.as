/**
 * Created by vledrapier on 18/12/2014.
 */
package airws.ui {
import airws.Static;
import airws.level.scene.BackgroundPlane;


import starling.display.Button;
import starling.display.DisplayObject;
import starling.display.Sprite;
import starling.events.Event;

public class MainMenuUI extends Sprite {

    private var startButton:Button;
    private var highScoresButton:Button;
    private var buttonsContainer:Sprite;

    public function MainMenuUI() {

    }

    public function init() {
        buttonsContainer = new Sprite();
        addChild(buttonsContainer);

        startButton = new Button(Static.assetManager.getTexture("button"), "Start");
        startButton.addEventListener(Event.TRIGGERED, onButtonStartTriggered);
        buttonsContainer.addChild(startButton);

        highScoresButton = new Button(Static.assetManager.getTexture("button"), "High Scores");
        highScoresButton.addEventListener(Event.TRIGGERED, onButtonStartTriggered);
        highScoresButton.y = 100;
        buttonsContainer.addChild(highScoresButton);

        buttonsContainer.x = stage.stageWidth / 2 - buttonsContainer.width / 2;
        buttonsContainer.y = stage.stageHeight / 2 - buttonsContainer.height / 2;
    }

    private function onButtonStartTriggered(event:Event):void
    {
        var clickEvent = new UIEvent(UIEvent.CLICK_START);
        dispatchEvent(clickEvent);
    }
}
}
