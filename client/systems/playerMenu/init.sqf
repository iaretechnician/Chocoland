

#include "dialog\player_sys.sqf"; 
if(isnil {player getVariable "choco"}) then {player setVariable["choco",0,true];};
if(dialog) exitwith{};

disableSerialization;

private["_Dialog","_foodtext","_watertext","_moneytext","_mvalue","_rogue"];

_playerDialog = createDialog "playerSettings";

_Dialog = findDisplay playersys_DIALOG;
_foodtext = _Dialog displayCtrl food_text;
_watertext = _Dialog displayCtrl water_text;
_moneytext = _Dialog displayCtrl money_text;
_mvalue = _Dialog displayCtrl money_value;
_pvalue = _Dialog displayCtrl player_value;
_rogue = _Dialog displayCtrl rogue_text;
_uptime = _Dialog displayCtrl uptime_text;
_groupButton = _Dialog displayCtrl groupButton;
_saveVehicle = _Dialog displayCtrl saveVehicleText_text;
_saveVehicle2 = _Dialog displayCtrl saveVehicleText2_text;
//highscore
_score=player getVariable "highscore";
_highscore1 = _Dialog displayCtrl highscore1;_price=[_score select 0] call fnc_number;_highscore1 ctrlSetText format["Total Kills: %1", _price];
_highscore2 = _Dialog displayCtrl highscore2;_highscore2 ctrlSetText format["Winning streak: %1", _score select 1];
_highscore3 = _Dialog displayCtrl highscore3;_highscore3 ctrlSetText format["Deaths: %1", _score select 2];
_highscore4 = _Dialog displayCtrl highscore4;_highscore4 ctrlSetText format["Cleared Missions: %1", _score select 3];
_highscore5 = _Dialog displayCtrl highscore5; _price1=[_score select 4] call fnc_number;_highscore5 ctrlSetText format["Money Payed: %1",_price1];
_highscore6 = _Dialog displayCtrl highscore6; _price2=[_score select 5] call fnc_number;_highscore6 ctrlSetText format["Money Earned: %1", _price2];
_highscore7 = _Dialog displayCtrl highscore7; _price3=[_score select 6] call fnc_number;_highscore7 ctrlSetText format["Time played: %1", _price3];
_highscore8 = _Dialog displayCtrl highscore8; _price4=[_score select 7] call fnc_number;_highscore8 ctrlSetText format["Total Walked: %1", _price4];
//end highscore

//_foodtext ctrlSettext format["%1 / 100", round(hungerLevel)];
//_watertext ctrlSetText format["%1 / 100", round(thirstLevel)];
_test=[player getVariable "choco"] call fnc_number;
_moneytext ctrlSetText format["%1", _test];
_vehicle = player getvariable"saveVehicle";
_vehicle2 = player getvariable"chocopack";
_vehicle = (configFile >> "CfgVehicles" >> _vehicle);  _vehicle = getText(_vehicle >> "displayName");
//_vehicle2 = (configFile >> "CfgVehicles" >>  _vehicle2);  _vehicle2 = getText(_vehicle2 >> "displayName");
_saveVehicle ctrlSetText format["Hangar: %1", _vehicle];
_saveVehicle2 ctrlSetText format["Backpack: %1", _vehicle2];

_mIndex = _mvalue lbadd "$10"; _mvalue lbSetData [(lbSize _mvalue)-1, "10"];
_mIndex = _mvalue lbadd "$50"; _mvalue lbSetData [(lbSize _mvalue)-1, "50"];
_mIndex = _mvalue lbadd "$100"; _mvalue lbSetData [(lbSize _mvalue)-1, "100"];
_mIndex = _mvalue lbadd "$250"; _mvalue lbSetData [(lbSize _mvalue)-1, "250"];
_mIndex = _mvalue lbadd "$500"; _mvalue lbSetData [(lbSize _mvalue)-1, "500"];
_mIndex = _mvalue lbadd "$1000"; _mvalue lbSetData [(lbSize _mvalue)-1, "1000"];
_mIndex = _mvalue lbadd "$2500"; _mvalue lbSetData [(lbSize _mvalue)-1, "2500"];
_mIndex = _mvalue lbadd "$5000"; _mvalue lbSetData [(lbSize _mvalue)-1, "5000"];
_mIndex = _mvalue lbadd "$10000"; _mvalue lbSetData [(lbSize _mvalue)-1, "10000"];
_mIndex = _mvalue lbadd "$20000"; _mvalue lbSetData [(lbSize _mvalue)-1, "20000"];
_mIndex = _mvalue lbadd "$50000"; _mvalue lbSetData [(lbSize _mvalue)-1, "50000"];
_mIndex = _mvalue lbadd "$100000"; _mvalue lbSetData [(lbSize _mvalue)-1, "100000"];
_mIndex = _mvalue lbadd "$250000"; _mvalue lbSetData [(lbSize _mvalue)-1, "250000"];
{
    call compile format["_mIndex = _pvalue lbadd ""%1"";
    _pvalue lbSetData [(lbSize _pvalue)-1, ""%1""];", name _x];
    }foreach playableunits;
if(str(playerSide) == "west" || str(playerSide) == "east") then
{
	_groupButton ctrlShow false;    
};