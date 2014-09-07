if(!isServer) exitwith {};
#include "setup.sqf"
private ["_result","_missionMarkerName","_missionType","_startTime","_returnData","_randomPos","_randomIndex","_vehicleClass","_vehicle","_picture","_vehicleName","_hint","_currTime","_playerPresent","_unitsAlive"];
_result = 0;
_zeit =0;
_pl= playableunits call BIS_fnc_selectRandom;
_range = [1, 1000] call BIS_fnc_randomNum;
_direction = [1, 359] call BIS_fnc_randomNum;
_randomPos = [_pl,_range,_direction] call BIS_fnc_relPos;
_randomPos = [_randompos select 0,_randompos select 1, 150];
//vehicle
_random1 = floor(random 10);
if (_random1 == 9)then {_vehicleClass = randomVehicleArray call BIS_fnc_selectRandom;
_vehicle2 = [_vehicleClass,_randomPos,0,1,0.75,"NONE"] call createMissionVehicle;[_vehicle2]execVM"server\spawning\parachute.sqf";};
_vehicleClass = randomVehicleArray call BIS_fnc_selectRandom;
_vehicle = [_vehicleClass,_randomPos,0,1,0.75,"NONE"] call createMissionVehicle;[_vehicle]execVM"server\spawning\parachute.sqf";
//npcs
_random2 = floor(random 3);
switch(_random2) do 
{
	case 0: // Weapons button pressed.
	{           CivGrpM = createGroup civilian;[CivGrpM,_randomPos] spawn createSmallGroup;        };
        case 1: // Weapons button pressed.
	{           CivGrpM = createGroup civilian;[CivGrpM,_randomPos] spawn createLargeGroup;        };
        case 2: // Weapons button pressed.
	{           CivGrpM = createGroup civilian;[CivGrpM,_randomPos] spawn createMidGroup;        };
};
//gunbox
_random3 = floor(random 100);
if (_random3 > 75)then{_nerfBoxes = ["basicUS","basicUS2","basicRU","basicRU2","basicGER","basicPMC","basicSpecial","basicSpecial2","basicSpecial3"]; 
_random33=floor (random 100);if(_random33 >90)then{_currBox = _nerfBoxes call BIS_fnc_selectRandom;[_currBox, _randomPos] execVM "server\spawning\boxCreation.sqf";};

 _currBox = _nerfBoxes call BIS_fnc_selectRandom;[_currBox, _randomPos,1] execVM "server\spawning\boxCreation.sqf"; 
};
//composition
_random4 = floor(random 100);
_objects = nearestObjects [_randomPos, ["ALL"], 100]; 
if(_random4 >90 && count _objects < 5)then{_currCompo =nerfcompo call BIS_fnc_selectRandom;_newComp = [[_randompos select 0,_randompos select 1,0], 0, _currCompo] call (compile (preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf"));};

waitUntil
{
    sleep 1; 
	_playerPresent = false;
	
    if(_zeit >= 240) then {_result = 1;};_zeit = _zeit +1;
    {if((isPlayer _x) AND (_x distance _vehicle <= 10)) then {_playerPresent = true};}forEach playableUnits;
    _unitsAlive = ({alive _x} count units CivGrpM);
    (_result == 1) OR ((_playerPresent))
};

if(_result == 1) then
{
	//Mission Failed.
    deleteVehicle _vehicle;
       deleteVehicle _vehicle2;
    {deleteVehicle _x;}forEach units CivGrpM;
    deleteGroup CivGrpM;
   } else {
       //Cash Reward
        _missionRewardRadius =150;
_reward = floor(random 10000) +4000;
_randomPos = getpos _vehicle;
	_inArea = _randomPos nearEntities _missionRewardRadius;
	{
	if (isPlayer _x) then {
     [nil,_x, "loc", rEXECVM, "client\functions\missionReward.sqf", "reward", _war1, _reward] call RE;
	};
	} forEach _inArea;
    deleteGroup CivGrpM;
   
};
