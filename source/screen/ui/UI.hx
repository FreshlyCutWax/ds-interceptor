package screen.ui;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import screen.ship.PlayerShip;

class UI extends FlxSprite
{
    /**
     * Player ship screen object to follow and track.
     */
    private var _player:PlayerShip;


    /**
     * Holds position object.
     */
    public var position:FlxPoint;


    /**
     * Offset position from player ship screen object.
     */
    private var _offset:Int;


    override public function new(?X:Float, ?Y:Float, Player:PlayerShip):Void{
        super(X, Y);

        //general
        _player = Player;
        _offset = 32;

        //position
        position = new FlxPoint();
    }//constructor

    
    override public function update(elapsed:Float):Void{
        _trackPlayerPosition();
        super.update(elapsed);
    }//update loop


    /**
     * Tracks player position and sets UI position to player.
     */
    private function _trackPlayerPosition():Void{
        _player.getPosition(position);
        setPosition(position.x, position.y + _offset);
    }//function _trackPlayerPosition
}
