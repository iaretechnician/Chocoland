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
_test=false;
_count = 0;
while {_running} do
{ 
    _currTime = floor(time);
    if(_currTime - _startTime >= _delayTime) then {deletevehicle _smoke ;_running = false;};
    sleep 1;
    _count= _count +1;
    if(!_test)then{
    _smoke = "smokeShellred" createVehicle _pos;
		_smoke setPos _pos;
		_smoke attachTo [_Parachute,[0,0,-1.5]];
                _test =true;
                      };
     if(_count == 30)then{_smoke = "smokeShellred" createVehicle _pos;
		_smoke setPos _pos;
		_smoke attachTo [_Parachute,[0,0,-1.5]];};
            
};