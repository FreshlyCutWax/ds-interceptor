package;

import flixel.FlxBasic;
import flixel.input.keyboard.FlxKeyboard;
import screen.ship.PlayerShip;
import command.*;

class InputHandler extends FlxBasic;
{
    /**
     * Flixel class for handling keyboard input.
     * Read-only.
     */
    private static var _keys(default, null):FlxKeyboard;


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
    }//constructor

    
    override public function update(elapsed:Float):Void{
        super(elapsed);
        handleInput();
    }//update loop


    /**
     * Takes keyboard inputs from user and issues commands based on that input.
     */
    public function handleInput():Void{
        //check to see if keys are pressed
        _up =  _keys.checkStatus(W, PRESSED);
        _down =  _keys.checkStatus(S, PRESSED);
        _left = _keys.checkStatus(A, PRESSED);
        _right = _keys.checkStatus(D, PRESSED);
        //check primary
        //check secondary

        //check for left/right, up/down key collision
        if (_left && _right) _left = _right = false;
        if (_up && _down) _up = _down = false;
        
        //issue commands
        if (_up) UpCommand.execute(player);
        if (_down) DownCommand.execute(player);
        if (_left) LeftCommand.execute(player);
        if (_right) RightCommand.execute(player);
        //issue primary
        //issue secondary
    }//function handleInput
}
