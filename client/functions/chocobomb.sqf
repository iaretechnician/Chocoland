
titleText [format["\n ChocoBomb activated  you have 3 seconds,RUN !!"], "PLAIN DOWN", 0];
sleep 1;
titleText [format["\n 2 seconds"], "PLAIN DOWN", 0];
sleep 1;
titleText [format["\n 1 second"], "PLAIN DOWN", 0];
sleep 1;
_camonet = (nearestobjects [getpos player, ["Explosive"],  5] select 0);
_randomPos = getpos _camonet;
deleteVehicle _camonet;
_bounty=player getVariable"bounty";

if(_bounty < 1)exitwith{titleText [format["\n your bomb have no Power"], "PLAIN DOWN", 0];};
 if(_bounty >= 1)then{_bomb = "GrenadeHand" createVehicle 3;
_baseToDelete = nearestObjects [_randomPos,["All"],_range];
{deleteVehicle _x;} forEach _baseToDelete;};

 if(_bounty >= 3)then{_bomb = "R_80mm_HE" createVehicle 5;
_baseToDelete = nearestObjects [_randomPos,["All"],_range];
{deleteVehicle _x;} forEach _baseToDelete;};

 if(_bounty >= 6)then{_bomb = "Sh_122_HE" createVehicle 10;
_baseToDelete = nearestObjects [_randomPos,["All"],_range];
{deleteVehicle _x;} forEach _baseToDelete;};

 if(_bounty >= 10)then{_bomb = "Bo_GBU12_LGB_MI10" createVehicle 20;
_baseToDelete = nearestObjects [_randomPos,["All"],_range];
{deleteVehicle _x;} forEach _baseToDelete;};
       
player setVariable ["bounty",0,true]; 
sleep 1;


