package screen.ship;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxSoundAsset;

class Ship extends FlxSprite
{
    /**
     * Holds Position object.
     */
    public var position:FlxPoint;


    /**
     * Variables to store screen bounds for checking.
     */
    private var _leftBound:Int;
    private var _rightBound:Int;
    private var _upperBound:Int;
    private var _lowerBound:Int;


    /**
     * Stores sheild health.
     */
    public var shield:Float;


    /**
     * x-axis & y-axis speed.
     */
    public var speedX:Float;
    public var speedY:Float;


    /**
     * Sound that plays on ship death.
     */
    private var _deathSound:FlxSoundAsset;


    override public function new(?X:Float, ?Y:Float, ?XBoundOffset:Int, ?YBoundOffset:Int):Void{
        super(X, Y);

        //general
        solid = true;
        health = 100;
        shield = 0;
        _deathSound = AssetPaths.explosion__wav;

        //load graphic
        frameWidth= 32;
        frameHeight = 32;
        makeGraphic(frameWidth, frameHeight, FlxColor.CYAN);

        //speed & position
        position = new FlxPoint();
        speedX = 180;
        speedY = 250;
        drag.x = drag.y = 300;

        //screen bounding
        _setBounds(XBoundOffset, YBoundOffset);
    }//constructor

    
    override public function update(elapsed:Float):Void{
        _checkBounds();
        super.update(elapsed);
    }//update loop


    /**
     * Overrides kill function to add death sound.
     */
    override public function kill():Void{
        super.kill();
        FlxG.sound.play(_deathSound);
    }//function kill


    /**
     * Helper method for setting screen bound parameters.
     */
    private function _setBounds(?xOffset:Int, ?yOffset:Int):Void{
        //default 32 pixels
        if (xOffset == null) xOffset = 32;
        if (yOffset == null) yOffset = 32;
        
        _leftBound = 0 + xOffset;
        _rightBound = FlxG.width - xOffset;
        _upperBound = 0 + yOffset;
        _lowerBound = FlxG.height - yOffset;
    }//function _setBounds


    /**
     * Moves ship vertically on screen.
     * @param direction     -1 for up, 
     *                       1 for down,
     *                       0 for none.
     */
    public function thrustVertical(direction:Int):Void{
        var v = speedY * direction;
        velocity.y = v;
    }//function thrustVertical


    /**
     * Moves ship horizontally on screen.
     * @param direction     -1 for left, 
     *                       1 for right,
     *                       0 for none.
     */
    public function thrustHorizontal(direction:Int):Void{
        var v = speedX * direction;
        velocity.x = v;
    }//function thrustHorizontal


    /**
     * Check and corrects when player is out of screen bounds.
     */
    private function _checkBounds():Void{
        getPosition(position);

        _checkXAxis();
        _checkYAxis();

        setPosition(position.x, position.y);
    }//function _checkBounds


    /**
     * Helper method for _checkBounds(). Checks bounds on x-axis.
     */
    private function _checkXAxis():Void{
        if (position.x < _leftBound) position.x = _leftBound;
        else if (position.x > _rightBound) position.x = _rightBound;
    }//function _checkXAxis


    /**
     * Helper method for _checkBounds(). Checks bounds on y-axis.
     */
    private function _checkYAxis():Void{
        if (position.y < _upperBound) position.y = _upperBound;
        else if (position.y > _lowerBound) position.y = _lowerBound;
    }//function _checkYAxis
}
