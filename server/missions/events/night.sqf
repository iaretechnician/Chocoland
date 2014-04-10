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

_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> Night Event</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>Starting in 1 Minutes, you can find NightVision googles in Parastore - Weapons - Equipment</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
 sleep 60; 
 setDate[2014,03,07,00,00];
 _inArea = _randomPos nearEntities _missionRewardRadius;
	{
	if (isPlayer _x) then {
           _x setVehicleInit "setDate[2014,03,07,00,00]";
           processInitCommands;
	};
	} forEach _inArea;
 _hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> Night Event</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>has begun, 10 minutes in Darkness,you can find NightVision googles in Parastore - Weapons - Equipment</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
sleep 300;
setDate[2014,03,07,03,00];
 _inArea = _randomPos nearEntities _missionRewardRadius;
	{
	if (isPlayer _x) then {
          _x setVehicleInit "setDate[2014,03,07,03,00]";
           processInitCommands;
	};
	} forEach _inArea;
_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> Night Event</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'> will end in 5 minutes</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;	
sleep 240;
setDate[2014,03,07,06,00];
 _inArea = _randomPos nearEntities _missionRewardRadius;
	{
	if (isPlayer _x) then {
          _x setVehicleInit "setDate[2014,03,07,06,00]";
           processInitCommands;
	};
	} forEach _inArea;
_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> Night Event</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>will end in 1 minutes</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
sleep 60;
setDate[2014,03,07,12,00];
 _inArea = _randomPos nearEntities _missionRewardRadius;
	{
	if (isPlayer _x) then {
         _x setVehicleInit "setDate[2014,03,07,12,00]";
           processInitCommands;
	};
	} forEach _inArea;
_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> Night Event is finished</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>Good Morning Sir.</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
sleep 10;

diag_log format["WASTELAND SERVER - Mission Finished"];
eventRunning = false;

 
	