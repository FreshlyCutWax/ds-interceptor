package screen.projectile;

import flixel.FlxSprite;

class Projectile extends FlxSprite
{
    /**
     * Vertical speed of projectile.
     */
    public var speed:Float;
    

    override public function new(?X:Float, ?Y:Float):Void{
        super(X, Y);
    }//constructor


    override public function update(elapsed):Void{
        super.update(elapsed);
    }//update loop
}
