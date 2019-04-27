package command;

import command.Command;

class LeftCommand implements Command
{
    public static function execute(ship:Ship):Void{
        ship.thrustHorizontal(-1);
    }
}
