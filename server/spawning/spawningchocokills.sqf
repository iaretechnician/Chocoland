if(!X_Server) exitWith {};

_private=["_pos1"];
_pos1=_this;
_pos =[_pos1 select 0,_pos1 select 1,500];

//coroutine
 _spawn = "SatPhone" createVehicle _pos;
 _spawn setpos _pos;
 _Parachute = "ParachuteBigWest_EP1" createVehicle position _spawn;
		_Parachute setPos (getPos _spawn);
                _Parachute setvelocity [0,10,0];
		_spawn attachTo [_Parachute,[0,0,-1.5]];
		waitUntil {(getPos _spawn select 2) < 2 || !alive _spawn || !alive _Parachute};
		deTach _spawn;
		sleep 1;
		deleteVehicle _Parachute;
                 _spawn setDamage (0.00);
