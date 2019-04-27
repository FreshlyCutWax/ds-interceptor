package command;

import command.Command;

class DownCommand implements Command
{
    public static function execute(ship:Ship):Void{
        ship.thrustVertical(1);
    }
}
