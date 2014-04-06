
//Author: Art Vandelay
//Created on: 15/02/2013


//Side Mission Colour = #FFD000 - Yellow 
//Main Mission Colour = #FF8800 - Orange
//World Mission Colour = #0095FF - Blue
//Fail Mission Colour = #FF1717 - Light red
//Fail Mission Colour = #17FF41 - Light green
//Sub Colour = #FFF - White

if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER - Mission Started"];
private ["_unitsAlive","_missionType","_successTextColour","_mainTextColour","_failTextColour","_subTextColour","_missionTimeOut","_missionDelayTime","_missionPlayerRadius","_hint","_startTime","_currTime","_result","_randomPos","_reward","_missonRewardRadius","_centre","_group","_gameLogic","_inArea","_gotLoc","_defendersAlive","_gunnersAlive","_unitHeight","_randomIndex","_marker_UPS","_removeCity1","_removeCity2","_removeCity3","_randomVehicle","_vehicle","_box","_upsPos"];

//Mission Initialization.
_result = 0;
_missionType = "Invasion";
_mainTextColour = "#0095FF";
_successTextColour = "#17FF41";
_failTextColour = "#FF1717";
_subTextColour = "#FFFFFF";
_missionTimeOut = 60;
_missionDelayTime = 180; //2700
_missionRewardRadius = 1500;
_reward = ceil(random 10000) + 5000;

_invasionArray = ["carrier_1","carrier_2","carrier_4","carrier_6","carrier_8","carrier_3","carrier_5","carrier_7"];
				
_selectMarker = _invasionArray call BIS_fnc_selectRandom;
_randomPos = getMarkerPos _selectMarker;
_smoke = createVehicle ["smokeShellred",_randomPos,[],1,"FLY"];
_smoke setPos _randomPos;
sleep 10;

//Tell everyone their will be an invasion soon

    _war1 = Round (random 10);
_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Invasion %4</t><br/><t align='center' color='%2'>------------------------------</t><br/><t color='%3' size='1.0'>A large enemy force is just off shore. Reconnaissance suggests the invasion will begin in approximately %1 Minutes</t>", _missionDelayTime / 60, _mainTextColour, _subTextColour, _war4];
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

_marker_UPS = createMarkerLocal ["UPS", _randomPos];
"UPS" setMarkerShapeLocal "Rectangle";
"UPS" setMarkerSizeLocal [270, 270];

//Create Units
FireTeamA = createGroup civilian;
[FireTeamA,_randomPos] execVM "server\missions\createUnits\fireTeamA.sqf";
{
_unit = _x;
_unit disableAI "TARGET"; //Disable the "running away from the object and hunting down enemies" behaviour.
_unit setskill ["Spotdistance", 1];
_unit setskill ["general", (0.3)];
_unit setskill ["courage", 1];
_unit setskill ["endurance", 1];
_unit setskill ["spotTime", 0.1];
_unit setskill ["aimingShake", 0.5];
_unit setskill ["aimingSpeed", 0.1];
_unit setskill ["reloadSpeed", 0.4];
_unit setskill ["aimingAccuracy",0.1];
}forEach units FireTeamA;

