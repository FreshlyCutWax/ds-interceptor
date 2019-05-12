package screen.projectile;

import flixel.util.FlxColor;
import screen.projectile.Projectile;
import screen.ship.Ship;

class Bullet extends Projectile
{
    override public function new(?X:Float, ?Y:Float):Void{
        super(X, Y);

        //general
        speed = -500;
        damage = 25;

        makeGraphic(5, 10, FlxColor.GRAY);

        velocity.set(0, speed);
    }//constructor


    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }//update loop
}
