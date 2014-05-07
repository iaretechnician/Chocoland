//	@file Version: 1.0
//	@file Name: worldMissionController.sqf
//	@file Author: [404] Costlyy
//	@file Created: 30th May 2013
//	@file Args:

if(!isServer) exitWith {};


#include "setup.sqf"
diag_log format["WASTELAND SERVER - Started event State"];

//Main Mission Array
_MMarray1 = ["moneyzone","night","moneyzone","storm","moneyzone"];//storm

eventRunning = false;
while {true} do
{ 
  sleep 1800;
    if(!eventRunning) then
    {
        _currTime = Round (random 3);
	if(_currTime == 1) then 
        {
           
                  _mission = _MMarray1 call BIS_fnc_selectRandom; 
                execVM format ["server\missions\events\%1.sqf",_mission];
               	eventRunning = true;
                 diag_log format["WASTELAND SERVER - Execute New event"];
	};
    };
   
};