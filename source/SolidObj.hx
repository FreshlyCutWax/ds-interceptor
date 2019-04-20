package;

import flixel.FlxSprite;

class SolidObj extends FlxSprite
{
    /**
     * Optional shield variable.
     * Init to 0 on constructor call by default.
     */
    public var shield:Float;

    /**
     * Collision handler.
     * @return True if colliding with another solid object.
     */
     public var collision = isTouching(allowCollisions);


    override public function new(?X:Float, ?Y:Float):Void{
        super(X, Y);
        solid = true;
        health = 100;
        shield = 0;
        elasticity = 1;
        maxVelocity = 300;
    }//constructor


    override public function update(elapsed:Float):Void{
        if (collision) hurt(10);
        super.update(elapsed);
    }//update
}
