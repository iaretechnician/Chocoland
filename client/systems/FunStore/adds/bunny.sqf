
private ["_type", "_ar", "_oldUnit", "_newUnit", "_dummyUnit", "_dummyGroup"];
 skinText = typeOf(player);
  _mymoney = player getVariable"choco";
 _oldUnit = player;
_type = _skin;
 player setvariable["skin",1,true];
_ar = [weapons _oldUnit, magazines _oldUnit, rank _oldUnit, score _oldUnit, group _oldUnit, getPos _oldUnit, (leader _oldUnit) == _oldUnit, vehicleVarName _oldUnit];
 
_dummyGroup = createGroup (side _oldUnit);
if (isNull _dummyGroup) exitWith { hint "Sorry, something went wrong, dummyGroup is null" };
_dummyUnit = (_ar select 4) createUnit ["Rabbit", [0, 0, 0], [], 0, "NONE"]; // Join in the old group incase there was only 1 member
if (isNull _dummyUnit) exitWith { hint "Sorry, something went wrong, dummyUnit is null" };
[_oldUnit] join _dummyGroup;
 
 _newUnit = _dummyGroup createUnit ["Rabbit", _ar select 5, [], 0, "NONE"];
 if (isNull _newUnit) exitWith { hint "Sorry, something went wrong, newUnit is null" };
 
sleep 1;
 setPlayable _newUnit;
addSwitchableUnit _newUnit;
selectPlayer _newUnit;
 _newUnit setRank (_ar select 2);
_newUnit addScore (_ar select 3);

sleep 1;
if (_ar select 7 != "") then {
    _newUnit setVehicleInit format["this setVehicleVarName '%1'; %1 = this", _ar select 7];
    processInitCommands;
};
 [_newUnit] join (_ar select 4);
removeSwitchableUnit _newUnit;
 
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
 

 
_secondaryWeapon = secondaryWeapon _player;
_player selectweapon _secondaryWeapon;
 player playmove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";
  skinId = player addAction[('<t color=''#FF33CC''>' + ('get back to Player') +  '</t>'),'client\systems\FunStore\adds\reverseskin.sqf'];
  bombId = player addAction[('<t color=''#FF33CC''>' + ('BLEW UP!!!!') +  '</t>'),'client\systems\FunStore\adds\bomb.sqf'];
player addweapon "ItemMap";
player addweapon "ItemCompass";
player addweapon "ItemWatch";
player setVariable["choco",_mymoney,true];
// addEventHandler ["Respawn", {;null1 =[player] execVM "client\functions\playerActions.sqf";null2 =[player] execVM "client\clientEvents\onMouseWheel.sqf";}];
player addEventHandler ["Killed", {;null =[player] execVM "server\functions\bomb.sqf";}];
processInitCommands;
