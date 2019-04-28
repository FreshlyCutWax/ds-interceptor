package;

import flixel.FlxBasic;
import flixel.FlxG;
import screen.ship.PlayerShip;

class InputHandler extends FlxBasic
{
    /**
     * Reference to the on-screen player ship object.
     */
    private var player:PlayerShip;


    /**
     * Vars for expressing input based on direction.
     */
    private var _up:Bool;
    private var _down:Bool;
    private var _left:Bool;
    private var _right:Bool;
    private var _primary:Bool;
    private var _secondary:Bool;


    override public function new(playerShip:PlayerShip):Void{
        super();
        player = playerShip;
        _up = false;
        _down = false;
        _left = false;
        _right = false;
    }//constructor

    
    override public function update(elapsed:Float):Void{
        super.update(elapsed);
        handleInput();
    }//update loop


    /**
     * Takes keyboard inputs from user and issues commands based on that input.
     */
    public function handleInput():Void{
        //check to see if keys are pressed
        _up =  FlxG.keys.anyPressed([W, UP]);
        _down = FlxG.keys.anyPressed([S, DOWN]);
        _left = FlxG.keys.anyPressed([A, LEFT]);
        _right = FlxG.keys.anyPressed([D, RIGHT]);
        //check primary
        //check secondary

        //check for left/right, up/down key collision
        if (_left && _right) _left = _right = false;
        if (_up && _down) _up = _down = false;
        
        //issue commands
        if (_up) Command.up(player);
        if (_down) Command.down(player);
        if (_left) Command.left(player);
        if (_right) Command.right(player);
        //issue primary
        //issue secondary
    }//function handleInput
}
