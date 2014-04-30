
private ["_type", "_ar", "_oldUnit", "_newUnit", "_dummyUnit", "_dummyGroup"];
 skinText = typeOf(player);
 [] execVM "client\functions\saveStats.sqf";
 _oldUnit = player;
_type = _skin;
_ar = [weapons _oldUnit, magazines _oldUnit, rank _oldUnit, score _oldUnit, group _oldUnit, getPos _oldUnit, (leader _oldUnit) == _oldUnit, vehicleVarName _oldUnit];
_dummyGroup = createGroup (side _oldUnit);
_dummyUnit = (_ar select 4) createUnit ["Hooker3", [0, 0, 0], [], 0, "NONE"]; // Join in the old group incase there was only 1 member
[_oldUnit] join _dummyGroup;
 _newUnit = _dummyGroup createUnit ["Hooker3", _ar select 5, [], 0, "NONE"];
sleep 0.3;
 setPlayable _newUnit;
addSwitchableUnit _newUnit;
selectPlayer _newUnit;
 _newUnit setRank (_ar select 2);
_newUnit addScore (_ar select 3);
sleep 0.3;
if (_ar select 7 != "") then {
    _newUnit setVehicleInit format["this setVehicleVarName '%1'; %1 = this", _ar select 7];
    processInitCommands;
};
 [_newUnit] join (_ar select 4);
removeSwitchableUnit _newUnit;
sleep 0.3;
 { deleteVehicle _x } forEach [_oldUnit, _dummyUnit]; // Might have to remote execute this to be successfull in MP
 hintsilent "";
sleep 0.3;
 if (_ar select 6) then { (group _newUnit) selectLeader _newUnit };
removeAllWeapons _player;
removeAllitems _player;
removeBackpack player;
player playmove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";
bombId = player addAction[('<t color=''#219eff''>' + ('BLOW UP!!!!') +  '</t>'),'client\systems\FunStore\adds\bomb.sqf'];
player addweapon "ItemMap";
player addweapon "ItemCompass";
player addweapon "ItemWatch";
player addEventHandler ["Respawn", {;null1 =[] execVM "client\systems\FunStore\adds\reverseskin.sqf";}];
player addEventHandler ["Killed", {;null =[player] execVM "server\functions\bomb.sqf";}];
processInitCommands;
