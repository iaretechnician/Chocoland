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
 _mapside = Round (random 2);
     if(_mapside == 1) then 
     {
          _xCord = Round (random 700) + 2896.75;
          _yCord = Round (random 1040) + 3515.77;
          _pos = [_xCord, _yCord,0.0014];
     }
     else 
     {
         _xCord = Round (random 650)+3671.96;
         _yCord = Round (random 980)+ 2915;
         _pos = [_xCord,_yCord, 0.0014];
     };
player setPos _pos;

respawnDialogActive = false;
closeDialog 0;

_mins = floor(60 * (daytime - floor(daytime)));
_townName = _randomLoc select 2;
[
	"404 Wasteland",_townName,format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]
] spawn BIS_fnc_infoText;
