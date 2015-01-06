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

    public function MainMenuUI() {

    }

    public function init() {

        startButton = new Button(Static.assetManager.getTexture("boutonPlay"), "", Static.assetManager.getTexture("boutonPlay_hover"));
        startButton.addEventListener(Event.TRIGGERED, onButtonStartTriggered);
        startButton.alignPivot();
        addChild(startButton);
        startButton.x = stage.stageWidth / 2;
        startButton.y = stage.stageHeight / 2;



        highScoresButton = new Button(Static.assetManager.getTexture("boutonHS"), "", Static.assetManager.getTexture("boutonHS_hover"));
        highScoresButton.addEventListener(Event.TRIGGERED, onButtonStartTriggered);
        highScoresButton.y = 100;
        addChild(highScoresButton);
        highScoresButton.x = stage.stageWidth - highScoresButton.width;
        highScoresButton.y = stage.stageHeight - highScoresButton.height;

    }

    private function onButtonStartTriggered(event:Event):void
    {
        var clickEvent = new UIEvent(UIEvent.CLICK_START);
        dispatchEvent(clickEvent);
    }
}
}
