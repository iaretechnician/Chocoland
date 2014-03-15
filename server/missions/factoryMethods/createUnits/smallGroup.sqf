//	@file Version: 1.0
//	@file Name: smallGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4"];

_group = _this select 0;
_pos = _this select 1;

//Anti Vehicle
_leader = _group createunit ["Priest", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_leader addMagazine "PG7V";
_leader addMagazine "PG7V";
_leader addWeapon "RPG7V";
_leader addMagazine "30Rnd_545x39_AK";
_leader addMagazine "30Rnd_545x39_AK";
_leader addMagazine "30Rnd_545x39_AK";
_leader addWeapon "AKS_74_U";
_leader addEventHandler ["killed", {_killer = _this select 1;_amount = 50+(random 200);_killer setVariable ["cmoney", (_killer getVariable ["cmoney", 0]) + _amount, true];}];

//Support
_man2 = _group createunit ["CIV_EuroMan02_EP1", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addMagazine "75Rnd_545x39_RPK";
_man2 addWeapon "RPK_74";
_man2 addEventHandler ["killed", {_killer = _this select 1;_amount = 50+(random 150);_killer setVariable ["cmoney", (_killer getVariable ["cmoney", 0]) + _amount, true];}];
//Rifleman
_man3 = _group createunit ["CIV_EuroMan01_EP1", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addMagazine "30Rnd_762x39_AK47";
_man3 addWeapon "AK_47_M";
_man3 addEventHandler ["killed", {_killer = _this select 1;_amount = 50+(random 100);_killer setVariable ["cmoney", (_killer getVariable ["cmoney", 0]) + _amount, true];}];
//Sniper
_man4 = _group createunit ["CIV_EuroMan01_EP1", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
_man4 addMagazine "10Rnd_762x54_SVD";
_man4 addMagazine "10Rnd_762x54_SVD";
_man4 addMagazine "10Rnd_762x54_SVD";
_man4 addWeapon "SVD";
_man4 addEventHandler ["killed", {_killer = _this select 1;_amount = 50+(random 150);_killer setVariable ["cmoney", (_killer getVariable ["cmoney", 0]) + _amount, true];}];
_leader = leader _group;
[_group, _pos] call defendArea;