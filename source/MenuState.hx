package;

import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.addons.display.FlxBackdrop;

class MenuState extends FlxState
{
    override public function create():Void{
        //title text
        var titleText = new FlxText(0, 0, 0, "Deep Space Interceptor", 45);
        titleText.alignment = "center";
        titleText.screenCenter();
        titleText.scrollFactor.set(0, 0);
        var position = titleText.getPosition();
        position.y -= 100;
        titleText.setPosition(position.x, position.y);
        
        //play button
        var playButton = new FlxButton(0, 0, "Play", clickPlay);
        playButton.screenCenter();

        //music
        if (FlxG.sound.music == null){
            FlxG.sound.playMusic(AssetPaths.Theme__wav);
        }

        //backgroud
        var bg = new FlxBackdrop(AssetPaths.background__png, 0, 1, false, true);

        //add to state
        add(bg);
        add(titleText);
        add(playButton);
	super.create();
    }

    override public function update(elapsed:Float):Void{
        FlxG.camera.scroll.add(0, 5);
	super.update(elapsed);
    }


    public function clickPlay():Void{
        FlxG.switchState(new PlayState());
    }
}
