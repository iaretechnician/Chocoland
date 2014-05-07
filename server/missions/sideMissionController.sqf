//	@file Version: 1.0
//	@file Name: sideMissionController.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19

if(!isServer) exitWith {};

#include "setup.sqf"
#include "sideMissions\sideMissionDefines.sqf";

private ["_SMarray","_lastMission","_randomIndex","_mission","_missionType","_newMissionArray","_lastMission"];

diag_log format["WASTELAND SERVER - Started Side Mission State"];

//Side Mission Array
_SMarray = [[mission_SmallHeli,"mission_SmallHeli"],
			[mission_WepCache,"mission_WepCache"],
            [mission_ReconVeh,"mission_ReconVeh"],
             [mission_ReconVeh,"mission_ReconVeh"],
            [mission_AirWreck,"mission_AirWreck"],
            [mission_SmallHeli,"mission_SmallHeli"],
            [mission_Truck,"mission_Truck"]];

_lastMission = "nomission";

while {true} do
{
    //waiting
    _countppl= 300;
    {
	if (alive _x) then
		{
                _countppl= _countppl -10;	
		};
	} forEach playableUnits; 
       if(_countppl < 0)then {_countppl =0;};
        sleep _countppl;

	//Select Mission
    _randomIndex = (random (count _SMarray - 1));
	_mission = _SMarray select _randomIndex select 0;
    _missionType = _SMarray select _randomIndex select 1;

	//Select new mission if the same
    if(str(_missionType) == _lastMission) then
    {
        _newMissionArray = _SMarray;
        _newMissionArray set [_randomIndex, "REMOVETHISCRAP"];
        _newMissionArray = _newMissionArray - ["REMOVETHISCRAP"];
        _randomIndex = (random (count _newMissionArray - 1));
        _missionType = _newMissionArray select _randomIndex select 1;
        _mission = _newMissionArray select _randomIndex select 0;   
    };
    
	_missionRunning = [] spawn _mission;
    diag_log format["WASTELAND SERVER - Execute New Side Mission: %1",_missionType];
  
    _lastMission = _missionType;
	waitUntil{sleep 0.1; scriptDone _missionRunning};
    
};