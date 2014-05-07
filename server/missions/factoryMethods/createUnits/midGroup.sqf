//	@file Version: 1.0
//	@file Name: midGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7"];

_group = _this select 0;
_pos = _this select 1;

//Anti Vehicle
_leader = _group createunit ["Priest", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_leader addMagazine "PG7V";
_leader addMagazine "PG7V";
_leader addMagazine "PG7V";
_leader addWeapon "RPG7V";
_leader addMagazine "30Rnd_545x39_AK";
_leader addMagazine "30Rnd_545x39_AK";
_leader addMagazine "30Rnd_545x39_AK";
_leader addMagazine "30Rnd_545x39_AK";
_leader addMagazine "30Rnd_545x39_AK";
_leader addWeapon "AKS_74_U";
_leader setskill ["aimingAccuracy",0.5];
_leader setIdentity "name17";
_leader disableAI "MOVE";
//Support
_man2 = _group createunit ["CIV_EuroMan02_EP1", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addWeapon "RPK_74";
_man2 setskill ["aimingAccuracy",0.5];
_man2 setIdentity "name18";
_man2 disableAI "MOVE";
//Rifle_man
_man3 = _group createunit ["CIV_EuroMan01_EP1", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addWeapon "AK_47_M";
_man3 setskill ["aimingAccuracy",0.5];
_man3 setIdentity "name19";
_man3 disableAI "MOVE";
//Rifle_man
_man4 = _group createunit ["RU_Citizen1", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addWeapon "AK_47_M";
_man4 setskill ["aimingAccuracy",0.5];
_man4 setIdentity "name20";
_man4 disableAI "MOVE";
//Rifle_man
_man5 = _group createunit ["Rocker1", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
_man5 addMagazine "30Rnd_762x39_AK47";
_man5 addMagazine "30Rnd_762x39_AK47";
_man5 addMagazine "30Rnd_762x39_AK47";
_man5 addMagazine "30Rnd_762x39_AK47";
_man5 addMagazine "30Rnd_762x39_AK47";
_man5 addWeapon "AK_47_M";
_man5 setskill ["aimingAccuracy",0.5];
_man5 setIdentity "name21";
_man5 disableAI "MOVE";
//Sniper
_man6 = _group createunit ["Rocker2", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
_man6 addMagazine "10Rnd_762x54_SVD";
_man6 addMagazine "10Rnd_762x54_SVD";
_man6 addMagazine "10Rnd_762x54_SVD";
_man6 addMagazine "10Rnd_762x54_SVD";
_man6 addMagazine "10Rnd_762x54_SVD";
_man6 addWeapon "SVD";
_man6 setskill ["aimingAccuracy",0.5];
_man6 setIdentity "name22";
_man6 disableAI "MOVE";
//Grenadier
_man7 = _group createunit ["Woodlander3", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
_man7 addMagazine "30Rnd_545x39_AK";
_man7 addMagazine "30Rnd_545x39_AK";
_man7 addMagazine "30Rnd_545x39_AK";
_man7 addMagazine "30Rnd_545x39_AK";
_man7 addMagazine "30Rnd_545x39_AK";
_man7 addMagazine "1Rnd_HE_GP25";
_man7 addMagazine "1Rnd_HE_GP25";
_man7 addMagazine "1Rnd_HE_GP25";
_man7 addWeapon "AK_74_GL";
_man7 setskill ["aimingAccuracy",0.5];
_man7 setIdentity "name23";
// Add event handlers for dropping items and money.
_leader addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man2 addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man3 addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man4 addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man5 addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man6 addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man7 addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man7 disableAI "MOVE";
_leader = leader _group;
[_group, _pos] call defendArea;