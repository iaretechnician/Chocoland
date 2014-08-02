//	@file Version: 1.0
//	@file Name: staticHeliCreation.sqf
//	@file Author: [404] Costlyy
//	@file Created: 20/12/2012 21:00
//	@file Description: Random static helis
//	@file Args: [int (0 = not wreck | 1 = wreck), array (position)]

if(!X_Server) exitWith {};

_randomObject = randomVehicleArray  call BIS_fnc_selectRandom; 
_private=["_pos1"];
_pos1=_this;
_pos =[_pos1 select 0,_pos1 select 1,500];
//coroutine
_spawn = createVehicle[_randomObject,_pos,[], 0,"CAN_COLLIDE"];
_spawn setDir 70;
clearMagazineCargoGlobal _spawn;
clearWeaponCargoGlobal _spawn;
 _spawn setFuel (0.50);
  _spawn setDamage (random 0.50);
  _spawn setVehicleAmmo (random 0.90);
 [_spawn] call randomWeapons;
_spawn setVariable["original",1,true];
_spawn setVariable["R3F_LOG_disabled", false, true];
_Parachute = "ParachuteBigWest_EP1" createVehicle position _spawn;
_Parachute setPos (getPos _spawn);
_spawn attachTo [_Parachute,[0,0,-1.5]];
waitUntil {(getPos _spawn select 2) < 2 || !alive _spawn || !alive _Parachute};
deTach _spawn;
// Delete parachute
sleep 1;
deleteVehicle _Parachute;
_spawn setDamage (0.00);
