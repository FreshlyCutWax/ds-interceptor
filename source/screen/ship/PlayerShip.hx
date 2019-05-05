package screen.ship;

import screen.ship.Ship;

class PlayerShip extends Ship
{
    override public function new(?X:Float, ?Y:Float, ?XBoundOffset:Int, ?YBoundOffset:Int){
        super(X, Y, XBoundOffset, YBoundOffset);
    }//constructor


    override public function update(elapsed:Float):Void{
        super.update(elapsed);
    }//update loop
}
