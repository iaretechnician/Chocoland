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
diag_log format["WASTELAND SERVER - Mission Started"];

//Mission Initialization.
_randomPos = [3707, 3608,0.0014];
_missionType = "Night Event";
_mainTextColour = "#52bf90";
_successTextColour = "#17FF41";
_failTextColour = "#FF1717";
_subTextColour = "#FFFFFF";
_missionRewardRadius = 50000;
testServer = true;
_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> ChocoStorm Event</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>Starting in 1 Minutes, prepare yourself to die</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
 sleep 60; 


 _inArea = _randomPos nearEntities _missionRewardRadius;
 _scriptHandle =true execVM"server\missions\events\loadStorm.sqf";
	{
	if (isPlayer _x) then {
           _x setVehicleInit "_x setdamage 0.2;";
           processInitCommands;
	};
	} forEach _inArea;
 _hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> ChocoStorm Event</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>has begun, 10 minutes remain", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
sleep 300;
sleep 5;
 _inArea = _randomPos nearEntities _missionRewardRadius;
	{
	if (isPlayer _x) then {
          _x setVehicleInit "_x setdamage 0.6;";
           processInitCommands;
	};
	} forEach _inArea;
_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> ChocoStorm Event</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'> will end in 5 minutes</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;	
sleep 240;

 _inArea = _randomPos nearEntities _missionRewardRadius;
	{
	if (isPlayer _x) then {
          _x setVehicleInit "_x setdamage 0.9;";
           processInitCommands;
	};
	} forEach _inArea;
_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> ChocoStorm Event</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>will end in 1 minutes</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
sleep 60;

 _inArea = _randomPos nearEntities _missionRewardRadius;
	{
	if (isPlayer _x) then {
         _x setVehicleInit "_x setdamage 0;";
           processInitCommands;
	};
	} forEach _inArea;
"colorCorrections" ppEffectEnable false;
"filmGrain" ppEffectEnable false;
testServer = false;
terminate _scriptHandle;

true execVM "client\functions\loadAtmosphere.sqf";

_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> ChocoStorm Event is finished</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>Hope you are alive</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
sleep 10;

diag_log format["WASTELAND SERVER - Mission Finished"];
eventRunning = false;

 
	