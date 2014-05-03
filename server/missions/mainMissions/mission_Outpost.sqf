//	@file Version: 1.0
//	@file Name: mission_Outpost.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 03:25
//	@file Args:
#include "setup.sqf"
#include "mainMissionDefines.sqf";

if(!isServer) exitwith {};
private ["_result","_missionMarkerName","_missionType","_startTime","_returnData","_randomPos","_randomIndex","_vehicleClass","_base","_veh","_picture","_vehicleName","_hint","_currTime","_playerPresent","_unitsAlive"];

//Mission Initialization.
_result = 0;
_missionMarkerName = "Outpost_Marker";
_missionType = "Capture Outpost";
#ifdef __A2NET__
_startTime = floor(netTime);
#else
_startTime = floor(time);
#endif

diag_log format["WASTELAND SERVER - Main Mission Started: %1",_missionType];

//Get Mission Location
_returnData = call createMissionLocation;
_randomPos = _returnData select 0;
_randomIndex = _returnData select 1;

diag_log format["WASTELAND SERVER - Main Mission Waiting to run: %1",_missionType];
[mainMissionDelayTime,_randomPos] call createWaitCondition;

diag_log format["WASTELAND SERVER - Main Mission Resumed: %1",_missionType];

[_missionMarkerName,_randomPos,_missionType] call createClientMarker;

_veh = ["outpostUS1","smallbase1","carrier2"] call BIS_fnc_selectRandom;
_base = [_veh, 0, _randomPos] execVM "server\functions\createOutpost.sqf";

_vehicleName = "Enemy Outpost";
  _war1 = Round (random 100)+600;
_hint = parseText format ["<t align='center' color='%3' shadow='2' size='1.75'>Mission %5</t><br/><t align='center' color='%3'>------------------------------</t><br/><t align='center' color='%4' size='1.25'>%1</t><br/><t align='center' color='%4'>A<t color='%3'> %2</t> has been spotted near the marker!</t>", _missionType, _vehicleName, mainMissionColor, subTextColor, _war1];
[nil,nil,rHINT,_hint] call RE;

CivGrpL = createGroup civilian;
[CivGrpL,_randomPos] spawn createLargeGroup;

diag_log format["WASTELAND SERVER - Main Mission Waiting to be Finished: %1",_missionType];
#ifdef __A2NET__
_startTime = floor(netTime);
#else
_startTime = floor(time);
#endif
waitUntil
{
    sleep 1; 
	_playerPresent = false;
	#ifdef __A2NET__
	_currTime = floor(netTime);
	#else
    _currTime = floor(time);
	#endif
    if(_currTime - _startTime >= mainMissionTimeout) then {_result = 1;};
    _unitsAlive = ({alive _x} count units CivGrpL);
    (_result == 1) OR (_unitsAlive < 1)
};

if(_result == 1) then
{
	_hint = parseText format ["<t align='center' color='%3' shadow='2' size='1.75'>Mission %5 Failed</t><br/><t align='center' color='%3'>------------------------------</t><br/><t align='center' color='%4' size='1.25'>%1</t><br/><t align='center' color='%4'>Objective failed. Enemy airstrike inbound!</t>", _missionType, _vehicleName, failMissionColor, subTextColor, _war1];
	[nil,nil,rHINT,_hint] call RE;
    
    sleep 10;
    
	//Mission Failed. Firstly obliterate the site.
    _bomb = "Bo_GBU12_LGB" createVehicle [(_randomPos select 0),(_randomPos select 1), 50]; 
    sleep 1;
   
    _baseToDelete = nearestObjects [_randomPos, ["All"], 22];
    { deleteVehicle _x; } forEach _baseToDelete;
    
    
    {_x spawn{_this setDamage 1; sleep 3; hidebody _this; sleep 3; deleteVehicle _this;};
}forEach units CivGrpL;
    
    diag_log format["WASTELAND SERVER - Main Mission Failed: %1",_missionType];
} else {
	//Mission Complete.
   
    {_x spawn{_this setDamage 1; sleep 3; hidebody _this; sleep 3; deleteVehicle _this;};
}forEach units CivGrpL;
    _hint = parseText format ["<t align='center' color='%3' shadow='2' size='1.75'>Mission %5 Complete</t><br/><t align='center' color='%3'>------------------------------</t><br/><t align='center' color='%4' size='1.25'>%1</t><br/><t align='center' color='%4'>The outpost and weapons have been captured.</t>", _missionType, _vehicleName, successMissionColor, subTextColor, _war1];
	[nil,nil,rHINT,_hint] call RE;
    
    diag_log format["WASTELAND SERVER - Main Mission Success: %1",_missionType];
     //Cash Reward
        _missionRewardRadius =200;
_reward = Round(random 1000) +5000;
	_inArea = _randomPos nearEntities _missionRewardRadius;
	{
	if (isPlayer _x) then {
       [nil,_x, "loc", rEXECVM, "client\functions\missionReward.sqf", "reward", _war1, _reward] call RE;
	};
	} forEach _inArea;
};

//Reset Mission Spot.
MissionSpawnMarkers select _randomIndex set[1, false];
[_missionMarkerName] call deleteClientMarker;