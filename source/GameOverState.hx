package;

import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;

class GameOverState extends FlxSubState
{
    override public function create():Void{
        //game over text
        var overText = new FlxText(0, 0, 0, "GAME OVER :(", 45);
        overText.color = FlxColor.RED;
        overText.alignment = "center";
        overText.screenCenter();

        //reset instructions text
        var resetText = new FlxText(0, 0, 0, "Press ENTER to reset.", 22);
        resetText.screenCenter();
        resetText.alignment = "center";
        var position = resetText.getPosition();
        position.y += 200;
        resetText.setPosition(position.x, position.y);

        //add to state
        add(overText);
        add(resetText);
        super.create();
    }

    override public function update(elapsed:Float):Void{
        checkReset();
        super.update(elapsed);
    }


    public function checkReset():Void{
        var reset = FlxG.keys.anyPressed([ENTER]);
        if (reset) FlxG.resetGame();
    }
}
