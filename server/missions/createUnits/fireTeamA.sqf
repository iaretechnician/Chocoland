
//Author: Art Vandelay
//Created on: 16/02/2013 


if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5"];

_group = _this select 0;
_pos = _this select 1;

//Leader
_leader = _group createUnit ["Functionary1_EP1", [(_pos select 0) + 1, _pos select 1, 0], [], 0, "FORM"];
_leader addMagazine "20Rnd_762x51_DMR";
_leader addMagazine "20Rnd_762x51_DMR";
_leader addMagazine "20Rnd_762x51_DMR";
_leader addMagazine "20Rnd_762x51_DMR";
_leader addMagazine "SmokeShell";
_leader addMagazine "SmokeShellBlue";
_leader addMagazine "SmokeShellOrange";
_leader addMagazine "SmokeShellPurple";
_leader addMagazine "HandGrenade_West";
_leader addMagazine "HandGrenade_West";
_leader addWeapon "M14_EP1";
_leader setIdentity "name3";
//Rifleman
_man2 = _group createUnit ["CIV_EuroMan01_EP1", [(_pos select 0) + 2, _pos select 1, 0], [], 0, "FORM"];
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "1Rnd_HE_M203";
_man2 addMagazine "1Rnd_HE_M203";
_man2 addMagazine "1Rnd_Smoke_M203";
_man2 addWeapon "M16A4_ACG_GL";
_man2 setIdentity "name4";
//Rifleman
_man3 = _group createUnit ["CIV_EuroMan02_EP1", [(_pos select 0) + 3, _pos select 1, 0], [], 0, "FORM"];
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "1Rnd_HE_M203";
_man3 addMagazine "1Rnd_HE_M203";
_man3 addMagazine "1Rnd_Smoke_M203";
_man3 addWeapon "M4A1_HWS_GL_camo";
_man3 setIdentity "name5";
//Sniper
_man4 = _group createUnit ["Profiteer2_EP1", [(_pos select 0) + 4, _pos select 1, 0], [], 0, "FORM"];
_man4 addMagazine "20rnd_762x51_B_SCAR";
_man4 addMagazine "20rnd_762x51_B_SCAR";
_man4 addMagazine "20rnd_762x51_B_SCAR";
_man4 addMagazine "20rnd_762x51_B_SCAR";
_man4 addWeapon "SCAR_H_LNG_Sniper";
_man4 setIdentity "name6";
//Support
_man5 = _group createUnit ["Pilot", [(_pos select 0) + 5, _pos select 1, 0], [], 0, "FORM"];
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addWeapon "Mk_48_DES_EP1";
_man5 setIdentity "name7";
_leader = leader _group;
//_leader setVehicleInit "null = [this,'UPS','random','nowait'] execVM 'addons\scripts\UPSMON.sqf'";
