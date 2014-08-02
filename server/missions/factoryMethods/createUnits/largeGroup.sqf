//	@file Version: 1.0
//	@file Name: largeGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7","_man8","_man9","_man10"];

_group = _this select 0;
_pos = _this select 1;

//Anti Air no weapon
_leader = _group createunit ["Priest", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];
_leader addMagazine "Strela";
_leader addWeapon "Strela";
_leader addMagazine "30Rnd_545x39_AK";
_leader addMagazine "30Rnd_545x39_AK";
_leader addMagazine "30Rnd_545x39_AK";
_leader addMagazine "30Rnd_545x39_AK";
_leader addMagazine "30Rnd_545x39_AK";
_leader addMagazine "30Rnd_545x39_AK";
_leader addWeapon "AKS_74_U";
_leader setskill ["aimingAccuracy",0.7];
_leader setIdentity "name7";
_leader addrating -10000;

//Support
_man2 = _group createunit ["Woodlander4", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addWeapon "RPK_74";
_man2 setskill ["aimingaccuracy",0.7];
_man2 setIdentity "name8";
_man2 addrating -10000;

//Rifle_man
_man3 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man3 addMagazine "PG7VR";
_man3 addMagazine "PG7VR";
_man3 addMagazine "PG7VR";
_man3 addWeapon "RPG7V";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man3 addWeapon "AK_47_M";
_man3 setskill ["aimingaccuracy",0.7];
_man3 setIdentity "name9";
_man3 addrating -10000;

//Rifle_man
_man4 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addMagazine "30Rnd_762x39_AK47";
_man4 addWeapon "AK_47_M";
_man4 setskill ["aimingaccuracy",0.7];
_man4 setIdentity "name10";
_man4 addrating -10000;

//Sniper
_man5 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
_man5 addMagazine "10Rnd_762x54_SVD";
_man5 addMagazine "10Rnd_762x54_SVD";
_man5 addMagazine "10Rnd_762x54_SVD";
_man5 addMagazine "10Rnd_762x54_SVD";
_man5 addMagazine "10Rnd_762x54_SVD";
_man5 addWeapon "SVD";
_man5 setskill ["aimingaccuracy",0.7];
_man5 setIdentity "name11";
_man5 addrating -10000;

//Grenadier
_man6 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
_man6 addMagazine "30Rnd_545x39_AK";
_man6 addMagazine "30Rnd_545x39_AK";
_man6 addMagazine "30Rnd_545x39_AK";
_man6 addMagazine "30Rnd_545x39_AK";
_man6 addMagazine "30Rnd_545x39_AK";
_man6 addMagazine "1Rnd_HE_GP25";
_man6 addMagazine "1Rnd_HE_GP25";
_man6 addMagazine "1Rnd_HE_GP25";
_man6 addWeapon "AK_74_GL";
_man6 setskill ["aimingaccuracy",0.7];
_man6 setIdentity "name12";
_man6 addrating -10000;

//Support
_man7 = _group createunit ["Woodlander4", [(_pos select 0) - 40, _pos select 1, 0], [], 0.5, "Form"];
_man7 addMagazine "75Rnd_545x39_RPK";
_man7 addMagazine "75Rnd_545x39_RPK";
_man7 addMagazine "75Rnd_545x39_RPK";
_man7 addMagazine "75Rnd_545x39_RPK";
_man7 addWeapon "RPK_74";
_man7 setskill ["aimingaccuracy",0.7];
_man7 setIdentity "name13";
_man7 addrating -10000;
//Grenadier
_man8 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) + 50, 0], [], 0.5, "Form"];
_man8 addMagazine "30Rnd_545x39_AK";
_man8 addMagazine "30Rnd_545x39_AK";
_man8 addMagazine "30Rnd_545x39_AK";
_man8 addMagazine "30Rnd_545x39_AK";
_man8 addMagazine "30Rnd_545x39_AK";
_man8 addMagazine "1Rnd_HE_GP25";
_man8 addMagazine "1Rnd_HE_GP25";
_man8 addMagazine "1Rnd_HE_GP25";
_man8 addWeapon "AK_74_GL";
_man8 setskill ["aimingaccuracy",0.7];
_man8 setIdentity "name14";
_man8 addrating -10000;
//Sniper
_man9 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) - 50, 0], [], 0.5, "Form"];
_man9 addMagazine "10Rnd_762x54_SVD";
_man9 addMagazine "10Rnd_762x54_SVD";
_man9 addMagazine "10Rnd_762x54_SVD";
_man9 addMagazine "10Rnd_762x54_SVD";
_man9 addMagazine "10Rnd_762x54_SVD";
_man9 addWeapon "SVD";
_man9 setskill ["aimingaccuracy",0.7];
_man9 setIdentity "name15";
_man9 addrating -10000;

//Rifle_man
_man10 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man10 addMagazine "30Rnd_762x39_AK47";
_man10 addMagazine "30Rnd_762x39_AK47";
_man10 addMagazine "30Rnd_762x39_AK47";
_man10 addMagazine "30Rnd_762x39_AK47";
_man10 addMagazine "30Rnd_762x39_AK47";
_man10 addMagazine "30Rnd_762x39_AK47";
_man10 addWeapon "AK_47_M";
_man10 setskill ["aimingaccuracy",0.7];
_man10 setIdentity "name16";
_man10 addrating -10000;

// Add event handlers for dropping items and money.
_leader addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man2 addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man3 addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man4 addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man5 addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man6 addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man7 addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man8 addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man9 addEventHandler ["Killed", {[_this] call createLootMoney;}];
_man10 addEventHandler ["Killed", {[_this] call createLootMoney;}];

_leader = leader _group;
[_group, _pos] call defendArea;