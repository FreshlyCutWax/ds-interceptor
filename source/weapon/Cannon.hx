package weapon;

import flixel.group.FlxGroup.FlxTypedGroup;
import screen.ship.PlayerShip;
import weapon.Weapon;
import screen.projectile.Bullet;

class Cannon extends Weapon
{
    /**
     * Reference to the bullet projectile pool.
     */
    private var _bullets:FlxTypedGroup<Bullet>;


    override public function new(Player:PlayerShip, BulletPool:FlxTypedGroup<Bullet>):Void{
        super(Player);
        _bullets = BulletPool;
        time = 0.2;

        //get center of x for spawning
        var object = _bullets.getFirstAvailable();
        _centerX = -(object.frameWidth / 2);
    }//constructor


    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }//update loop


    override private function _spawnProjectile(x:Float, y:Float):Void{
        var bulletObject = _bullets.recycle();
        bulletObject.projected = _player;
        bulletObject.reset(x, y);

        _cooldown.start(time);
    }//function _spawnProjectile
}
