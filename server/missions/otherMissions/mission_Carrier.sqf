
//Author: Art Vandelay
//Created on: 06/02/2013


//Side Mission Colour = #FFD000 - Yellow 
//Main Mission Colour = #FF8800 - Orange
//World Mission Colour = #0095FF - Blue
//Fail Mission Colour = #FF1717 - Light red
//Fail Mission Colour = #17FF41 - Light green
//Sub Colour = #FFF - White

if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER - Mission Started"];
private ["_unitsAlive","_missionType","_successTextColour","_mainTextColour","_failTextColour","_subTextColour","_missionTimeOut","_missionDelayTime","_missionPlayerRadius","_hint","_startTime","_currTime","_result","_randomPos","_reward","_missonRewardRadius","_centre","_group","_gameLogic","_inArea","_gotLoc","_defendersAlive","_gunnersAlive","_unitHeight","_randomIndex"];

//Mission Initialization.
_result = 0;
_missionType = "Aircraft Carrier";
_mainTextColour = "#0095FF";
_successTextColour = "#17FF41";
_failTextColour = "#FF1717";
_subTextColour = "#FFFFFF";
_missionTimeOut = 1800;
_missionDelayTime = 180;
_missionRewardRadius = 500;
_reward = round(random 500);

_gotLoc = false;
while {!_gotLoc} do 
{
	_randomIndex = random (count CarrierMarkers - 1);

	//If the index of the carrier markers array is false then break the loop and finish up doing the mission
	if (!((CarrierMarkers select _randomIndex) select 1)) then 
	{
		_selectedMarker = CarrierMarkers select _randomIndex select 0;
		_randomPos = getMarkerPos _selectedMarker;
		CarrierMarkers select _randomIndex set[1, true];
		_gotLoc = true;
	};
};

//Ensure the rest of the script doesn't continue until we are done
waitUntil {_gotLoc};

//Tell everyone their will be a mission soon.
_war1 = Round (random 9);
      _war2 = Round (random 9);
        _war3 = Round (random 9);
        _war4 = Round (random 9);
        _war5 = Round (random 9);
        _war1 = _war1 * _war2 * _war3 * _war4 * _war5;
_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Mission %4</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>A naval threat will be in your vicinity within %1 Minutes</t>", _missionDelayTime / 60, _mainTextColour, _subTextColour, _war1];
[nil,nil,rHINT,_hint] call RE;

//Wait till the mission is ready to be ran.
diag_log format["WASTELAND SERVER - Mission Waiting to run"];
_startTime = floor(time);
waitUntil
{ 
	sleep 5;
    _currTime = floor(time);
    if(_currTime - _startTime >= _missionDelayTime) then {_result = 1;};
    (_result == 1)
};
diag_log format["WASTELAND SERVER - Mission Resumed"];
_result = 0;

//Add marker to client marker array.
clientMissionMarkers set [count clientMissionMarkers,["Carrier_Marker",_randomPos,"Aircraft Carrier"]];
publicVariable "clientMissionMarkers";

//Add the fortifications first to (hopefully) prevent floating objects
_base = ["carrierFortifications", 0, _randomPos] execVM "server\functions\createCarrierBase.sqf";
waitUntil{sleep 0.5; scriptDone _base};

sleep 5;

//Spawn in LHD (Aircraft Carrier)
_centre = createCenter sideLogic;
_group = createGroup _centre;
_gameLogic = _group createUnit ["LOGIC", [(_randomPos select 0), (_randomPos select 1), 0], [], 0, "NONE"];
_gameLogic setVehicleInit "_xhandle = [this] execvm 'addons\GLT_LHD\data\init.sqf'";
processInitCommands;

sleep 5;

CivGrpG = createGroup civilian;
null = [CivGrpG,_randomPos]execVM "server\missions\createUnits\carrierGunners.sqf";
waitUntil{sleep 0.5; scriptDone null};

CivGrpM = createGroup civilian;
null = [CivGrpM,_randomPos]execVM "server\missions\createUnits\carrierGroup.sqf";
waitUntil{sleep 0.5; scriptDone null};

_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Mission %4</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>%1</t><br/><t align='center' color='%3'>An Aircraft Carrier is just off shore, destroy the crew and capture it for your team!</t>", _missionType,  _mainTextColour, _subTextColour, _war1];
[nil,nil,rHINT,_hint] call RE;

diag_log format["WASTELAND SERVER - Mission Waiting to be Finished"];
_startTime = floor(time);
_defendersAlive = ({alive _x} count units CivGrpM);
_gunnersAlive = ({alive _x} count units CivGrpG);
_unitsAlive = _defendersAlive + _gunnersAlive;

while {_unitsAlive > 0} do {
	sleep 1;
	_playerPresent = false;
	_currTime = floor(time);
	if (_currTime - _startTime >= _missionTimeOut) then {_result = 1;};
		if (_result == 1) exitWith {};
	_defendersAlive = ({alive _x} count units CivGrpM);
	_gunnersAlive = ({alive _x} count units CivGrpG);
    _unitsAlive = _defendersAlive + _gunnersAlive;
};

if(_result == 1) then
{
	//Mission Failed.
	{deleteVehicle _x} foreach nearestObjects [_randomPos, [], 125] - nearestObjects [_randomPos, ["allVehicles"], 125];
	deleteVehicle _gameLogic;
    {_x setDamage 1} forEach units CivGrpM;
    deleteGroup CivGrpM;
	{_x setDamage 1} forEach units CivGrpG;
	deleteGroup CivGrpG;
	deleteMarkerLocal "patrolCarrier";
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Mission %4 failed</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%2' size='1.25'>%1</t><br/><t align='center' color='%3'>The Aircraft Carrier has left your vicinity.</t>", _missionType, _failTextColour, _subTextColour, _war1];
	[nil,nil,rHINT,_hint] call RE;
    diag_log format["WASTELAND SERVER - Mission Failed"];
	
	//Reset carrier marker
	CarrierMarkers select _randomIndex set[1, false]; 
} else {
	//Mission Complete.
	deleteVehicle _gameLogic;
    deleteGroup CivGrpM;
	deleteGroup CivGrpG;
	deleteMarkerLocal "patrolCarrier";
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Mission %6 captured</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3' size='1.25'>%1</t><br/><t align='center' color='%3'>The crew of the Aircraft Carrier have been decimated!</t><br/><t align'center' color='%4'>Reward: %5</t>", _missionType, _successTextColour, _subTextColour, _mainTextColour, _reward, _war1];
	[nil,nil,rHINT,_hint] call RE;
    diag_log format["WASTELAND SERVER - Mission Finished"];
	
	//Cash Reward
	_inArea = _randomPos nearEntities _missionRewardRadius;
	{
	if (isPlayer _x) then {
	player setVariable["cmoney", (player getVariable "cmoney")+_reward,true];
	};
	} forEach _inArea;
	
	//Add one to carrier count to limit the amount that spawn
	CarrierCount = CarrierCount + 1;
};

//Remove marker from client marker array
{
    if(_x select 0 == "Carrier_Marker") then
    {
    	clientMissionMarkers set [_forEachIndex, "REMOVETHISCRAP"];
		clientMissionMarkers = clientMissionMarkers - ["REMOVETHISCRAP"];
        publicVariable "clientMissionMarkers";    
    };
}forEach clientMissionMarkers;
worldMissionRunning = false;






