
//Author: Art Vandelay
//Created on: 16/02/2013 


if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_randomVehicle","_vehicle"];

_group = _this select 0;
_pos = _this select 1;

//Leader
_leader = _group createUnit ["Worker1", [(_pos select 0) + 1, (_pos select 1) - 7, 0], [], 0, "FORM"];
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
_leader setIdentity "name4";
//Rifleman
_man2 = _group createUnit ["Worker2", [(_pos select 0) + 1, (_pos select 1) - 8, 0], [], 0, "FORM"];
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "HandGrenade_West";
_man2 addMagazine "HandGrenade_West";
_man2 addWeapon "M8_compact";
_man2 setIdentity "name5";
//Rifleman
_man3 = _group createUnit ["Worker3", [(_pos select 0) + 1, (_pos select 1) - 9, 0], [], 0, "FORM"];
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "HandGrenade_West";
_man3 addMagazine "HandGrenade_West";
_man3 addWeapon "M8_compact";
_man3 setIdentity "name6";
//Random vehicle
//Assign positions and shove them in vehicle
_leader = leader _group;

