package screen.ship;

import flixel.group.FlxGroup.FlxTypedGroup;
import screen.ship.Ship;
import screen.projectile.*;
import weapon.*;

class PlayerShip extends Ship
{
    /**
     * The primary weapon.
     */
    public var primaryWeapon:Weapon;


    override public function new(?X:Float, ?Y:Float, ?XBoundOffset:Int, ?YBoundOffset:Int){
        super(X, Y, XBoundOffset, YBoundOffset);
    }//constructor


    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }//update loop


    /**
     *
     */
    public function setPrimaryWeapon(weapon:Weapon):Void{
        primaryWeapon = weapon;
    }//function setPrimaryWeapon


    /**
     * Fires the primary weapon.
     */
    public function firePrimary():Void{
        primaryWeapon.fire();
    }
}
