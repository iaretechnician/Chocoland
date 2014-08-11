

#include "dialog\player_sys.sqf";
#define GET_DISPLAY (findDisplay playersys_DIALOG)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
if(isNil {dropActive}) then {dropActive = false};
if(isNil {MoneyInUse}) then {MoneyInUse = false};
if(isnil {player getVariable "choco"}) then {player setVariable["choco",0,true];};
disableSerialization;

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat "YOU ARE ALREADY PERFORMING ANOTHER ACTION!";
};

private["_money","_pos","_cash"];
_money = parsenumber(GET_SELECTED_DATA(money_value));

if((player getVariable "choco" < _money) OR (player getVariable "choco" < 0)) exitwith {hint format["You don't have $%1 to drop", _money];};

mutexScriptInProgress = true;
_pos = getPosATL player;
player playmove "AinvPknlMstpSlayWrflDnon";
_cash = "Evmoney" createVehicle (position player); _cash setPosATL _pos;
_cash setVariable["cash",_money,true];
_cash setVariable["owner","world",true];
_cash setvariable["multi",1,true];
player setVariable["choco",(player getVariable "choco") - _money,true];
 if(_money >= 100000)then{
                        diag_log_server = parsetext format["player:%1 drop %2 now %3 Money",name player,_money, (player getVariable"choco")];
publicvariableserver "diag_log_server";};
PDB_saveReq = getPlayerUID player;
publicVariableServer "PDB_saveReq";
sleep 3;
mutexScriptInProgress = false;
player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation. 