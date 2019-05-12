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
     * Stores collision handler.
     */
    var collision:CollisionHandler;


    /**
     * Stores visible ui object.
     */
    var ui:UI;


    /**
     * Stores input handler.
     */
    var input:InputHandler;


    ///////////////////////////////////////////////////////////////////
    //////////////////////////////methods//////////////////////////////
    ///////////////////////////////////////////////////////////////////
    override public function create():Void{
        //create instances
        spawner = new Spawner();
        collision = new CollisionHandler(spawner.screenObjects, spawner.projectiles);
        ui = new UI(spawner.player);
        input = new InputHandler(spawner.player);

        //add objects to the play state
        add(input);
        add(ui);
        add(ui.healthText);
        add(spawner);
        add(collision);
        add(spawner.screenObjects);
        add(spawner.projectiles);
	super.create();
    }

    override public function update(elapsed:Float):Void{    
	super.update(elapsed);
    }
}
