package;

import flixel.FlxBasic;
import flixel.input.keyboard.FlxKeyboard;

class InputHandler extends FlxBasic;
{
    /**
     * Flixel class for handling keyboard input.
     * Read-only.
     */
    private static var _keys():FlxKeyboard;


    override public function new():Void{
        super();
    }//constructor

    
    override public function update(elapsed:Float):Void{
        super(elapsed);
    }//update loop
}
