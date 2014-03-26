
//Author: Art Vandelay
//Created on: 16/02/2013 


if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_randomVehicle","_vehicle"];

_group = _this select 0;
_pos = _this select 1;

//Leader
_leader = _group createUnit ["TK_CIV_Takistani03_EP1", [(_pos select 0) + 2, (_pos select 1) - 1, 0], [], 0, "FORM"];
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "SmokeShell";
_leader addMagazine "SmokeShellBlue";
_leader addMagazine "SmokeShellOrange";
_leader addMagazine "SmokeShellPurple";
_leader addMagazine "HandGrenade_West";
_leader addMagazine "HandGrenade_West";
_leader addWeapon "M8_compact";

//Rifleman
_man2 = _group createUnit ["TK_CIV_Takistani05_EP1", [(_pos select 0) + 2, (_pos select 1) - 2, 0], [], 0, "FORM"];
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "HandGrenade_West";
_man2 addMagazine "HandGrenade_West";
_man2 addWeapon "M8_compact";

//Random vehicle
_randomVehicle = ["AH1Z", "AH64D", "Mi24_P"] call BIS_fnc_selectRandom;
_vehicle = createVehicle [_randomVehicle, [(_pos select 0) + 20, (_pos select 1) + 20, 0], [], 0, "FORM"];
_vehicle setVehicleInit "this addAction [('<t color=''#00EEFF''>') + ('HALO Jump') + '</t>','addons\haloJump\haloJump.sqf',[],7,false,true,'','player in _target']";
processInitCommands;

//Assign positions and shove them in vehicle
_leader = leader _group;
_leader assignAsDriver _vehicle;
[_leader] orderGetIn true;
sleep 0.2;
_leader moveInDriver _vehicle;

_man2 assignAsGunner _vehicle;
[_man2] orderGetIn true;
sleep 0.2;
_man2 moveInGunner _vehicle;


_leader setVehicleInit "null = [this,'UPS','nowait'] execVM 'addons\scripts\UPSMON.sqf'";
processInitCommands;