FireTeamB = createGroup civilian;
[FireTeamB,_randomPos] execVM "server\missions\createUnits\fireTeamB.sqf";
_unit = _x;
_unit disableAI "TARGET"; //Disable the "running away from the object and hunting down enemies" behaviour.
_unit setskill ["Spotdistance", 1];
_unit setskill ["general", (0.3)];
_unit setskill ["courage", 1];
_unit setskill ["endurance", 1];
_unit setskill ["spotTime", 0.1];
_unit setskill ["aimingShake", 0.5];
_unit setskill ["aimingSpeed", 0.1];
_unit setskill ["reloadSpeed", 0.4];
_unit setskill ["aimingAccuracy",0.1];
}forEach units FireTeamB;
FireTeamC = createGroup civilian;
[FireTeamC,_randomPos] execVM "server\missions\createUnits\fireTeamC.sqf";
_unit = _x;
_unit disableAI "TARGET"; //Disable the "running away from the object and hunting down enemies" behaviour.
_unit setskill ["Spotdistance", 1];
_unit setskill ["general", (0.3)];
_unit setskill ["courage", 1];
_unit setskill ["endurance", 1];
_unit setskill ["spotTime", 0.1];
_unit setskill ["aimingShake", 0.5];
_unit setskill ["aimingSpeed", 0.1];
_unit setskill ["reloadSpeed", 0.4];
_unit setskill ["aimingAccuracy",0.1];
}forEach units FireTeamC;
FireTeamD = createGroup civilian;
[FireTeamD,_randomPos] execVM "server\missions\createUnits\fireTeamD.sqf";
_unit = _x;
_unit disableAI "TARGET"; //Disable the "running away from the object and hunting down enemies" behaviour.
_unit setskill ["Spotdistance", 1];
_unit setskill ["general", (0.3)];
_unit setskill ["courage", 1];
_unit setskill ["endurance", 1];
_unit setskill ["spotTime", 0.1];
_unit setskill ["aimingShake", 0.5];
_unit setskill ["aimingSpeed", 0.1];
_unit setskill ["reloadSpeed", 0.4];
_unit setskill ["aimingAccuracy",0.1];
}forEach units FireTeamD;
FireTeamE = createGroup civilian;
[FireTeamE,_randomPos] execVM "server\missions\createUnits\fireTeamE.sqf";
_unit = _x;
_unit disableAI "TARGET"; //Disable the "running away from the object and hunting down enemies" behaviour.
_unit setskill ["Spotdistance", 1];
_unit setskill ["general", (0.3)];
_unit setskill ["courage", 1];
_unit setskill ["endurance", 1];
_unit setskill ["spotTime", 0.1];
_unit setskill ["aimingShake", 0.5];
_unit setskill ["aimingSpeed", 0.1];
_unit setskill ["reloadSpeed", 0.4];
_unit setskill ["aimingAccuracy",0.1];
}forEach units FireTeamE;
GroundSupport = createGroup civilian;
[GroundSupport,_randomPos] execVM "server\missions\createUnits\groundSupport.sqf";
_unit = _x;
_unit disableAI "TARGET"; //Disable the "running away from the object and hunting down enemies" behaviour.
_unit setskill ["Spotdistance", 1];
_unit setskill ["general", (0.3)];
_unit setskill ["courage", 1];
_unit setskill ["endurance", 1];
_unit setskill ["spotTime", 0.1];
_unit setskill ["aimingShake", 0.5];
_unit setskill ["aimingSpeed", 0.1];
_unit setskill ["reloadSpeed", 0.4];
_unit setskill ["aimingAccuracy",0.1];
}forEach units GroundSupport;
AirSupport = createGroup civilian;
[AirSupport, _randomPos] execVM "server\missions\createUnits\airSupport.sqf";
_unit = _x;
_unit disableAI "TARGET"; //Disable the "running away from the object and hunting down enemies" behaviour.
_unit setskill ["Spotdistance", 1];
_unit setskill ["general", (0.3)];
_unit setskill ["courage", 1];
_unit setskill ["endurance", 1];
_unit setskill ["spotTime", 0.1];
_unit setskill ["aimingShake", 0.5];
_unit setskill ["aimingSpeed", 0.1];
_unit setskill ["reloadSpeed", 0.4];
_unit setskill ["aimingAccuracy",0.1];
}forEach units AirSupport;
//Wait 5 for units to start patrolling and for the air support to take off
sleep 5;

//Add marker to client marker array.
clientMissionMarkers set [count clientMissionMarkers,["Invasion_Marker",_randomPos,"Invasion!"]];
publicVariable "clientMissionMarkers";

//Announce the invasion to clients
_hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Mission %4</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3'>The invasion has begun! Destroy the enemy force at the marked city!</t>", _missionType,  _mainTextColour, _subTextColour, _war4];
[nil,nil,rHINT,_hint] call RE;
diag_log format["WASTELAND SERVER - Mission Waiting to be Finished"];
_startTime = floor(time);
_fireTeamA_alive = ({alive _x} count units FireTeamA);
_fireTeamB_alive = ({alive _x} count units FireTeamB);
_fireTeamC_alive = ({alive _x} count units FireTeamC);
_fireTeamD_alive = ({alive _x} count units FireTeamD);
_fireTeamE_alive = ({alive _x} count units FireTeamE);
_groundSupportAilve = ({alive _x} count units GroundSupport);
_airSupportAlive = ({alive _x} count units AirSupport);
_unitsAlive = _fireTeamA_alive + _fireTeamB_alive + _fireTeamC_alive + _fireTeamD_alive + _fireTeamE_alive + _groundSupportAilve + _airSupportAlive;

