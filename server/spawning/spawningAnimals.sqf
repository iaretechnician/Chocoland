
if(!X_Server) exitWith {};
 //berechne marker
_mapside = Round(random 2);
 _xCord = Round (random 500);
_yCord = Round (random 500);
_plusminus=Round(random 2);
_plusminus2=Round(random 2);
_pos=[3710,3606,500];
//mapside 1   
if(_mapside == 1)then{
if(_plusminus == 1)then{_xCord = 3283 + _xCord;}else{_xCord = 3283 - _xCord;};
if(_plusminus2 == 1)then{_yCord=4042 +_yCord;}else{_yCord= 4042 -_yCord;};
_pos=[_xCord,_yCord,500];};
//mapside2
if(_mapside == 2)then{
if(_plusminus == 1)then{_xCord = 2800 + _xCord;};
if(_plusminus2 == 1)then{_yCord=4042 +_yCord;}else{_yCord= 4042 -_yCord;};
_pos=[_xCord,_yCord,500];};
//coroutine
_marray3=["Cow04","Rabbit","Goat"];
_animalClass = _marray3 select (random (count _marray3 - 1));
_spawn=_animalClass createUnit [_pos,EmptyGroup,"",1.0];
_spawn setPos _pos;
_spawn addEventHandler ["Killed", {;null =[this] execVM "server\functions\bomb.sqf";}];
processInitCommands;
 _Parachute = "ParachuteBigWest_EP1" createVehicle position _spawn;
_Parachute setPos (getPos _spawn);
_smoke = "smokeShellpurple" createVehicle position _spawn;
_smoke setPos (getPos _spawn);
_spawn attachTo [_Parachute,[0,0,-1.5]];
_smoke attachTo [_Parachute,[0,0,-1.5]];

waitUntil {(getPos _spawn select 2) < 2};
deTach _spawn;
deleteVehicle _Parachute;
