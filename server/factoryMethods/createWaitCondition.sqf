//	@file Version: 1.0
//	@file Name: createWaitCondition.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 26/1/2013 15:19

if(!isServer) exitwith {};

private["_delayTime","_startTime","_running","_currTime","_pos"];

_delayTime = _this select 0;
_pos = _this select 1;


   _smoke = "smokeShellred" createVehicle _pos;
		_smoke setPos _pos;
		
                sleep _delaytime;
