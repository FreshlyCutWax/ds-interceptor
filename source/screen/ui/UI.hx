package screen.ui;

//flixel
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

//game
import screen.ship.PlayerShip;

class UI extends FlxSprite
{
    /**
     * Reference to the player's score.
     */
    private var _score:Int;


    /**
     * Reference to player ship screen object to follow and track.
     */
    private var _player:PlayerShip;


    /**
     * Holds position object.
     */
    public var position:FlxPoint;


    /**
     * Offset position from player ship screen object.
     */
    private var _offsetX:Int;
    private var _offsetY:Int;


    /**
     * Text displaying player health.
     */
    public var healthText:FlxText;


    /**
     * Offset of health text from ui position.
     */
    private var _healthOffsetX:Int;
    private var _healthOffsetY:Int;


    /**
     * Text displaying player score.
     */
    public var scoreText:FlxText;


    /**
     * Offset of score text from ui position.
     */
    private var _scoreOffsetX:Int;
    private var _scoreOffsetY:Int;


    /**
     * Emblem representing primary weapon equiped.
     */
    public var primaryEmblem:FlxSprite;


    /**
     * Offset of primary weapon emblem.
     */
    private var _primaryOffsetX:Int;
    private var _primaryOffsetY:Int;


    /**
     * Emblem representing secondary weapon equiped.
     */
    public var secondaryEmblem:FlxSprite;


    /**
     * Offset of primary weapon emblem.
     */
    private var _secondaryOffsetX:Int;
    private var _secondaryOffsetY:Int;


    ///////////////////////////////////////////////////////////////////
    //////////////////////////////methods//////////////////////////////
    ///////////////////////////////////////////////////////////////////
    override public function new(?X:Float, ?Y:Float, Player:PlayerShip, Score:Int):Void{
        super(X, Y);

        //general
        _player = Player;
        _score = Score;
        alpha = 0.5;

        //position
        position = new FlxPoint();

        //set height and width
        frameWidth = 64;
        frameHeight = 20;

        //offset positioning
        _offsetX = -16;
        _offsetY = _player.frameHeight + 16;
        _healthOffsetX = frameWidth + 16;
        _healthOffsetY = -16;
        _scoreOffsetX = 0;
        _scoreOffsetY = 0;
        _primaryOffsetX = -32;
        _primaryOffsetY = -16;
        _secondaryOffsetX = -26;
        _secondaryOffsetY = -16;

        //health text
        healthText = new FlxText();
        healthText.size = 12;
        healthText.fieldWidth = 64;
        healthText.alignment = "left";
        healthText.alpha = alpha;

        //score text
        scoreText = new FlxText();
        scoreText.size = 12;
        scoreText.fieldWidth = 64;
        scoreText.alignment = "center";
        scoreText.alpha = alpha;

        //primary weapon emblem
        primaryEmblem = new FlxSprite();
        primaryEmblem.makeGraphic(8, 16, FlxColor.RED);
        primaryEmblem.alpha = alpha;

        //secondary weapon emblem
        secondaryEmblem = new FlxSprite();
        secondaryEmblem.makeGraphic(8, 16, FlxColor.BLUE);
        secondaryEmblem.alpha = alpha;

        //draw graphic
        makeGraphic(frameWidth, frameHeight, FlxColor.GRAY);
    }//constructor

    
    override public function update(elapsed:Float):Void{
        _trackPlayerPosition();
        _updateHealth();
        _updateScore();
        _updatePrimary();
        _updateSecondary();
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
     * Updates score text with current score value.
     */
    private function _updateScore():Void{
        var text = Std.string(_score);
        scoreText.text = text;
    }//function _updateHealth


    /**
     * Updates primary weapon emblem with current weapon.
     */
    private function _updatePrimary():Void{
        //code
    }//function _updateHealth

    
    /**
     * Updates secondary weapon emblem with current weapon.
     */
    private function _updateSecondary():Void{
        //code
    }//function _updateHealth


    /**
     * Tracks player position and sets UI position to player.
     */
    private function _trackPlayerPosition():Void{
        _player.getPosition(position);

        //ui position
        position.x += _offsetX;
        position.y += _offsetY;
        setPosition(position.x, position.y);

        //init vars for positioning
        var posX:Float;
        var posY:Float;

        //health text position
        posX = position.x + _healthOffsetX;
        posY = position.y + _healthOffsetY;
        healthText.setPosition(posX, posY);

        //score text position
        posX = position.x + _scoreOffsetX;
        posY = position.y + _scoreOffsetY;
        scoreText.setPosition(posX, posY);

        //primary weapon emblem position
        posX = position.x + _primaryOffsetX;
        posY = position.y + _primaryOffsetY;
        primaryEmblem.setPosition(posX, posY);

        //secondary weapon emblem position
        posX = position.x + _secondaryOffsetX;
        posY = position.y + _secondaryOffsetY;
        secondaryEmblem.setPosition(posX, posY);
    }//function _trackPlayerPosition
}
