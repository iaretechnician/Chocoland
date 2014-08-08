private ["_type", "_ar", "_oldUnit", "_newUnit", "_dummyUnit", "_dummyGroup"];
[] call statsave;
//_oldUnit = player;
//_type = _skin;
 
_ar = [weapons oldUnit, magazines oldUnit, rank oldUnit, score oldUnit, group oldUnit, getPos oldUnit, (leader oldUnit) == oldUnit, vehicleVarName oldUnit];
 /*
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
 */
 _group = group oldUnit;
 [oldUnit] join _group;
 setPlayable oldUnit;
 addSwitchableUnit oldUnit;
 selectplayer oldUnit;
sleep 1;
if (_ar select 7 != "") then {
    oldUnit setVehicleInit format["this setVehicleVarName '%1'; %1 = this", _ar select 7];
    processInitCommands;
};
 [oldUnit] join (_ar select 4);
removeSwitchableUnit newUnit;
 
sleep 1;
deleteVehicle newUnit; // Might have to remote execute this to be successfull in MP
 
sleep 1;
 if (_ar select 6) then { (group oldUnit) selectLeader oldUnit};
 
player playmove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";

player setskill 0;
{player disableAI _x} foreach ["move","anim","target","autotarget"];
player setVariable["bounty",0,true];
player setVariable["donator",0,true];
player setVariable["decoder",0,true];
player setVariable["basebuilder",0,true];
player setVariable["attach",0,true];
player setVariable["upgrades",0,true];
player setVariable["choco",500,true];
player setVariable["canfood",2,true];
player setVariable["chocopack",0,true];
player setVariable["chocoload",[],true];
player setVariable["saveVehicle",0,true];
player setVariable["medkits",0,true];
player setVariable["water",2,true];
player setVariable["fuel",0,true];
player setVariable["repairkits",0,true];
player setVariable["fuelFull", 1,true];
player setVariable["fuelEmpty",0,true];
player setVariable["bombs",false,true];
player setVariable["spawnBeacon",0,true];
player setVariable["camonet",0,true];
player setVariable["canDrop",false,true];
player setVariable["animal",false,true];
//player addEventHandler ["Respawn", {[_this] call onRespawn;}];
//player addEventHandler ["Killed", {[_this] call onKilled;}];
player setVariable ["BIS_noCoreConversations", true];
player addweapon "ItemMap";
player addweapon "ItemCompass";
player addweapon "ItemWatch";
player addrating 1000000;
player switchMove "amovpknlmstpsraswpstdnon_gear";
player setVariable["basecore",0,true];
[0,player] call statload;