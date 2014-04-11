if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER - Mission Started"];
//private ["_pos"];
_mainTextColour = "#0095FF";
_subTextColour = "#FFFFFF";


          _xCord1 = Round (random 1900) + 2757.01;
          _yCord1 = Round (random 1400) + 3108.21;
          _pos1 = [_xCord1, _yCord1,0.0014];
     
	//_pos1 = [3445.93,3665.25, 0.0013];
_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Player Triggered The Money Zone</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>the Money Zone will Spawning right now, look for Purple Smoke, you will get 999$ every second, but it is not marked on the Map</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
sleep 5;

 _smoke1 = createVehicle ["smokeShellpurple",_pos1,[], 0,"CAN_COLLIDE"];
 _smoke1 setpos _pos1;
 _pos1 = [_xCord1 +1, _yCord1+1,0.0014];
 _smoke2 = createVehicle ["smokeShellpurple",_pos1,[], 0,"CAN_COLLIDE"];
 _smoke2 setpos _pos1;
 _pos1 = [_xCord1 -1, _yCord1-1,0.0014];
 _smoke3 = createVehicle ["smokeShellpurple",_pos1,[], 0,"CAN_COLLIDE"];
 _smoke3 setpos _pos1;
 _pos1 = [_xCord1, _yCord1+1,0.0014];
 _smoke4 = createVehicle ["smokeShellpurple",_pos1,[], 0,"CAN_COLLIDE"];
 _smoke4 setpos _pos1;
 _pos1 = [_xCord1+1, _yCord1,0.0014];
 _smoke5 = createVehicle ["smokeShellpurple",_pos1,[], 0,"CAN_COLLIDE"];
 _smoke5 setpos _pos1;
_timer = 0;
_war1 = "yeah 999$";
_reward = 999;
while {_timer !=60} do
{     
       	_inArea = _pos1 nearEntities 5;
	{
	if (isPlayer _x) then {
           
	 [nil,_x, "loc", rEXECVM, "client\functions\moneyZone.sqf", "reward", _war1, _reward] call RE;};
     	} forEach _inArea;
        sleep 1;
    _timer =_timer +1;
    

};
_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Money Zone Event Despawned</t><br/>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
sleep 1;

deleteVehicle _smoke1;
deleteVehicle _smoke2;
deleteVehicle _smoke3;
deleteVehicle _smoke4;
deleteVehicle _smoke5;

eventRunning = false;