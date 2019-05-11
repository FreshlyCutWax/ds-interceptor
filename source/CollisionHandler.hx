package;

import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.group.FlxGroup;

class CollisionHandler extends FlxBasic
{
    /**
     * Stores reference to group of screen objects.
     */
    private var _group:FlxGroup;


    /**
     * Damage quantity. Used to inflict damage on collision.
     */
    public var damage:Float;


    override function new(collisionGroup:FlxGroup):Void{
        super();
        _group = collisionGroup;
        damage = 25;
    }//constructor


    override function update(elapsed:Float):Void{
        FlxG.collide(_group, _group, _collisionDamage);
        super.update(elapsed);
    }//update loop


    /**
     * Called on collision between two objects. Deals equal damage to both.
     */
    private function _collisionDamage(object1:FlxObject, object2:FlxObject):Void{
        object1.hurt(damage);
        object2.hurt(damage);
    }//function _damage
}
