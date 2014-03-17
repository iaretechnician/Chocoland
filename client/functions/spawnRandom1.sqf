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
_pos = [_pos,1,75,1,0,0,0] call BIS_fnc_findSafePos;
player setPos _pos;
   player allowdamage false;
   2 cutText ["SUICIDE HALO JUMP INITIALIZED. OPEN YOUR PARACHUTE AT THE GROUND!", "PLAIN DOWN", 5];
	player setPos [_pos select 0, _pos select 1, 1000]; // Stop the player appearing on the ground for a split second before the HALO 
  [player, 1000] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";   

   respawnDialogActive = false;
  

	closeDialog 0;
//Force 3rd person view at spawning
firstperson_allowed = false;
while {not firstperson_allowed} do {

	if(cameraView == "INTERNAL" || cameraView == "GROUP") then {
		vehicle player switchCamera "EXTERNAL";
	};

	sleep 0.1;
  firstperson_allowed = true;
};

sleep 25;
 2 cutText ["NOW OPEN PARACHUTE 3 SECONDS REMAIN", "PLAIN DOWN", 5];
 sleep 15;
 player setDamage 0;
 player allowdamage true;

_mins = floor(60 * (daytime - floor(daytime)));
_townName = _randomLoc select 2;
[
	"Chocoland","Suicide",format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]
] spawn BIS_fnc_infoText;


