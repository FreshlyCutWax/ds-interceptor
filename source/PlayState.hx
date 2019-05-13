package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.addons.display.FlxBackdrop;
import screen.ui.UI;
import screen.ship.PlayerShip;
import flixel.system.FlxAssets.FlxSoundAsset;

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


    /**
     * Sound that plays on game over.
     */
    var gameOverSound:FlxSoundAsset;


    ///////////////////////////////////////////////////////////////////
    //////////////////////////////methods//////////////////////////////
    ///////////////////////////////////////////////////////////////////
    override public function create():Void{
        //general
        score = 0;
        lives = 0;
        gameOverSound = AssetPaths.death__wav;

        //create instances
        spawner = new Spawner();
        player = spawner.player;
        collision = new CollisionHandler(this, spawner.screenObjects, spawner.projectiles);
        ui = new UI(this);
        input = new InputHandler(spawner.player);

        //backgroud
        var bg = new FlxBackdrop(AssetPaths.background__png, 0, 1, false, true);

        //add objects to the play state
        add(bg);
        add(input);
        add(spawner);
        add(collision);
        add(spawner.screenObjects);
        add(spawner.projectiles);
        add(ui);
        add(ui.healthText);
        add(ui.scoreText);
        add(ui.primaryEmblem);
        add(ui.secondaryEmblem);
	super.create();
    }

    override public function update(elapsed:Float):Void{    
        checkGameOver();
        FlxG.camera.scroll.add(0, 5);
	super.update(elapsed);
    }


    /**
     * Check to see if game over condition is met.
     */
    public function checkGameOver():Void{
        if (lives == 0 && !spawner.player.alive) {
            FlxG.sound.play(gameOverSound);
            FlxG.switchState(new GameOverState(0, score));
        }
    }//function checkGameOver
}
