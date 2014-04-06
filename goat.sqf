_skin = "Goat";
// ***** CBA_fnc_switchPlayer *****
private ["_type", "_ar", "_oldUnit", "_newUnit", "_dummyUnit", "_dummyGroup"];
 
_oldUnit = player;
_type = _skin;
 
_ar = [weapons _oldUnit, magazines _oldUnit, rank _oldUnit, score _oldUnit, group _oldUnit, getPos _oldUnit, (leader _oldUnit) == _oldUnit, vehicleVarName _oldUnit];
 
_dummyGroup = createGroup (side _oldUnit);
if (isNull _dummyGroup) exitWith { hint "Sorry, something went wrong, dummyGroup is null" };
_dummyUnit = (_ar select 4) createUnit [_type, [0, 0, 0], [], 0, "NONE"]; // Join in the old group incase there was only 1 member
if (isNull _dummyUnit) exitWith { hint "Sorry, something went wrong, dummyUnit is null" };
[_oldUnit] join _dummyGroup;
 hint format["1.Dummy created, State saved and put oldUnit in new group: %1", _dummyGroup];
 _newUnit = _dummyGroup createUnit ["Goat", _ar select 5, [], 0, "NONE"];
 if (isNull _newUnit) exitWith { hint "Sorry, something went wrong, newUnit is null" };
 hint format["2.New unit created, local: %1", local _newUnit];
sleep 1;
 setPlayable _newUnit;
addSwitchableUnit _newUnit;
selectPlayer _newUnit;
 _newUnit setRank (_ar select 2);
_newUnit addScore (_ar select 3);
 hint format["3.State transfered, switched player control to new unit, local: %1", local _newUnit];
sleep 1;
if (_ar select 7 != "") then {
    _newUnit setVehicleInit format["this setVehicleVarName '%1'; %1 = this", _ar select 7];
    processInitCommands;
};
 [_newUnit] join (_ar select 4);
removeSwitchableUnit _newUnit;
 hint "5.New Unit joined in original group";
sleep 1;
 { deleteVehicle _x } forEach [_oldUnit, _dummyUnit]; // Might have to remote execute this to be successfull in MP
 hint "6.Deleted and moved away dummy units etc";
sleep 1;
 if (_ar select 6) then { (group _newUnit) selectLeader _newUnit };
 
removeAllWeapons _player;
removeAllitems _player;
removeBackpack player;
 
_player addMagazine "15Rnd_9x19_M9";
_player addMagazine "15Rnd_9x19_M9";
_player addWeapon "M9";
 
_player addweapon "ItemMap";
_player addweapon "ItemCompass";
_player addweapon "ItemWatch";
 
_secondaryWeapon = secondaryWeapon _player;
_player selectweapon _secondaryWeapon;
 player playmove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";
skinId = player addAction[('<t color=''#FF33CC''>' + ('get back to Player') +  '</t>'),'reverseskin.sqf'];
bombId = player addAction[('<t color=''#FF33CC''>' + ('BLEW UP!!!!') +  '</t>'),'bomb.sqf'];