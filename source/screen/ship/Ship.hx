package screen.ship;

import flixel.FlxSprite;

class Ship extends FlxSprite
{
    /**
     * Variable for store sheild health.
     */
    public var shield:Float;


    /**
     * Used for increasing acceleration.
     */
    private var _incrementAccel:Float;


    override public function new(?X:Float, ?Y:Float):Void{
        super(X, Y);
        //general
        solid = true;
        health = 100;
        shield = 0;

        //speed & direction
        acceleration.x = 30;
        acceleration.y = 50;
        maxVelocity.x = 100;
        maxVelocity.y = 150;
        drag.x = drag.y = 20;
    }//constructor

    
    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }//update loop


    /**
     * Moves ship vertically on screen.
     * @param direction     -1 for up, 
     *                       1 for down,
     *                       0 for none.
     */
    public function thrustVertical(direction:Int):Void{
        velocity.y += velocity.y * direction;
    }


    /**
     * Moves ship horizontally on screen.
     * @param direction     -1 for left, 
     *                       1 for right,
     *                       0 for none.
     */
    public function thrustHorizontal(direction:Int):Void{
        velocity.x += velocity.x * direction;
    }
}
