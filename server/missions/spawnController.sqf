//	@file Version: 1.0
//	@file Name: worldMissionController.sqf
//	@file Author: [404] Costlyy
//	@file Created: 30th May 2013
//	@file Args:

if(!isServer) exitWith {};


#include "setup.sqf"
diag_log format["WASTELAND SERVER - Started spawning State"];

//Main Mission Array
_MMarray2 = ["spawningObjects",
"spawningVehicles",
"spawningMoney",
"spawningAnimals",
"spawningchocokills"];


while {true} do
{ 
    {
	if (alive _x) then
		{
                    setWind [0, 0, true];
		 []execVM "server\spawning\spawningObjects.sqf";
                 []execVM "server\spawning\spawningVehicles.sqf";
                 []execVM "server\spawning\spawningAnimals.sqf";
                 []execVM "server\spawning\spawningchocokills.sqf";
                 []execVM "server\spawning\spawningMoney.sqf";	
		};
	} forEach playableUnits;    
    sleep 2400;
    };
   
