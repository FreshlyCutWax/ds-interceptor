package screen.ship;

import screen.ship.Ship;

class PlayerShip extends Ship
{
    override public function new(?X:Float, ?Y:Float){
        super(X, Y);
    }//constructor


    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }//update loop
}
