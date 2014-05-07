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

_missionType = "Night Event";
_mainTextColour = "#52bf90";
_successTextColour = "#17FF41";
_failTextColour = "#FF1717";
_subTextColour = "#FFFFFF";


_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> Storm Event</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>Starting in 1 Minutes, prepare for death</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
 sleep 60; 

{
    if(alive _x) then{
    [nil, _x, "loc", rEXECVM, "server\missions\events\stormEffect.sqf", player, [1, 1, 0.2, 10, 600, 0, [1,1,1]]] call RE;};
}forEach playableUnits;
      
 _hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'>Storm Event</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>has begun, beware of the Lightning strike</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;
sleep 240;

_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> Storm Event</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'> will end in 1 minutes</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;	
sleep 60;
_hint = parseText format ["<t align='center' color='%1' shadow='2' size='1.75'> Storm Event is finished</t><br/><t align='center' color='%1'>------------------------------</t><br/><t color='%2' size='1.0'>You are Alive.</t>", _mainTextColour, _subTextColour];
[nil,nil,rHINT,_hint] call RE;

 {
   if(alive _x) then{
   mando_storm = false;};
   
}forEach playableUnits;

mando_storm = false;
diag_log format["WASTELAND SERVER - event Finished"];
eventRunning = false;

 
	