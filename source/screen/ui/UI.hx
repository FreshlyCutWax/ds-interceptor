package screen.ui;

import flixel.FlxSprite;
import flixel.text.FlxText;
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


    /**
     * Text displaying player health.
     */
    public var healthText:FlxText;


    /**
     * Offset of health text from ui position.
     */
    private var _healthOffsetX:Int;
    private var _healthOffsetY:Int;


    ///////////////////////////////////////////////////////////////////
    //////////////////////////////methods//////////////////////////////
    ///////////////////////////////////////////////////////////////////
    override public function new(?X:Float, ?Y:Float, Player:PlayerShip):Void{
        super(X, Y);

        //general
        centerOrigin();
        _player = Player;
        _offset = 32;
        _healthOffsetX = -16;

        //position
        position = new FlxPoint();

        //health text
        healthText = new FlxText();
        centerOrigin();
        healthText.size = 12;
        healthText.fieldWidth = 64;
        healthText.alignment = "center";
    }//constructor

    
    override public function update(elapsed:Float):Void{
        _trackPlayerPosition();
        _updateHealth();
        super.update(elapsed);
    }//update loop


    /**
     * Updates health text with current health value.
     */
    private function _updateHealth():Void{
        var text = Std.string(_player.health);
        text += "%";
        healthText.text = text;
    }//function _updateHealth


    /**
     * Tracks player position and sets UI position to player.
     */
    private function _trackPlayerPosition():Void{
        _player.getPosition(position);
        position.y += _offset;
        setPosition(position.x, position.y);
        healthText.setPosition(position.x + _healthOffsetX, position.y);
    }//function _trackPlayerPosition
}
