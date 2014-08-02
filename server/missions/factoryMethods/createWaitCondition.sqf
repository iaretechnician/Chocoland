//	@file Version: 1.0
//	@file Name: createWaitCondition.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 26/1/2013 15:19

if(!isServer) exitwith {};

private["_delayTime","_startTime","_running","_currTime","_pos"];

_delayTime = _this select 0;
_pos = _this select 1;
_startTime = floor(time);
_running = true;
_count = 0;
while {_running} do
{ 
   
    if(_count >= _delayTime) then {deletevehicle _smoke ;_running = false;};
     if(_count == 0 || _count == 30)then{_smoke = "smokeShellred" createVehicle _pos;
		_smoke setPos _pos;
		};
                sleep 1;
                _count= _count +1;
};