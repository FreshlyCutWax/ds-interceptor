package command;

import command.Command;

class UpCommand implements Command
{
    public static function execute(ship:Ship):Void{
        ship.thrustVertical(-1);
    }
}
