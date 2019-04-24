package screen.ship;

import flixel.FlxSprite;

class Ship extends FlxSprite
{
    /**
     * Variable for store sheild health.
     */
    private var _shield:Float;


    override public function new(X?:Float, Y?:Float):Void{
        super(X, Y);
        solid = true;
        health = 100;
        shield = 0;
        maxVelocity = 100;
        velocity = 0;
    }//constructor

    
    override public function update(elapsed:Float):Void{
        super(elapsed);
    }//update loop
}
