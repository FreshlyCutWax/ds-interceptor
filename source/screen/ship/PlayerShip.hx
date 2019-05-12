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

        loadGraphic(AssetPaths.player__png, true, frameWidth, frameHeight);
        animation.add("main", [0, 1, 2], 12);
        animation.play("main");
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
