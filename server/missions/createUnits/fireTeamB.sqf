
//Author: Art Vandelay
//Created on: 16/02/2013 


if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5"];

_group = _this select 0;
_pos = _this select 1;

//Leader (Sniper)
_leader = _group createUnit ["Doctor", [_pos select 0, _pos select 1, 0], [], 0, "FORM"];
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
_leader addWeapon "DMR";

//Rifleman
_man2 = _group createUnit ["TK_CIV_Takistani01_EP1", [(_pos select 0) + 6, _pos select 1, 0], [], 0, "FORM"];
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "1Rnd_HE_M203";
_man2 addMagazine "1Rnd_HE_M203";
_man2 addMagazine "1Rnd_Smoke_M203";
_man2 addWeapon "SCAR_L_CQC_EGLM_Holo";

//Rifleman
_man3 = _group createUnit ["TK_CIV_Takistani04_EP1", [(_pos select 0) + 7, _pos select 1, 0], [], 0, "FORM"];
_man3 addMagazine "20Rnd_762x51_B_SCAR";
_man3 addMagazine "20Rnd_762x51_B_SCAR";
_man3 addMagazine "20Rnd_762x51_B_SCAR";
_man3 addMagazine "20Rnd_762x51_B_SCAR";
_man3 addMagazine "1Rnd_HE_M203";
_man3 addMagazine "1Rnd_HE_M203";
_man3 addMagazine "1Rnd_Smoke_M203";
_man3 addWeapon "SCAR_H_STD_EGLM_Spect";

//Rifleman
_man4 = _group createUnit ["TK_CIV_Takistani05_EP1", [(_pos select 0) + 8, _pos select 1, 0], [], 0, "FORM"];
_man4 addMagazine "20Rnd_762x51_B_SCAR";
_man4 addMagazine "20Rnd_762x51_B_SCAR";
_man4 addMagazine "20Rnd_762x51_B_SCAR";
_man4 addMagazine "20Rnd_762x51_B_SCAR";
_man4 addMagazine "HandGrenade_West";
_man4 addMagazine "HandGrenade_West";
_man4 addMagazine "HandGrenade_West";
_man4 addMagazine "HandGrenade_West";
_man4 addWeapon "SCAR_H_CQC_CCO";

//Support
_man5 = _group createUnit ["TK_CIV_Takistani06_EP1", [(_pos select 0) + 9, _pos select 1, 0], [], 0, "FORM"];
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addWeapon "m240_scoped_EP1";

_leader = leader _group;
_leader setVehicleInit "null = [this,'UPS','random','nowait'] execVM 'addons\scripts\UPSMON.sqf'";
processInitCommands;

