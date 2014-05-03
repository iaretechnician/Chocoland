
//	@file Version: 1.0
//	@file Name: playerSetup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:
_player = _this;
//Player initialization

process = false;
reserved_units = [admin1, admin3, admin2];
reserved_uids = ["3771202","108720582","149964550"];
reserved_uids2 = ["108720582","149964550"];
_uid = getPlayerUId _player;
if ((_player in reserved_units)&& !(_uid in reserved_uids)) then {
   _player globalChat "You are in a adminslot, kicking to lobby in 5 seconds";
   sleep 5;
   failMission "end1";
 };
donator_jake = [jake, jake1, jake2];
 donator_jakeuid = ["125670982"];
_uid = getPlayerUId _player;
if ((_player in donator_jake)&& !(_uid in donator_jakeuid)) then {
   _player globalChat "You are in Jake`s reserved slot, kicking to lobby in 5 seconds";
   sleep 5;
   failMission "end1";
 };
 donator_patrick = [patrick, patrick1, patrick2];
 donator_patrickuid = ["247641030"];
_uid = getPlayerUId _player;
if ((_player in donator_patrick)&& !(_uid in donator_patrickuid)) then {
   _player globalChat "You are in Patrick`s reserved slot, kicking to lobby in 5 seconds";
   sleep 5;
   failMission "end1";
 };

//end Reserved slots
_player setskill 0;
{_player disableAI _x} foreach ["move","anim","target","autotarget"];
_player setVariable ["BIS_noCoreConversations", true];

enableSentences false;
_player removeWeapon "ItemRadio";
_player removeWeapon "ItemGPS";
removeAllWeapons _player;
removeBackpack _player;

//Default case means something fucked up.
_player addMagazine "6Rnd_45ACP";
_player addMagazine "6Rnd_45ACP";
_player addWeapon "revolver_gold_EP1";
_player selectWeapon "revolver_gold_EP1";

if(str(playerSide) in ["WEST"]) then
{
    removeAllWeapons _player;
    _player addMagazine "7Rnd_45ACP_1911";
    _player addMagazine "7Rnd_45ACP_1911";
	_player addWeapon "Colt1911";
	_player selectWeapon "Colt1911";
};

if(str(playerSide) in ["EAST"]) then
{
    removeAllWeapons _player;
    _player addMagazine "8Rnd_9x18_Makarov";
    _player addMagazine "8Rnd_9x18_Makarov";
    _player addMagazine "8Rnd_9x18_Makarov";
	_player addWeapon "Makarov";
	_player selectWeapon "Makarov";
};

if(str(playerSide) in ["GUER"]) then
{
    removeAllWeapons _player;
    _player addMagazine "17Rnd_9x19_glock17";
	_player addWeapon "glock17_EP1";
	_player selectWeapon "glock17_EP1";
};
if(_player getvariable"donator" == 1)then{
_curVal = Donatorweapon;
if (!isNil"_curVal") then 
{
	removeAllWeapons _player;
	{
		_player addWeapon _x;
                _player selectWeapon _x;
	}foreach _curVal;
};
};

_player addrating 1000000;
_player switchMove "amovpknlmstpsraswpstdnon_gear";

thirstLevel = 100;
hungerLevel = 100;

_player setVariable["bounty",0,true];
if(firstspawn) then {
	_player setDamage 0;
_player setVariable["bounty",0,true];
_player setVariable["donator",0,true];
_player setVariable["decoder",0,true];
_player setVariable["basebuilder",0,true];
_player setVariable["choco",500,true];
_player setVariable["canfood",2,false];
_player setVariable["chocopack",0,true];
_player setVariable["saveVehicle",0,true];
_player setVariable["medkits",0,false];
_player setVariable["water",2,false];
_player setVariable["fuel",0,false];
_player setVariable["repairkits",0,false];
_player setVariable["fuelFull", 1,false];
_player setVariable["fuelEmpty",0,false];
_player setVariable["bombs",false,false];
_player setVariable["spawnBeacon",0,false];
_player setVariable["camonet",0,false];
_player setVariable["canDrop",false,false];
 _player addMagazine "7Rnd_45ACP_1911";
 _player addMagazine "7Rnd_45ACP_1911";
	_player addWeapon "Colt1911";
	_player selectWeapon "Colt1911";
	firstspawn = false;
};
_player setVariable["canfood",1,false];
_player setVariable["medkits",0,false];
_player setVariable["water",1,false];
_player setVariable["fuel",0,false];
_player setVariable["repairkits",0,false];
_player setVariable["fuelFull", 1, false];
_player setVariable["fuelEmpty",0, false];
_player setVariable["bombs",false,false];
_player setVariable["spawnBeacon",0,false];
_player setVariable["camonet",0,false];
_player setVariable["canDrop",false,false];

[] execVM "client\functions\playerActions.sqf";
[] execVM "client\functions\playercamera.sqf";
//[] execVM "client\functions\createMarkers.sqf";

playerSetupComplete = true;
//coroutine
process = false;
spawni setObjectTexture [0, ""];
_player setVariable["basecore",0,true];
