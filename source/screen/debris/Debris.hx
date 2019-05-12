package screen.debris;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.FlxG;

class Debris extends FlxSprite
{
    /**
     * Position of object.
     */
    public var position:FlxPoint;


    /**
     * y-axis speed.
     */
    public var speed:Float;


    /**
     * If explosive or not.
     */
    public var explosive:Bool;


    /**
     * If magnetic or not.
     */
    public var magnetic:Bool;


    override public function new(?X:Float, ?Y:Float):Void{
        super(X, Y);

        makeGraphic(32, 32);

        //speed
        speed = FlxG.random.int(100, 200);
        velocity.set(0, speed);

        position = new FlxPoint();
    }//constructor

    
    override public function update(elapsed:Float):Void{
        _checkOffScreen();
        super.update(elapsed);
    }//update loop


    override public function reset(X:Float, Y:Float):Void{
        super.reset(X, Y);
        speed = FlxG.random.int(100, 200);
        velocity.set(0, speed);
    }//function reset


    /**
     * Checks to see if off visible screen.
     */
    public function _checkOffScreen():Void{
        getPosition(position);

        if (position.y > FlxG.height) kill();
    }//function offscreen
}
