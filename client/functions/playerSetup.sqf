

//	@file Version: 1.0
//	@file Name: playerSetup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:
_player = _this;
//Player initialization

process = false;
reserved_units = [admin1, admin3, admin2];
reserved_uids = ["76561198078783807","76561198010316297","76561198032150693","76561198135184514"];
reserved_uids2 = ["108720582","149964550"];
_uid = getPlayerUId _player;
if ((_player in reserved_units)&& !(_uid in reserved_uids)) then 
{
   _player globalChat "You are in a adminslot, kicking to lobby in 5 seconds";
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
_player setVariable["canfood",1,false];
_player setVariable["medkits",0,false];
_player setVariable["water",1,false];
_player setVariable["fuel",0,false];
_player setVariable["repairkits",0,false];
_player setVariable["fuelFull",0,false];
_player setVariable["fuelEmpty",0,false];
_player setVariable["bombs",false,false];
_player setVariable["camonet",0,false];
_player setVariable["canDrop",false,false];
[] execVM "client\functions\playerActions.sqf";
[] execVM "client\functions\playercamera.sqf";
//[] execVM "client\functions\createMarkers.sqf";

playerSetupComplete = true;
//coroutine
process = false;
spawni setObjectTexture [0, ""];
spawni2 setObjectTexture [0, ""];
spawni3 setObjectTexture [0, ""];
_player setVariable["basecore",0,true];
