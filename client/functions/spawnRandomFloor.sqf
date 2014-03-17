//	@file Version: 1.0
//	@file Name: spawnRandom.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19
//	@file Args:

waituntil {!isnil "bis_fnc_init"};

private ["_townName","_randomLoc","_pos"];

_randomLoc = cityList select (random (count cityList - 1));

_pos = getMarkerPos (_randomLoc select 0);
_pos = [_pos,1,(_randomLoc select 1),1,0,0,0] call BIS_fnc_findSafePos;
_pos = [_pos select 0, _pos select 1, (_pos select 2) + 10];
player setPos _pos;

respawnDialogActive = false;
closeDialog 0;

_mins = floor(60 * (daytime - floor(daytime)));
_townName = _randomLoc select 2;
[
	"MG Wasteland",_townName,format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]
] spawn BIS_fnc_infoText;

// Check if database loads a spawnposition above 5 meters off ground and if player is losing altitude (falling to death).
// Initializing a paradrop at low altitude (100meters) for safe spawning.
sleep 0.5;
_pAlt = ((getposATL player) select 2);
_pVelZ = (velocity player select 2);
if ((_pAlt > 5) && (_pVelZ < 0)) then {
	_chute = "ParachuteG" createVehicle (position player);
	_chute setPosATL [getPosATL player select 0, getPosATL player select 1, 100];
	sleep 0.1;
	player moveInDriver _chute;
	2 cutText ["You logged off mid air. Low altitude paradrop initialized.", "PLAIN DOWN", 2];
		//Force 3rd person view for 5 seconds
		firstperson_allowed = false;
		while {not firstperson_allowed} do {
		if(cameraView == "INTERNAL" || cameraView == "GROUP") then {
			vehicle player switchCamera "EXTERNAL";};
		sleep 5; firstperson_allowed = true;};
	};
/*
ParachuteG - Guerilla
ParachuteC - Civilian
*/