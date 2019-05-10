package;

import screen.ship.Ship;

class Command
{
    /**Ship Commands**/
    public static function up(ship:Ship):Void{
        ship.thrustVertical(-1);
    }


    public static function down(ship:Ship):Void{
        ship.thrustVertical(1);
    }


    public static function left(ship:Ship):Void{
        ship.thrustHorizontal(-1);
    }


    public static function right(ship:Ship):Void{
        ship.thrustHorizontal(1);
    }
}
