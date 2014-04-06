
//Author: Art Vandelay
//Created on: 06/02/2013 


if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7","_man8","_man9","_man10","_man11","_man12","_man13","_man14","_man15"];

_group = _this select 0;
_pos = _this select 1;

//Rifleman
_leader = _group createUnit ["Policeman", [(_pos select 0) - 10, (_pos select 1) + 10, 15.5], [], 0.5,"FORM"];
_leader addMagazine "20Rnd_B_AA12_HE";
_leader addMagazine "20Rnd_B_AA12_HE";
_leader addMagazine "20Rnd_B_AA12_HE";
_leader addMagazine "20Rnd_B_AA12_HE";
_leader addWeapon "AA12_PMC";

//Anti Vehicle
_man2 = _group createUnit ["Doctor", [(_pos select 0) - 9, (_pos select 1) + 10, 15.5], [], 0.5, "FORM"];
_man2 addMagazine "SMAW_HEDP";
_man2 addMagazine "SMAW_HEAA";
_man2 addWeapon "SMAW";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addWeapon "M8_carbine";

//Anti Vehicle
_man3 = _group createUnit ["Dr_Hladik_EP1", [(_pos select 0) - 8, (_pos select 1) + 10, 15.5], [], 0.5, "FORM"];
_man3 addMagazine "SMAW_HEDP";
_man3 addMagazine "SMAW_HEAA";
_man3 addWeapon "SMAW";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addWeapon "M8_carbine";

//Support
_man4 = _group createUnit ["Pilot", [(_pos select 0) - 7, (_pos select 1) + 10, 15.5], [], 0.5, "FORM"];
_man4 addMagazine "100Rnd_762x51_M240";
_man4 addMagazine "100Rnd_762x51_M240";
_man4 addWeapon "Mk_48_DES_EP1";

//Support
_man5 = _group createUnit ["Profiteer2_EP1", [(_pos select 0) - 6, (_pos select 1) + 10, 15.5], [], 0.5, "FORM"];
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addWeapon "Mk_48_DES_EP1";

//Sniper
_man6 = _group createUnit ["Woodlander3", [(_pos select 0) - 5, (_pos select 1) + 10, 15.5], [], 0.5, "FORM"];
_man6 addMagazine "5Rnd_762x51_M24";
_man6 addMagazine "5Rnd_762x51_M24";
_man6 addMagazine "5Rnd_762x51_M24";
_man6 addMagazine "5Rnd_762x51_M24";
_man6 addWeapon "M24_des_EP1";

//Rifleman
_man7 = _group createUnit ["Rocker1", [(_pos select 0) - 4, (_pos select 1) + 10, 15.5], [], 0.5, "FORM"];
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addMagazine "30Rnd_556x45_Stanag";
_man7 addMagazine "1Rnd_HE_M203";
_man7 addMagazine "1Rnd_HE_M203";
_man7 addWeapon "M4A3_RCO_GL_EP1";

//Rifleman
_man8 = _group createUnit ["Rocker2", [(_pos select 0) - 3, (_pos select 1) + 10, 15.5], [], 0.5, "FORM"];
_man8 addMagazine "30Rnd_556x45_Stanag";
_man8 addMagazine "30Rnd_556x45_Stanag";
_man8 addMagazine "30Rnd_556x45_Stanag";
_man8 addMagazine "30Rnd_556x45_Stanag";
_man8 addMagazine "30Rnd_556x45_Stanag";
_man8 addMagazine "1Rnd_HE_M203";
_man8 addMagazine "1Rnd_HE_M203";
_man8 addWeapon "M4A3_RCO_GL_EP1";

//Rifleman
_man9 = _group createUnit ["Rocker3", [(_pos select 0) - 2, (_pos select 1) + 10, 15.5], [], 0.5, "FORM"];
_man9 addMagazine "30Rnd_556x45_Stanag";
_man9 addMagazine "30Rnd_556x45_Stanag";
_man9 addMagazine "30Rnd_556x45_Stanag";
_man9 addMagazine "30Rnd_556x45_Stanag";
_man9 addMagazine "30Rnd_556x45_Stanag";
_man9 addMagazine "1Rnd_HE_M203";
_man9 addMagazine "1Rnd_HE_M203";
_man9 addWeapon "M4A3_RCO_GL_EP1";