while {_unitsAlive > 0} do 
{
	sleep 1;
	_currTime = floor(time);
	if (_currTime - _startTime >= _missionTimeOut) then {_result = 1;};
		if (_result == 1) exitWith {};
	_fireTeamA_alive = ({alive _x} count units FireTeamA);
	_fireTeamB_alive = ({alive _x} count units FireTeamB);
	_fireTeamC_alive = ({alive _x} count units FireTeamC);
	_fireTeamD_alive = ({alive _x} count units FireTeamD);
	_fireTeamE_alive = ({alive _x} count units FireTeamE);
	_groundSupportAilve = ({alive _x} count units GroundSupport);
	_airSupportAlive = ({alive _x} count units AirSupport);
	_unitsAlive = _fireTeamA_alive + _fireTeamB_alive + _fireTeamC_alive + _fireTeamD_alive + _fireTeamE_alive + _groundSupportAilve + _airSupportAlive;
};

_vehicle setVehicleLock "UNLOCKED";
_vehicle setVariable ["R3F_LOG_disabled", false, true];

if(_result == 1) then
{
	//Mission Failed.
	deleteMarkerLocal "UPS";
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Invasion Successful</t>", _missionType, _failTextColour, _subTextColour];
	[nil,nil,rHINT,_hint] call RE;
	sleep 20;
	

{_x spawn{_this setDamage 1; sleep 3; hidebody _this; sleep 3; deleteVehicle _this;};
}forEach units FireTeamA;

{_x spawn{_this setDamage 1; sleep 3; hidebody _this; sleep 3; deleteVehicle _this;};
}forEach units FireTeamB;

{_x spawn{_this setDamage 1; sleep 3; hidebody _this; sleep 3; deleteVehicle _this;};
}forEach units FireTeamC;

{_x spawn{_this setDamage 1; sleep 3; hidebody _this; sleep 3; deleteVehicle _this;};
}forEach units FireTeamD;

{_x spawn{_this setDamage 1; sleep 3; hidebody _this; sleep 3; deleteVehicle _this;};
}forEach units FireTeamE;

{_x spawn{_this setDamage 1; sleep 3; hidebody _this; sleep 3; deleteVehicle _this;};
}forEach units GroundSupport;

{_x spawn{_this setDamage 1; sleep 3; hidebody _this; sleep 3; deleteVehicle _this;};
}forEach units AirSupport;
	
    diag_log format["WASTELAND SERVER - Mission Failed"];
	
	
} else {
	//Mission Complete.
	deleteMarkerLocal "UPS";
    deleteGroup FireTeamA;
	deleteGroup FireTeamB;
	deleteGroup FireTeamC;
	deleteGroup FireTeamD;
	deleteGroup FireTeamE;
	deleteGroup GroundSupport;
	deleteGroup AirSupport;
    _hint = parseText format ["<t align='center' color='%2' shadow='2' size='1.75'>Invasion halted</t><br/><t align='center' color='%2'>------------------------------</t><br/><t align='center' color='%3'>The enemy force were destroyed! Well done!</t><br/><t align'center' color='%4'>Reward: %5</t>", _missionType, _successTextColour, _subTextColour, _mainTextColour, _reward];
	[nil,nil,rHINT,_hint] call RE;
    diag_log format["WASTELAND SERVER - Mission Finished"];
	
	//Cash Reward
	_inArea = _randomPos nearEntities _missionRewardRadius;
	{
	if (isPlayer _x) then {
	player setVariable["cmoney", (player getVariable "cmoney")+ _reward, true];
	};
	} forEach _inArea;
	
};

//Remove marker from client marker array
{
    if(_x select 0 == "Invasion_Marker") then
    {
    	clientMissionMarkers set [_forEachIndex, "REMOVETHISCRAP"];
		clientMissionMarkers = clientMissionMarkers - ["REMOVETHISCRAP"];
        publicVariable "clientMissionMarkers";    
    };
} forEach clientMissionMarkers;
sleep 300;
worldMissionRunning = false;