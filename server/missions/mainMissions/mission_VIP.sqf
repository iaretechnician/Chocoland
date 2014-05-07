//	@file Version: 1.0
//	@file Name: mission_VIP.sqf
//	@file Author: [404] Costlyy
//	@file Created: 30th May 13
//	@file Args:

#include "setup.sqf"
#include "mainMissionDefines.sqf";

if(!isServer) exitwith {};
private ["_result","_missionMarkerName","_missionType","_startTime","_returnData","_randomPos","_randomIndex","_vehicleClass","_base","_veh","_picture","_vehicleName","_hint","_currTime","_playerPresent","_unitsAlive"];

//Mission Initialization.
_result = 0;
_success = false;
_missionMarkerName = "VIP_Marker";
_missionType = "Rescue VIP";
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

_veh = "outpostVIP";
_base = [_veh, 0, _randomPos] execVM "server\functions\createOutpost.sqf";



sleep 10;


_placeholderItem = nearestObjects [_randomPos, ["Baseball"],  75] select 0;
_placeholderLoc = getPosATL _placeholderItem;
_placeholderDir = getDir _placeholderItem;

deleteVehicle _placeholderItem;

_group = createGroup civilian;
_unitVIP = _group createunit ["Functionary1", _placeholderLoc, [], 0.5, "NONE"];
_unitVIP setDir (_placeholderDir);
removeAllWeapons _unitVIP;
removeAllItems _unitVIP;
_unitVIP playMove "AmovPercMstpSsurWnonDnon";     
_unitVIP DisableAI "ANIM"; 
_unitVIP setVariable["released",0,true];


_vehicleName = "Captured VIP";
   _war1 = Round (random 100)+900;
_hint = parseText format ["<t align='center' color='%3' shadow='2' size='1.75'>Mission %5</t><br/><t align='center' color='%3'>------------------------------</t><br/><t align='center' color='%4' size='1.25'>%1</t><br/><t align='center' color='%4'>A<t color='%3'> %2</t> has been located near the marker. Go rescue him to earn a reward.</t>", _missionType, _vehicleName, mainMissionColor, subTextColor, _war1];
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
    if((_currTime - _startTime >= mainMissionTimeout) OR (!(alive _unitVIP))) then { _result = 1; };
    if(((_unitVIP getVariable "released") == 1) AND (alive _unitVIP)) then { _success = true; };
    ((_success) OR (_result == 1))
};

if(_result == 1) then
{
	_hint = parseText format ["<t align='center' color='%3' shadow='2' size='1.75'>Mission %5 Failed</t><br/><t align='center' color='%3'>------------------------------</t><br/><t align='center' color='%4' size='1.25'>%1</t><br/><t align='center' color='%4'>Objective failed. The enemy is scuttling the base and has killed the VIP.</t>", _missionType, _vehicleName, failMissionColor, subTextColor, _war1];
	[nil,nil,rHINT,_hint] call RE;
    
    _unitVIP setDamage 1;
    
     
    _baseToDelete = nearestObjects [_randomPos, ["All"], 22];
    { deleteVehicle _x; } forEach _baseToDelete;
    
 
     {{_x spawn{_this setDamage 1; sleep 3; hidebody _this; sleep 3; deleteVehicle _this;};
}forEach units CivGrpL;
    
    diag_log format["WASTELAND SERVER - Main Mission Failed: %1",_missionType];
} else {
	//Mission Complete.
    {deleteVehicle _x;}forEach units CivGrpL;
    deleteGroup CivGrpL;
     {_x spawn{_this setDamage 1; sleep 3; hidebody _this; sleep 3; deleteVehicle _this;};
}forEach units CivGrpL;
  
    _hint = parseText format ["<t align='center' color='%3' shadow='2' size='1.75'>Mission %5 Complete</t><br/><t align='center' color='%3'>------------------------------</t><br/><t align='center' color='%4' size='1.25'>%1</t><br/><t align='center' color='%4'>The VIP has successfuly escaped.</t>", _missionType, _vehicleName, successMissionColor, subTextColor, _war1];
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