//Sniper
_man10 = _group createUnit ["Woodlander2", [(_pos select 0) - 1, (_pos select 1) + 10, 15.5], [], 0.5, "FORM"];
_man10 addMagazine "5Rnd_762x51_M24";
_man10 addMagazine "5Rnd_762x51_M24";
_man10 addMagazine "5Rnd_762x51_M24";
_man10 addMagazine "5Rnd_762x51_M24";
_man10 addWeapon "M24_des_EP1";

//Rifleman
_man11 = _group createUnit ["Rocker4", [(_pos select 0) - 10, (_pos select 1) + 9, 15.5], [], 0.5, "FORM"];
_man11 addMagazine "30Rnd_556x45_Stanag";
_man11 addMagazine "30Rnd_556x45_Stanag";
_man11 addMagazine "30Rnd_556x45_Stanag";
_man11 addMagazine "30Rnd_556x45_Stanag";
_man11 addMagazine "30Rnd_556x45_Stanag";
_man11 addMagazine "1Rnd_HE_M203";
_man11 addMagazine "1Rnd_HE_M203";
_man11 addWeapon "M4A3_RCO_GL_EP1";

//Rifleman
_man12 = _group createUnit ["Functionary2_EP1", [(_pos select 0) - 10, (_pos select 1) + 7, 15.5], [], 0.5, "FORM"];
_man12 addMagazine "30Rnd_556x45_Stanag";
_man12 addMagazine "30Rnd_556x45_Stanag";
_man12 addMagazine "30Rnd_556x45_Stanag";
_man12 addMagazine "30Rnd_556x45_Stanag";
_man12 addMagazine "30Rnd_556x45_Stanag";
_man12 addMagazine "1Rnd_HE_M203";
_man12 addMagazine "1Rnd_HE_M203";
_man12 addWeapon "M4A3_RCO_GL_EP1";

//Sniper
_man13 = _group createUnit ["Woodlander1", [(_pos select 0) - 10, (_pos select 1) + 6, 15.5], [], 0.5, "FORM"];
_man13 addMagazine "5Rnd_762x51_M24";
_man13 addMagazine "5Rnd_762x51_M24";
_man13 addMagazine "5Rnd_762x51_M24";
_man13 addMagazine "5Rnd_762x51_M24";
_man13 addWeapon "M24_des_EP1";

//Support
_man14 = _group createUnit ["Pilot_EP1", [(_pos select 0) - 10, (_pos select 1) + 5, 15.5], [], 0.5, "FORM"];
_man14 addMagazine "100Rnd_762x51_M240";
_man14 addMagazine "100Rnd_762x51_M240";
_man14 addWeapon "Mk_48_DES_EP1";

//Leader
_man15 = _group createUnit ["Functionary1_EP1", [(_pos select 0) - 10, (_pos select 1) + 8, 15.5], [], 0.5, "FORM"];
_man15 addMagazine "30Rnd_556x45_Stanag";
_man15 addMagazine "30Rnd_556x45_Stanag";
_man15 addMagazine "30Rnd_556x45_Stanag";
_man15 addMagazine "30Rnd_556x45_Stanag";
_man15 addMagazine "30Rnd_556x45_Stanag";
_man15 addMagazine "1Rnd_HE_M203";
_man15 addMagazine "1Rnd_HE_M203";
_man15 addWeapon "M4A3_RCO_GL_EP1";

[_group,_pos] execVM "server\functions\checkUnitHeight.sqf";

_leader = leader _group;
/*_leader setVehicleInit "nul = [_group,_pos] execVM 'server\functions\defendArea.sqf'";
processInitCommands;

*/