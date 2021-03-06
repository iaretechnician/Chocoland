//	@file Version: 1.0
//	@file Name: mainMissionController.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19
#include "setup.sqf"
#include "mainMissions\mainMissionDefines.sqf";

if(!isServer) exitWith {};

private ["_MMarray","_lastMission","_randomIndex","_mission","_missionType","_newMissionArray","_lastMission","_unit", "_marker", "_wait"];

diag_log format["WASTELAND SERVER - Started Main Mission State"];
_20 =0;
_r =0;
_allplayermoney= 0;
//Main Mission Array
_MMarray = [//[mission_SupplyDrop,"mission_SupplyDrop"],
	[mission_APC,"mission_APC"],
            [mission_Heli,"mission_Heli"],
            [mission_LightArmVeh,"mission_LightArmVeh"],
            [mission_LightTank,"mission_LightTank"],
            [mission_MBT,"mission_MBT"],
              [mission_MBT,"mission_MBT"],
                [mission_MBT,"mission_MBT"],
            [mission_Outpost,"mission_Outpost"],
         // [mission_RadarTruck,"mission_RadarTruck"],
            [mission_SmallHeli,"mission_SmallHeli"],
			[mission_WepCache,"mission_WepCache"],
            [mission_ReconVeh,"mission_ReconVeh"],
             [mission_ReconVeh,"mission_ReconVeh"],
            [mission_AirWreck,"mission_AirWreck"],
            [mission_SmallHeli,"mission_SmallHeli"],
            [mission_Truck,"mission_Truck"]
            ];
         
            
_lastMission = "nomission";

while {true} do
{
   //waiting 
    _countppl= 600;
    {
	if (alive _x) then
		{
                _countppl= _countppl -10;	
		};
	} forEach playableUnits; 
       if(_countppl < 0)then {_countppl =0;}; 
        sleep _countppl;

    //Select Mission
    _randomIndex = (random (count _MMarray - 1));
	_mission = _MMarray select _randomIndex select 0;
    _missionType = _MMarray select _randomIndex select 1;

	//Select new mission if the same
    if(str(_missionType) == _lastMission) then
    {
        _newMissionArray = _MMarray;
        _newMissionArray set [_randomIndex, "REMOVETHISCRAP"];
        _newMissionArray = _newMissionArray - ["REMOVETHISCRAP"];
        _randomIndex = (random (count _newMissionArray - 1));
        _missionType = _newMissionArray select _randomIndex select 1;
        _mission = _newMissionArray select _randomIndex select 0;    
    };
    
	_missionRunning = [] spawn _mission;
    diag_log format["WASTELAND SERVER - Execute New Main Mission: %1",_missionType];
   
    _lastMission = _missionType;
waitUntil{sleep 1; scriptDone _missionRunning};
 
};