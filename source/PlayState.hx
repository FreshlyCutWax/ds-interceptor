package;

import flixel.FlxState;
import screen.ship.PlayerShip;
import screen.ui.UI;

class PlayState extends FlxState
{
    override public function create():Void{
        var player = new PlayerShip(0, 0, 32, 64);
        var input = new InputHandler(player);
        var ui = new UI(player);

        add(player);
        add(input);
        add(ui);
	super.create();
    }

    override public function update(elapsed:Float):Void{
	super.update(elapsed);
    }
}
