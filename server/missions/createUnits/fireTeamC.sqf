
//Author: Art Vandelay
//Created on: 16/02/2013 


if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5"];

_group = _this select 0;
_pos = _this select 1;

//Leader (Anti Ground)
_leader = _group createUnit ["Policeman", [_pos select 0, (_pos select 1) - 1, 0], [], 0, "FORM"];
_leader addMagazine "Javelin";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addMagazine "30Rnd_556x45_Stanag";
_leader addWeapon "M4A1_Aim_camo";
_leader addWeapon "Javelin";

//Anti Ground
_man2 = _group createUnit ["Pilot_EP1", [_pos select 0, (_pos select 1) - 2, 0], [], 0, "FORM"];
_man2 addMagazine "Javelin";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addMagazine "30Rnd_556x45_Stanag";
_man2 addWeapon "M4A1_Aim";
_man2 addWeapon "Javelin";

//Anti Air
_man3 = _group createUnit ["Functionary2_EP1", [_pos select 0, (_pos select 1) - 3, 0], [], 0, "FORM"];
_man3 addMagazine "Stinger";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addWeapon "M4A3_CCO_EP1";
_man3 addWeapon "Stinger";

//Anti Air
_man4 = _group createUnit ["Woodlander1", [_pos select 0, (_pos select 1) - 4, 0], [], 0, "FORM"];
_man4 addMagazine "Stinger";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addWeapon "M4A3_CCO_EP1";
_man4 addWeapon "Stinger";

//Support
_man5 = _group createUnit ["SchoolTeacher", [_pos select 0, (_pos select 1) - 5, 0], [], 0, "FORM"];
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addMagazine "100Rnd_762x51_M240";
_man5 addWeapon "Mk_48_DES_EP1";

_leader = leader _group;
//_leader setVehicleInit "null = [this,'UPS','random','nowait'] execVM 'addons\scripts\UPSMON.sqf'";
processInitCommands;

