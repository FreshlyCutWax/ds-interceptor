package;

//flixel
import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxState;
import flixel.system.FlxAssets.FlxSoundAsset;

//game
import screen.projectile.Projectile;
import screen.ship.PlayerShip;


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


    /**
     * Reference to the play state.
     */
    private var _state:PlayState;


    /**
     * Damage sounds for collision.
     */
    private var _damageSound:FlxSoundAsset;


    override function new(State:PlayState,  CollisionGroups:FlxGroup, ?Projectiles:FlxGroup):Void{
        super();
        _groups = CollisionGroups;
        _projectiles = Projectiles;
        _state = State;
        _damageSound = AssetPaths.clash__wav;
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
        FlxG.sound.play(_damageSound);
    }//function _damage


    /**
     * Called on collision between projectiles and other objects.
     * Deals damage dependent on the projectile.
     */
    private function _projectileDamage(object:FlxObject, projectile:Projectile):Void{
        if (projectile.projected == _state.player) _state.score += 5;
        object.hurt(projectile.damage);
        projectile.kill();
        FlxG.sound.play(_damageSound);
    }//function _projectileDamage
}
