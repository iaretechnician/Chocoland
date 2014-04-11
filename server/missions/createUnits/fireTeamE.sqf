
//Author: Art Vandelay
//Created on: 16/02/2013 


if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5"];

_group = _this select 0;
_pos = _this select 1;

//Leader (Sniper)
_leader = _group createUnit ["Villager1", [(_pos select 0) + 1, (_pos select 1) - 2, 0], [], 0, "FORM"];
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
_leader setIdentity "name23";
//Rifleman
_man2 = _group createUnit ["Villager2", [(_pos select 0) + 1, (_pos select 1) - 3, 0], [], 0, "FORM"];
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "1Rnd_HE_M203";
_man2 addMagazine "1Rnd_HE_M203";
_man2 addMagazine "1Rnd_Smoke_M203";
_man2 addWeapon "SCAR_L_CQC_EGLM_Holo";
_man2 setIdentity "name24";
//Rifleman
_man3 = _group createUnit ["Villager3", [(_pos select 0) + 1, (_pos select 1) - 4, 0], [], 0, "FORM"];
_man3 addMagazine "20Rnd_762x51_B_SCAR";
_man3 addMagazine "20Rnd_762x51_B_SCAR";
_man3 addMagazine "20Rnd_762x51_B_SCAR";
_man3 addMagazine "20Rnd_762x51_B_SCAR";
_man3 addMagazine "1Rnd_HE_M203";
_man3 addMagazine "1Rnd_HE_M203";
_man3 addMagazine "1Rnd_Smoke_M203";
_man3 addWeapon "SCAR_H_STD_EGLM_Spect";
_man3 setIdentity "name1";
//Rifleman
_man4 = _group createUnit ["Villager4", [(_pos select 0) + 1, (_pos select 1) - 5, 0], [], 0, "FORM"];
_man4 addMagazine "20Rnd_762x51_B_SCAR";
_man4 addMagazine "20Rnd_762x51_B_SCAR";
_man4 addMagazine "20Rnd_762x51_B_SCAR";
_man4 addMagazine "20Rnd_762x51_B_SCAR";
_man4 addMagazine "HandGrenade_West";
_man4 addMagazine "HandGrenade_West";
_man4 addMagazine "HandGrenade_West";
_man4 addMagazine "HandGrenade_West";
_man4 addWeapon "SCAR_H_CQC_CCO";
_man4 setIdentity "name2";
//Support
_man5 = _group createUnit ["TK_CIV_Takistani02_EP1", [(_pos select 0) + 1, (_pos select 1) - 6, 0], [], 0, "FORM"];
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addWeapon "m240_scoped_EP1";
_man5 setIdentity "name3";
_leader = leader _group;
//_leader setVehicleInit "null = [this,'UPS','random','nowait'] execVM 'addons\scripts\UPSMON.sqf'";
processInitCommands;
