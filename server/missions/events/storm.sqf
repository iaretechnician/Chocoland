//	@file Version: 1.0
//	@file Name: mission_Base.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 04:56
//	@file Args:

//Side Mission Colour = #4BC9B0 - Turquoise 
//Main Mission Colour = #52bf90 - Light blue
//Fail Mission Colour = #FF1717 - Light red
//Fail Mission Colour = #17FF41 - Light green
//Sub Colour = #FFF - White
#include "setup.sqf"
if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER -event Started"];

//Mission Initialization.
_randomPos = [3707, 3608,0.0014];
_missionType = "Night Event";
_mainTextColour = "#52bf90";
_successTextColour = "#17FF41";
_failTextColour = "#FF1717";
_subTextColour = "#FFFFFF";
_missionRewardRadius = 50000;

_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> Storm Event</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>Starting in 1 Minutes, prepare for death</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
 sleep 60; 
 [1, 1, 0.6, 60, 300, 0, [1,1,1]] execVM "server\missions\events\stormEffect.sqf";
 _inArea = _randomPos nearEntities _missionRewardRadius;
	{
	if (isPlayer _x) then {
           _x setVehicleInit "";
           processInitCommands;
	};
	} forEach _inArea;
 _hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Storm Event</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>has begun, beware of the Lightning strike</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
sleep 240;
 _inArea = _randomPos nearEntities _missionRewardRadius;
	{
	if (isPlayer _x) then {
          _x setVehicleInit "";
           processInitCommands;
	};
	} forEach _inArea;
_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> Storm Event</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'> will end in 1 minutes</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;	
sleep 60;
 _inArea = _randomPos nearEntities _missionRewardRadius;
	{
	if (isPlayer _x) then {
          _x setVehicleInit "";
           processInitCommands;
	};
	} forEach _inArea;

_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> Storm Event is finished</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>You are Alive.</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
mando_storm = false;
diag_log format["WASTELAND SERVER - event Finished"];
eventRunning = false;

 
	