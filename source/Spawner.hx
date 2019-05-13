package;

//flixel
import flixel.FlxBasic;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxState;

//game
import screen.ship.*;
import screen.debris.*;
import screen.projectile.*;
import weapon.*;

class Spawner extends FlxBasic
{
    /**
     * Variables for storing game object instances.
     */
    public var player:PlayerShip;
    
    /**
     * Variables for storing game object groups.
     */
    public var screenObjects:FlxGroup;
    public var projectiles:FlxGroup;
    public var debris:FlxTypedGroup<Debris>;
    public var bullets:FlxTypedGroup<Bullet>;


    /**
     * Variables for storing timers.
     */
    private var _debrisSpawnTimer:FlxTimer;
    

    ///////////////////////////////////////////////////////////////////
    //////////////////////////////methods//////////////////////////////
    ///////////////////////////////////////////////////////////////////
    override public function new():Void{
        super();

        //create instances
        player = new PlayerShip();
        player.scrollFactor.set(0,0);

        //create groups
        screenObjects = new FlxGroup();
        projectiles = new FlxGroup();
        debris = new FlxTypedGroup<Debris>();
        bullets = new FlxTypedGroup<Bullet>();

        //populate debris
        for (i in 1...100){
            var newDebris = new Debris();
            newDebris.scrollFactor.set(0,0);
            newDebris.kill();
            debris.add(newDebris);
        }

        //populate bullets
        for (i in 1...200){
            var newBullet = new Bullet();
            newBullet.scrollFactor.set(0,0);
            newBullet.kill();
            bullets.add(newBullet);
        }
        
        //add to screenObjects group
        screenObjects.add(player);
        screenObjects.add(debris);

        //add to projectiles group
        projectiles.add(bullets);

        //player setup
        var defaultWeapon = new Cannon(player, bullets);
        player.setPrimaryWeapon(defaultWeapon);

        //create timers
        _debrisSpawnTimer = new FlxTimer();

        //start timers
        _debrisSpawnTimer.start();

        //center the player
        player.screenCenter();
    }//constructor


    override public function update(elapsed:Float):Void{
        _checkTimers();
        super.update(elapsed);
    }//update loop


    /**
     * Checks to see if the timers are up.
     * Calls a method on a timer completion.
     */
    private function _checkTimers():Void{
        if (_debrisSpawnTimer.finished) _spawnDebris();
    }//function _checkTimers


    /**
     * Spawns in debris.
     */
    private function _spawnDebris():Void{
        //recycle and revive dead object
        var debrisObject = debris.recycle(Debris);
        
        //set position
        var posX = FlxG.random.int(0, FlxG.width);
        var posY = -100;
        debrisObject.reset(posX, posY);

        //reset timer
        var time = FlxG.random.float(0, 1);
        _debrisSpawnTimer.start(time);
    }//function _spawnDebris
}
