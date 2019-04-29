package screen.ship;

import flixel.FlxSprite;

class Ship extends FlxSprite
{
    /**
     * Stores sheild health.
     */
    public var shield:Float;


    /**
     * x-axis & y-axis speed.
     */
    public var speedX:Float;
    public var speedY:Float;


    override public function new(?X:Float, ?Y:Float):Void{
        super(X, Y);
        //general
        solid = true;
        health = 100;
        shield = 0;

        //speed & direction
        speedX = 180;
        speedY = 250;
        drag.x = drag.y = 300;
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
        var v = speedY * direction;
        velocity.y = v;
    }//function thrustVertical


    /**
     * Moves ship horizontally on screen.
     * @param direction     -1 for left, 
     *                       1 for right,
     *                       0 for none.
     */
    public function thrustHorizontal(direction:Int):Void{
        var v = speedX * direction;
        velocity.x = v;
    }//function thrustHorizontal
}
