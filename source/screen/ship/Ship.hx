package screen.ship;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxPoint;

class Ship extends FlxSprite
{
    /**
     * Position of player in game.
     */
    private var position:FlxPoint; 


    /**
     * Offset of screen bound checking.
     */
    public var boundOffset:Int;


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


    override public function new(?X:Float, ?Y:Float):Void{
        super(X, Y);

        //general
        solid = true;
        health = 100;
        shield = 0;

        //speed & direction
        speedX = 180;
        speedY = 250;
        drag.x = drag.y = 300;

        //screen bounding
        boundOffset = 32;
        _leftBound = 0 + boundOffset;
        _rightBound = FlxG.width - boundOffset;
        _upperBound = 0 + boundOffset;
        _lowerBound = FlxG.height - boundOffset;
    }//constructor

    
    override public function update(elapsed:Float):Void{
        _checkBounds();
        super.update(elapsed);
    }//update loop


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
        position = getPosition();

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
