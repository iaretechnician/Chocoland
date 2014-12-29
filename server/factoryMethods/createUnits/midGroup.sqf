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
_rclass = npcClassrray call BIS_fnc_selectRandom; 
_leader = _group createunit [_rclass, [(_pos select 0) + 1, _pos select 1, 0], [], 0.5, "Form"];
[_leader]call npcRweapon;
_leader setIdentity "name17";
_leader addrating -10000;
 
//Support
_rclass = npcClassrray call BIS_fnc_selectRandom; 
_man2 = _group createunit [_rclass, [(_pos select 0) - 3, _pos select 1,0], [], 0.5, "Form"];
[_man2]call npcRweapon;
_man2 setIdentity "name18";
_man2 addrating -10000;
 
//Rifle_man
_rclass = npcClassrray call BIS_fnc_selectRandom; 
_man3 = _group createunit [_rclass, [_pos select 0, (_pos select 1) + 3, 0], [], 0.5, "Form"];
[_man3]call npcRweapon;
_man3 setIdentity "name19";
_man3 addrating -10000;
//Rifle_man
_rclass = npcClassrray call BIS_fnc_selectRandom; 
_man4 = _group createunit ["RU_Citizen1", [_pos select 0, (_pos select 1) + 4, 0], [], 0.5, "Form"];
[_man4]call npcRweapon;
_man4 setIdentity "name20";
_man4 addrating -10000;
 
//Rifle_man
_rclass = npcClassrray call BIS_fnc_selectRandom; 
_man5 = _group createunit [_rclass, [_pos select 0, (_pos select 1) + 4, 0], [], 0.5, "Form"];
[_man5]call npcRweapon;
_man5 setIdentity "name21";
_man5 addrating -10000;
//Sniper
_rclass = npcClassrray call BIS_fnc_selectRandom; 
_man6 = _group createunit [_rclass, [_pos select 0, (_pos select 1) - 3, 0], [], 0.5, "Form"];
[_man6]call npcRweapon;
_man6 setIdentity "name22";
_man6 addrating -10000;
 //Grenadier
 _rclass = npcClassrray call BIS_fnc_selectRandom; 
_man7 = _group createunit [_rclass, [_pos select 0, (_pos select 1) - 4, 0], [], 0.5, "Form"];
[_man7]call npcRweapon;
_man7 setIdentity "name23";
_man7 addrating -10000;
// Add event handlers for dropping items and money.
_leader = leader _group;
[_group, _pos] call defendArea;