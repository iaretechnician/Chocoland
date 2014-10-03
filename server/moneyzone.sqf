if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER - Mission Started"];
while {true} do
{ 
    _xCord1 = Round (random 1500) + 2757.01;
          _yCord1 = Round (random 1200) + 3108.21;
          _pos1 = [_xCord1, _yCord1,-14];
 
 _smoke1 = createVehicle ["Sign_circle",_pos1,[], 0,"CAN_COLLIDE"];
 _smoke1 setpos _pos1;

_pos1 = [_xCord1, _yCord1,0.0014];
 [_smoke1]execVM "server\events\moneyzoneEffect.sqf";
 _timer=0;
    
     _moneyzoney= {	_inArea = _smoke1 nearEntities 9;
	{if (isPlayer _x) then {_timer =_timer +1;
        [nil,_x, "loc", rEXECVM, "client\functions\moneyZone.sqf"] call RE;};
    } forEach _inArea;
   
};
waitUntil{sleep 1;[]call _moneyzoney; _timer >= 60};
 deleteVehicle _smoke1;
_sleep = (count playableunits)+60;
sleep _sleep;
};