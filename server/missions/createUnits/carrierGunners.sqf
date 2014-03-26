
//Author: Art Vandelay
//Created on: 10/02/2013 


if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4"];

_group = _this select 0;
_pos = _this select 1;

//Leader
_leader = _group createUnit ["Functionary1_EP1", [(_pos select 0) - 10, (_pos select 1) + 8, 15.5], [], 0.5, "FORM"];
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "1Rnd_HE_M203";
_leader addMagazine "1Rnd_HE_M203";
_leader addWeapon "M4A3_RCO_GL_EP1";

//Rifleman
_man2 = _group createUnit ["Functionary2_EP1", [(_pos select 0) - 10, (_pos select 1) + 7, 15.5], [], 0.5, "FORM"];
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "1Rnd_HE_M203";
_man2 addMagazine "1Rnd_HE_M203";
_man2 addWeapon "M4A3_RCO_GL_EP1";

//Sniper
_man3 = _group createUnit ["Woodlander1", [(_pos select 0) - 10, (_pos select 1) + 6, 15.5], [], 0.5, "FORM"];
_man3 addMagazine "5Rnd_762x51_M24";
_man3 addMagazine "5Rnd_762x51_M24";
_man3 addMagazine "5Rnd_762x51_M24";
_man3 addMagazine "5Rnd_762x51_M24";
_man3 addWeapon "M24_des_EP1";

//Support
_man4 = _group createUnit ["Pilot_EP1", [(_pos select 0) - 10, (_pos select 1) + 5, 15.5], [], 0.5, "FORM"];
_man4 addMagazine "100Rnd_762x51_M240";
_man4 addMagazine "100Rnd_762x51_M240";
_man4 addWeapon "Mk_48_DES_EP1";

_leader = leader _group;
_leader setVehicleInit "null = [group this,(getPos this)] execVM 'server\functions\defendCarrier.sqf'";
processInitCommands;
