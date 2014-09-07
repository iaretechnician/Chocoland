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
_leader = _group createunit ["Priest", [(_pos select 0) + 10, _pos select 1, 150], [], 0.5, "Form"];
[_leader]call npcRweapon;
_leader setIdentity "name17";
_leader addrating -10000;
 [_leader]execVM"server\spawning\parachute.sqf";
//Support
_man2 = _group createunit ["CIV_EuroMan02_EP1", [(_pos select 0) - 30, _pos select 1, 150], [], 0.5, "Form"];
[_man2]call npcRweapon;
_man2 setIdentity "name18";
_man2 addrating -10000;
 [_man2]execVM"server\spawning\parachute.sqf";
//Rifle_man
_man3 = _group createunit ["CIV_EuroMan01_EP1", [_pos select 0, (_pos select 1) + 30, 150], [], 0.5, "Form"];
[_man3]call npcRweapon;
_man3 setIdentity "name19";
_man3 addrating -10000;
 [_man3]execVM"server\spawning\parachute.sqf";
//Rifle_man
_man4 = _group createunit ["RU_Citizen1", [_pos select 0, (_pos select 1) + 40, 150], [], 0.5, "Form"];
[_man4]call npcRweapon;
_man4 setIdentity "name20";
_man4 addrating -10000;
 [_man4]execVM"server\spawning\parachute.sqf";
//Rifle_man
_man5 = _group createunit ["Rocker1", [_pos select 0, (_pos select 1) + 40, 150], [], 0.5, "Form"];
[_man5]call npcRweapon;
_man5 setIdentity "name21";
_man5 addrating -10000;
 [_man5]execVM"server\spawning\parachute.sqf";
//Sniper
_man6 = _group createunit ["Rocker2", [_pos select 0, (_pos select 1) - 30, 150], [], 0.5, "Form"];
[_man6]call npcRweapon;
_man6 setIdentity "name22";
_man6 addrating -10000;
 [_man6]execVM"server\spawning\parachute.sqf";
//Grenadier
_man7 = _group createunit ["Woodlander3", [_pos select 0, (_pos select 1) - 40, 150], [], 0.5, "Form"];
[_man7]call npcRweapon;
_man7 setIdentity "name23";
_man7 addrating -10000;
 [_man7]execVM"server\spawning\parachute.sqf";
// Add event handlers for dropping items and money.
_leader = leader _group;
[_group, _pos] call defendArea;