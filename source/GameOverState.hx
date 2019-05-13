package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;

class GameOverState extends FlxState
{
    var score:Int;

    override public function new(?MaxSize:Int, Score:Int):Void{
        super(MaxSize);
        score = Score;
    }//constructor

    override public function create():Void{
        //game over text
        var overText = new FlxText(0, 0, 0, "GAME OVER :(", 45);
        overText.color = FlxColor.RED;
        overText.alignment = "center";
        overText.screenCenter();
        var position = overText.getPosition();
        position.y -= 100;
        overText.setPosition(position.x, position.y);

        //score text
        var text = "Your Score: ";
        text += Std.string(score);
        var scoreText = new FlxText(0, 0, 0, text, 22);
        scoreText.screenCenter();
        scoreText.alignment = "center";

        //reset instructions text
        var resetText = new FlxText(0, 0, 0, "Press ENTER to reset.", 22);
        resetText.screenCenter();
        resetText.alignment = "center";
        position = resetText.getPosition();
        position.y += 100;
        resetText.setPosition(position.x, position.y);

        //add to state
        add(overText);
        add(scoreText);
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
