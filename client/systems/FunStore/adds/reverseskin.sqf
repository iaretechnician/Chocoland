private ["_type", "_ar", "_oldUnit", "_newUnit", "_dummyUnit", "_dummyGroup"];

_oldUnit = player;
_type = _skin;
 
_ar = [weapons _oldUnit, magazines _oldUnit, rank _oldUnit, score _oldUnit, group _oldUnit, getPos _oldUnit, (leader _oldUnit) == _oldUnit, vehicleVarName _oldUnit];
 
_dummyGroup = createGroup (side _oldUnit);
if (isNull _dummyGroup) exitWith { hint "Sorry, something went wrong, dummyGroup is null" };
_dummyUnit = (_ar select 4) createUnit [skinText, [0, 0, 0], [], 0, "NONE"]; // Join in the old group incase there was only 1 member
if (isNull _dummyUnit) exitWith { hint "Sorry, something went wrong, dummyUnit is null" };
[_oldUnit] join _dummyGroup;
 
 _newUnit = _dummyGroup createUnit [skinText, _ar select 5, [], 0, "NONE"];
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
 
sleep 1;
 if (_ar select 6) then { (group _newUnit) selectLeader _newUnit };
 
removeAllWeapons player;
removeAllitems player;
removeBackpack player;
 player playmove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";
 
playerMenuId = player addAction [format ["<t color='#FF6600'>%1</t>", "Player Menu"], "client\systems\playerMenu\init.sqf",[],-10,false,false,"","local player"];
playerWeaponId = player addAction[('<t color=''#219eff''>' + ('ParaStore') +  '</t>'),'client\systems\menu\loadmenu.sqf'];
player addEventHandler ["Respawn", {[player] call onRespawn;}];
player addEventHandler ["Killed", {[player] call onKilled;}];

 [] execVM "client\functions\loadStats.sqf";
player setskill 0;
{player disableAI _x} foreach ["move","anim","target","autotarget"];
player setVariable ["BIS_noCoreConversations", true];
player addweapon "ItemMap";
player addweapon "ItemCompass";
player addweapon "ItemWatch";
player addrating 1000000;
player switchMove "amovpknlmstpsraswpstdnon_gear";
[] execVM "client\functions\playerActions.sqf";
[] execVM "client\functions\playercamera.sqf";
spawni setObjectTexture [0, ""];
player setVariable["basecore",0,true];
