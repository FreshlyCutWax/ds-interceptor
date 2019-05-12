package;

import screen.ship.PlayerShip;

class Command
{
    /**Ship Commands**/
    public static function up(ship:PlayerShip):Void{
        ship.thrustVertical(-1);
    }


    public static function down(ship:PlayerShip):Void{
        ship.thrustVertical(1);
    }


    public static function left(ship:PlayerShip):Void{
        ship.thrustHorizontal(-1);
    }


    public static function right(ship:PlayerShip):Void{
        ship.thrustHorizontal(1);
    }


    public static function firePrimary(ship:PlayerShip):Void{
        ship.firePrimary();
    }
}
