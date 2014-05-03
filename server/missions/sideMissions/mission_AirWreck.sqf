//	@file Version: 1.0
//	@file Name: mission_AirWreck.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19
//	@file Args:
#include "setup.sqf"
#include "sideMissionDefines.sqf";

if(!isServer) exitwith {};

private ["_result","_missionMarkerName","_missionType","_startTime","_returnData","_randomPos","_randomIndex","_vehicleClass","_box","_box2","_vehicle","_picture","_vehicleName","_hint","_currTime","_playerPresent","_unitsAlive"];

//Mission Initialization.
_result = 0;
_missionMarkerName = "AirWreck_Marker";
_missionType = "Aircraft Wreck";
_nerfBoxes = ["basicUS","basicUS2","basicRU","basicRU2","basicGER","basicPMC","basicSpecial","basicSpecial2","basicSpecial3"];
#ifdef __A2NET__
_startTime = floor(netTime);
#else
_startTime = floor(time);
#endif

diag_log format["WASTELAND SERVER - Side Mission Started: %1",_missionType];

//Get Mission Location
_returnData = call createMissionLocation;
_randomPos = _returnData select 0;
_randomIndex = _returnData select 1;


diag_log format["WASTELAND SERVER - Side Mission Waiting to run: %1",_missionType];
[sideMissionDelayTime,_randomPos] call createWaitCondition;

diag_log format["WASTELAND SERVER - Side Mission Resumed: %1",_missionType];

[_missionMarkerName,_randomPos,_missionType] call createClientMarker;

//Vehicle Class, Posistion, Fuel, Ammo, Damage
_vehicle = ["C130J_US_EP1",[(_randomPos select 0) + 50, (_randomPos select 1) + 50,0],0,0,1,"NONE"] call createMissionVehicle;

_box = createVehicle ["USLaunchersBox",[(_randomPos select 0), (_randomPos select 1),0],[], 0, "NONE"];
[_box,"mission_Side_USLaunchers"] call fn_refillbox;

_box2 = _nerfBoxes select (random (count _nerfBoxes - 1));
_safePos = [_randomPos, 2, 10, 1, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
[_box2, _safePos] execVM "server\spawning\boxCreation.sqf";   

_picture = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "picture");
_vehicleName = getText (configFile >> "cfgVehicles" >> typeOf _vehicle >> "displayName");
   _war1 = Round (random 100)+2;
_hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Aircraft Mission %6</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>A<t color='%4'> %3</t> has come down under enemy fire!</t>", _missionType, _picture, _vehicleName, sideMissionColor, subTextColor, _war1];
[nil,nil,rHINT,_hint] call RE;

CivGrpS = createGroup civilian;
[CivGrpS,_randomPos] spawn createSmallGroup;

diag_log format["WASTELAND SERVER - Side Mission Waiting to be Finished: %1",_missionType];
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
    if(_currTime - _startTime >= sideMissionTimeout) then {_result = 1;};
    {if((isPlayer _x) AND (_x distance _box <= missionRadiusTrigger)) then {_playerPresent = true};}forEach playableUnits;
    _unitsAlive = ({alive _x} count units CivGrpS);
    (_result == 1) OR ((_playerPresent) AND (_unitsAlive < 1))
};

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _box;
    //deleteVehicle _box2;
    deleteVehicle _vehicle;
    {deleteVehicle _x;}forEach units CivGrps;
    deleteGroup CivGrpS;
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Aircraft Mission %6 Failed</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>Objective failed, better luck next time.</t>", _missionType, _picture, _vehicleName, failMissionColor, subTextColor, _war1];
	[nil,nil,rHINT,_hint] call RE;
    diag_log format["WASTELAND SERVER - Side Mission Failed: %1",_missionType];
} else {
	//Mission Complete.
    deleteVehicle _vehicle;
    deleteGroup CivGrpS;
    _hint = parseText format ["<t align='center' color='%4' shadow='2' size='1.75'>Aircraft Mission %6 Complete</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='%5' size='1.25'>%1</t><br/><t align='center'><img size='5' image='%2'/></t><br/><t align='center' color='%5'>The ammo caches have been collected.</t>", _missionType, _picture, _vehicleName, successMissionColor, subTextColor, _war1];
	[nil,nil,rHINT,_hint] call RE;
    diag_log format["WASTELAND SERVER - Side Mission Success: %1",_missionType];
     //Cash Reward
        _missionRewardRadius =200;
_reward = Round(random 500) +2000;
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