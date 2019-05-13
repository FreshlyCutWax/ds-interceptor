package;

import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxG;

class MenuState extends FlxState
{
    override public function create():Void{
        //title text
        var titleText = new FlxText(0, 0, 0, "Deep Space Interceptor", 45);
        titleText.alignment = "center";
        titleText.screenCenter();
        
        //play button
        var position = titleText.getPosition();
        position.y += 100;
        var playButton = new FlxButton(position.x, position.y, "Play", clickPlay);

        //add to state
        add(titleText);
        add(playButton);
	super.create();
    }

    override public function update(elapsed:Float):Void{
	super.update(elapsed);
    }


    public function clickPlay():Void{
        FlxG.switchState(new PlayState());
    }
}
