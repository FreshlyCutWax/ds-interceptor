package;

import flixel.FlxState;
import flixel.FlxSubState;
import screen.ui.UI;
import screen.ship.PlayerShip;

class PlayState extends FlxState
{
    /**
     * Reference to player.
     */
    public var player:PlayerShip;


    /**
     * Player score.
     */
    public var score:Int;

    
    /**
     * Player lives.
     */
    var lives:Int;


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
        //set score
        score = 0;
        lives = 0;

        //create instances
        spawner = new Spawner();
        player = spawner.player;
        collision = new CollisionHandler(this, spawner.screenObjects, spawner.projectiles);
        ui = new UI(this);
        input = new InputHandler(spawner.player);

        //add objects to the play state
        add(input);
        add(ui);
        add(ui.healthText);
        add(ui.scoreText);
        add(ui.primaryEmblem);
        add(ui.secondaryEmblem);
        add(spawner);
        add(collision);
        add(spawner.screenObjects);
        add(spawner.projectiles);
	super.create();
    }

    override public function update(elapsed:Float):Void{    
        checkGameOver();
	super.update(elapsed);
    }


    /**
     * Check to see if game over condition is met.
     */
    public function checkGameOver():Void{
        if (lives == 0 && !spawner.player.alive) openSubState(new GameOverState());
    }//function checkGameOver
}
