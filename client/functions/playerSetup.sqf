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
//random start weapon
_rweapon = weaponsArray call BIS_fnc_selectRandom; 
_rweapon = _rweapon select 2;
_player addweapon _rweapon;
_player selectWeapon _rweapon;
_magazines = getArray(configFile >> "cfgWeapons" >> _rweapon>> "magazines");
_magazines = _magazines call BIS_fnc_selectRandom; 
_player addmagazine _magazines;
_player addmagazine _magazines;
_player addmagazine _magazines;
//end start random weapons

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

_player setVariable["lastPos",(getposatl player),true];
_player setVariable["bounty",0,true];
_player setVariable["medkits",0,false];
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
_test =time - timeplayer ; _y= player getvariable"highscore"; player setvariable["highscore",[_y select 0,_y select 1,_y select 2,_y select 3,_y select 4,_y select 5,(_y select 6)+_test, _y select 7],true];
timeplayer = time;
