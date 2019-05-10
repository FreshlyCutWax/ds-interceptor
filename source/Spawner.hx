package;

import flixel.FlxBasic;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxTimer;
import flixel.FlxG;
import screen.ship.*;
import screen.debris.*;

class Spawner extends FlxBasic
{
    /**
     * Variables for storing game object instances.
     */
    public var player:PlayerShip;
    
    /**
     * Variables for storing game object groups.
     */
    public var debris:FlxTypedGroup<Debris>;


    /**
     * Variables for storing timers.
     */
    private var _debrisSpawnTimer:FlxTimer;
    

    /************methods**************************************************/
    override public function new():Void{
        super();

        //create instances
        player = new PlayerShip();

        //create groups
        debris = new FlxTypedGroup<Debris>();

        _populateGroups();

        //create timers
        _debrisSpawnTimer = new FlxTimer();

        //start timers
        _debrisSpawnTimer.start();
    }//constructor


    override public function update(elapsed:Float):Void{
        _checkTimers();
        super.update(elapsed);
    }//update loop


    /**
     * Helper function of constructor.
     * Used to populate the groups.
     */
    private function _populateGroups():Void{
        //populate debris
        for (i in 1...100){
            var newDebris = new Debris();
            newDebris.kill();
            debris.add(newDebris);
        }
    }//function _populateGroups


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
