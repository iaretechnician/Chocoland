_player = _this;
//Player initialization
process = false;
setdate[2020,10,10,12,10];
_player setskill 0;
{_player disableAI _x} foreach ["move","anim","target","autotarget"];
_player setVariable ["BIS_noCoreConversations", true];

enableSentences false;
_player setVariable ["ShowNameAllies", false];
_player removeWeapon "ItemRadio";
_player removeWeapon "ItemGPS";
removeAllWeapons _player;
removeBackpack _player;
//random start weapon
_arrayW =  ["glock17_EP1","Sa61_EP1","M9SD","UZI_SD_EP1","revolver_gold_EP1","Makarov","Colt1911","MakarovSD","M9","revolver_EP1","UZI_EP1"];
_rweapon = _arrayW call BIS_fnc_selectRandom; 
//_rweapon = _rweapon select 2;
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
_player setvariable ["ongui","",true];
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
_test =time - timeplayer ;
 _y= _player getvariable"highscore"; 
_player setvariable["highscore",[_y select 0,_y select 1,_y select 2,_y select 3,_y select 4,_y select 5,(_y select 6)+_test, _y select 7],true];
timeplayer = time;
