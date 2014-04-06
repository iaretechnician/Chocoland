//	@file Version: 1.0
//	@file Name: spawnRandom.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 28/11/2012 05:19
//	@file Args:
// Edited to HALO/paradrop at random spawns

waituntil {!isnil "bis_fnc_init"};

private ["_townName","_randomLoc","_pos"];

_randomLoc = cityList select (random (count cityList - 1));
_pos = getMarkerPos (_randomLoc select 0);
_pos = [_pos,1,(_randomLoc select 1),1,0,0,0] call BIS_fnc_findSafePos;
_pos = [_pos select 0, _pos select 1, (_pos select 2) + 10];
_pos = [_pos,1,75,1,0,0,0] call BIS_fnc_findSafePos;
_mapside = Round (random 2);
     if(_mapside == 1) then 
     {
          _xCord = Round (random 2000) + 2436.33;
          _yCord = Round (random 1140) + 3501.65;
          _pos = [_xCord, _yCord,0.0014];
     }
     else 
     {
         _xCord = Round (random 1550)+3197.88;
         _yCord = Round (random 1375)+ 2857;
         _pos = [_xCord,_yCord, 0.0014];
     };
player setPos _pos;
		    
    2 cutText ["HALO jump initialized. Use MOUSEWHEEL to open Your parachute!", "PLAIN DOWN", 5];
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

sleep 5;

_mins = floor(60 * (daytime - floor(daytime)));
_townName = _randomLoc select 2;
[
	"Paradropping into",_townName,format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]
] spawn BIS_fnc_infoText;

//Altimeter reading at top right
while {((getposATL player)select 2) > 1} do
{
hintsilent parseText format ["<t align='center' color='#00aa00' font='Zeppelin33' shadow='1' shadowColor='#000000' size='2'>Alt %1m</t>", round (getPosATL player select 2)];
};
if (((getposATL player)select 2) < 1) then
{
hintsilent "";
};