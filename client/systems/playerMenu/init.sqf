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
_rogue = _Dialog displayCtrl rogue_text;
_uptime = _Dialog displayCtrl uptime_text;
_groupButton = _Dialog displayCtrl groupButton;
_saveVehicle = _Dialog displayCtrl saveVehicleText_text;
_saveVehicle2 = _Dialog displayCtrl saveVehicleText2_text;

_foodtext ctrlSettext format["%1 / 100", round(hungerLevel)];
_watertext ctrlSetText format["%1 / 100", round(thirstLevel)];
_test=[player getVariable "choco"] call fnc_number;
_moneytext ctrlSetText format["%1", _test];
_vehicle = player getvariable"saveVehicle";
_vehicle2 = player getvariable"saveVehicle2";
_vehicle = (configFile >> "CfgVehicles" >> _vehicle);  _vehicle = getText(_vehicle >> "displayName");
_vehicle2 = (configFile >> "CfgVehicles" >>  _vehicle2);  _vehicle2 = getText(_vehicle2 >> "displayName");
_saveVehicle ctrlSetText format["Hangar: %1", _vehicle];
_saveVehicle2 ctrlSetText format["DonatorHangar: %1", _vehicle2];

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
if(str(playerSide) == "west" || str(playerSide) == "east") then
{
	_groupButton ctrlShow false;    
};