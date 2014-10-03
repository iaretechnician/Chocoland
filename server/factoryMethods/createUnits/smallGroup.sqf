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
[_leader]call npcRweapon;
_leader setIdentity "name24";
_leader addrating -10000;
[_leader,150] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";
//Support
_man2 = _group createunit ["CIV_EuroMan02_EP1", [(_pos select 0) - 3, _pos select 1, 0], [], 0.5, "Form"];
[_man2]call npcRweapon;
_man2 setIdentity "name1";
_man2 addrating -10000;
[_man2,150] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";
//Rifleman
_man3 = _group createunit ["CIV_EuroMan01_EP1", [_pos select 0, (_pos select 1) + 3, 0], [], 0.5, "Form"];
[_man3]call npcRweapon;
_man3 setIdentity "name2";
_man3 addrating -10000;
[_man3,150] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";
//Sniper
_man4 = _group createunit ["CIV_EuroMan01_EP1", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
[_man4]call npcRweapon;
_man4 setIdentity "name3";
_man4 addrating -10000;
[_man4,150] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";
// Add event handlers for dropping items and money.
_leader = leader _group;
