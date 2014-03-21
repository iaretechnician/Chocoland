if (!local player) exitWith {};
if !((getPlayerUID player) in serverAdministrators) exitWith {hint "Server Admin access only"};

player setPosASL [(getPos player) select 0,(getPos player) select 1,(getPos player)select 2 +20];
