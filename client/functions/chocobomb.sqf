_camonet = (nearestobjects [getpos player, ["Explosive"],  5] select 0);
_randomPos = getpos _camonet;
titleText [format["\n ChocoBomb activated  you have 3 seconds,RUN !!"], "PLAIN DOWN", 0];
sleep 1;
titleText [format["\n 2 seconds"], "PLAIN DOWN", 0];
sleep 1;
titleText [format["\n 1 second"], "PLAIN DOWN", 0];
sleep 1;
deleteVehicle _camonet;
_bounty=player getVariable"bounty";

if(_bounty < 1)exitwith{titleText [format["\n your bomb have no Power"], "PLAIN DOWN", 0];};
 if(_bounty >= 1)exitwith{
      if(_bounty >= 3)exitwith{
           if(_bounty >= 6)exitwith{
                if(_bounty >= 10)exitwith{
                    
 _bomb = "Bo_GBU12_LGB_MI10" createVehicle [_randomPos select 0,_randomPos select 1, 0];

_baseToDelete = nearestObjects [_randomPos,["All"],20];
{deleteVehicle _x;} forEach _baseToDelete;player setVariable ["bounty",0,true]; };

_bomb = "Sh_122_HE" createVehicle [_randomPos select 0,_randomPos select 1, 0];

_baseToDelete = nearestObjects [_randomPos,["All"],10];
{deleteVehicle _x;} forEach _baseToDelete;player setVariable ["bounty",0,true]; };

//
_bomb = "R_80mm_HE" createVehicle [_randomPos select 0,_randomPos select 1, 0];
_bomb = "R_80mm_HE" createVehicle [_randomPos select 0,_randomPos select 1, 0];
_baseToDelete = nearestObjects [_randomPos,["All"],6];
{deleteVehicle _x;} forEach _baseToDelete;player setVariable ["bounty",0,true]; };

//
_bomb = "R_80mm_HE" createVehicle [_randomPos select 0,_randomPos select 1, 0];

_baseToDelete = nearestObjects [_randomPos,["All"],3];
{deleteVehicle _x;} forEach _baseToDelete;player setVariable ["bounty",0,true]; };

 






