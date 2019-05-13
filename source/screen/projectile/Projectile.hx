package screen.projectile;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.FlxG;
import screen.ship.Ship;

class Projectile extends FlxSprite
{
    /**
     * How much damage is delt on impact.
     */
    public var damage:Float;


    /**
     * Position of object.
     */
    public var position:FlxPoint;


    /**
     * Vertical speed of projectile.
     */
    public var speed:Float;


    /**
     * Ship that shot the projectile.
     */
    public var projected:Ship;
    

    override public function new(?X:Float, ?Y:Float):Void{
        super(X, Y);
        position = new FlxPoint();
    }//constructor


    override public function update(elapsed):Void{
         _checkOffScreen();
        super.update(elapsed);
    }//update loop


    override public function reset(X:Float, Y:Float):Void{
        super.reset(X, Y);
        velocity.set(0, speed);
    }//function reset


    /**
     * Checks to see if off visible screen.
     */
    public function _checkOffScreen():Void{
        getPosition(position);

        if (position.y > FlxG.height) kill();
        else if (position.y < 0) kill();
    }//function offscreen
}
