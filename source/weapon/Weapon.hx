package weapon;

import flixel.FlxBasic;
import flixel.util.FlxTimer;
import screen.ship.PlayerShip;

class Weapon extends FlxBasic
{
    /**
     * Cooldown timer after the weapon fires.
     */
    private var _cooldown:FlxTimer;


    /**
     * Cooldown time for timer.
     */
    public var time:Float;


    /**
     * Reference to the player ship.
     * Mostly used for spawning position.
     */
    private var _player:PlayerShip;


    /**
     * Offset from where the projectile spawns.
     */
    private var _offset:Int;


    override public function new(Player:PlayerShip):Void{
        super();
        _player = Player;
        _cooldown = new FlxTimer();
        _cooldown.finished = true;
        _offset = -16;
    }//constructor


    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }//update loop


    public function fire():Void{
        if (_cooldown.finished){
            _spawnProjectile();
        }
    }//function fire


    private function _spawnProjectile():Void {};
}
