package;

//flixel
import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.group.FlxGroup;

//game
import screen.projectile.Projectile;


class CollisionHandler extends FlxBasic
{
    /**
     * Reference to group of screen objects.
     */
    private var _groups:FlxGroup;


    /**
     * Reference to projectile objects.
     */
    private var _projectiles:FlxGroup;


    /**
     * Damage quantity. Used to inflict damage on collision.
     */
    public var damage:Float;


    override function new(CollisionGroups:FlxGroup, ?Projectiles:FlxGroup):Void{
        super();
        _groups = CollisionGroups;
        _projectiles = Projectiles;
        damage = 25;
    }//constructor


    override function update(elapsed:Float):Void{
        FlxG.collide(_groups, _groups, _collisionDamage);
        FlxG.collide(_groups, _projectiles, _projectileDamage);
        super.update(elapsed);
    }//update loop


    /**
     * Called on collision between two objects. 
     * Deals equal damage to both.
     */
    private function _collisionDamage(object1:FlxObject, object2:FlxObject):Void{
        object1.hurt(damage);
        object2.hurt(damage);
    }//function _damage


    /**
     * Called on collision between projectiles and other objects.
     * Deals damage dependent on the projectile.
     */
    private function _projectileDamage(object:FlxObject, projectile:Projectile):Void{
        object.hurt(projectile.damage);
        projectile.kill();
    }//function _projectileDamage
}
