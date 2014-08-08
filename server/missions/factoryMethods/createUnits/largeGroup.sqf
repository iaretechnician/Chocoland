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
[_leader]call npcRweapon;
_leader setIdentity "name7";
_leader addrating -10000;

//Support
_man2 = _group createunit ["Woodlander4", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
[_man2]call npcRweapon;
_man2 setIdentity "name8";
_man2 addrating -10000;

//Rifle_man
_man3 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
[_man3]call npcRweapon;
_man3 setIdentity "name9";
_man3 addrating -10000;

//Rifle_man
_man4 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
[_man4]call npcRweapon;
_man4 setIdentity "name10";
_man4 addrating -10000;

//Sniper
_man5 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
[_man5]call npcRweapon;
_man5 setIdentity "name11";
_man5 addrating -10000;

//Grenadier
_man6 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
[_man6]call npcRweapon;
_man6 setIdentity "name12";
_man6 addrating -10000;

//Support
_man7 = _group createunit ["Woodlander4", [(_pos select 0) - 40, _pos select 1, 0], [], 0.5, "Form"];
[_man7]call npcRweapon;
_man7 setIdentity "name13";
_man7 addrating -10000;
//Grenadier
_man8 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) + 50, 0], [], 0.5, "Form"];
[_man8]call npcRweapon;
_man8 setIdentity "name14";
_man8 addrating -10000;
//Sniper
_man9 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) - 50, 0], [], 0.5, "Form"];
[_man9]call npcRweapon;
_man9 setIdentity "name15";
_man9 addrating -10000;

//Rifle_man
_man10 = _group createunit ["Woodlander4", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
[_man10]call npcRweapon;
_man10 setIdentity "name16";
_man10 addrating -10000;

_leader = leader _group;
[_group, _pos] call defendArea;