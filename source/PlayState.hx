package;

import flixel.FlxState;
import screen.ship.PlayerShip;

class PlayState extends FlxState
{
    /**
     * Offset of screen bound checking.
     */
    public var boundOffset:Int;


    override public function create():Void{
        var player = new PlayerShip();
        var input = new InputHandler(player);

        add(player);
        add(input);
	super.create();
    }

    override public function update(elapsed:Float):Void{
	super.update(elapsed);
    }
}
