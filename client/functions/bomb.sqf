
if(player getVariable"choco" >= 50000) then {
_pos = getposATL player;
_bomb = "Bo_GBU12_LGB" createVehicle _pos;
_bomb setPosATL _pos;
_bomb attachTo [player,[0,0,-0.5]];
 player setVariable["choco", (player getVariable "choco")- 50000, false];
 BOMB = true;
player removeAction bombId;
} else{hint "you dont have enough money";};