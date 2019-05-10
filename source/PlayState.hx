package;

import flixel.FlxState;
import screen.ui.UI;

class PlayState extends FlxState
{
    /**
     * Stores manager for spawning.
     */
    var spawner:Spawner;


    /**
     * Stores visible ui object.
     */
    var ui:UI;


    /**
     * Stores input handler.
     */
    var input:InputHandler;


    override public function create():Void{
        //create instances
        spawner = new Spawner();
        ui = new UI(spawner.player);
        input = new InputHandler(spawner.player);

        //add objects to the play state
        add(input);
        add(ui);
        add(spawner);
        add(spawner.player);
        add(spawner.debris);
	super.create();
    }

    override public function update(elapsed:Float):Void{    
	super.update(elapsed);
    }
}
