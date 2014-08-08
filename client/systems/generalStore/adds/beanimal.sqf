private ["_skin","_skin2","_type", "_ar", "_oldUnit", "_newUnit", "_dummyUnit", "_dummyGroup"];
//_skin = "Hen";
_skin2=_this select 0;
_skin = "";
_MMarray1 = ["Hen","Rabbit","Cow04","Pastor","Goat"];
_skin = _MMarray1 call BIS_fnc_selectRandom;
if(_skin2 == 1)then {_skin = "Hen"};
if(_skin2 == 2)then {_skin = "Rabbit"};
if(_skin2 == 3)then {_skin = "Cow04"};
if(_skin2 == 4)then {_skin = "Pastor"};
if(_skin2 == 5)then {_skin = "Goat"};

skinText = typeOf(player);

[] call statsave;

 _oldUnit = player;
_type = _skin;

_ar = [weapons _oldUnit, magazines _oldUnit, rank _oldUnit, score _oldUnit, group _oldUnit, getPos _oldUnit, (leader _oldUnit) == _oldUnit, vehicleVarName _oldUnit];
 
_dummyGroup = createGroup (side _oldUnit);

_dummyUnit = (_ar select 4) createUnit [_skin, [0, 0, 0], [], 0, "NONE"]; // Join in the old group incase there was only 1 member

[_oldUnit] join _dummyGroup;
 
 newUnit = _dummyGroup createUnit [_skin, _ar select 5, [], 0, "NONE"];

 
sleep 0.3;
setPlayable newUnit;
addSwitchableUnit newUnit;
selectPlayer newUnit;
newUnit setRank (_ar select 2);
newUnit addScore (_ar select 3);

sleep 0.3;
if (_ar select 7 != "") then {
    newUnit setVehicleInit format["this setVehicleVarName '%1'; %1 = this", _ar select 7];
    processInitCommands;
};
 [newUnit] join (_ar select 4);
removeSwitchableUnit newUnit;
 
sleep 0.3;
 { deleteVehicle _x } forEach [ _dummyUnit];
 oldUnit =_oldUnit;
 oldUnit setpos [2101.75,4314.7,0.00130653];
 publicVariable "oldUnit";// Might have to remote execute this to be successfull in MP
sleep 0.3;
 if (_ar select 6) then { (group newUnit) selectLeader newUnit};

player setVariable["basecore",0,true];
newUnit setVariable["basecore",0,true];
 //player playmove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";
newUnit addweapon "ItemMap";
newUnit addweapon "ItemCompass";newUnit addweapon "ItemWatch";
newUnit addEventHandler ["Respawn", {[player]execVM"client\clientEvents\onRespawnAnimal.sqf"}];
//newUnit addEventHandler ["Killed", {[[this,this]]execVM"server\functions\dropLoot.sqf"}];
//[newUnit]execVM"client\functions\animalMoney.sqf";

[1,player] call statload;
player setVariable["animal",true,true];
player globalchat" Reserve to Player function will come in 180 seconds";
sleep 180;
revId = player addAction[('<t color=''#219eff''>' + ('Reverse to Player') +  '</t>'),'client\systems\generalStore\adds\reverseskin.sqf'];
