package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.group.FlxGroup;

class CollisionHandler extends FlxBasic
{
    /**
     * Stores reference to group of screen objects.
     */
    private var _group:FlxGroup;


    override function new(collisionGroup:FlxGroup):Void{
        super();
        _group = collisionGroup;
    }//constructor


    override function update(elapsed:Float):Void{
        FlxG.collide(_group, _group);
        super.update(elapsed);
    }//update loop
}
