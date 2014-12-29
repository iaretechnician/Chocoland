
#include "dialog\player_sys.sqf";
disableSerialization;

_dialog = findDisplay playersys_DIALOG;
_player = _dialog displayCtrl player_value;
_money = _dialog displayCtrl money_value;
if(isNil {dropActive}) then {dropActive = false};
if(isNil {MoneyInUse}) then {MoneyInUse = false};

//disableSerialization;

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	chocoland globalChat "YOU ARE ALREADY PERFORMING ANOTHER ACTION!";
};
_player = lbCurSel player_value;
_money = lbCurSel money_value;
_player2 = 0;
{if(_player == _player2)then {_player = name _x};_player2 = _player2 + 1 ;}foreach playableunits;
switch(_money) do 
{
	case 0: {_money =1000;};
        case 1: {_money =2500;};
        case 2: {_money =5000;};
        case 3: {_money =10000;};
        case 4: {_money =25000;};
        case 5: {_money =50000;};
        case 6: {_money =100000;};
        case 7: {_money =250000;};
};
      
if((player getVariable ["cmoney",0] < _money) OR (player getVariable ["cmoney",0] < 0)) exitwith {hint format["You don't have $%1 to drop", _money];};
_condi = false;

mutexScriptInProgress = true;
player setVariable["cmoney",(player getVariable "cmoney") - _money,true];[]call savePlayer;
chocoland globalChat format ["transfering %2$ to %1 ",_player,_money];
sleep 1 ; 
chocoland globalChat".";
sleep 1 ; 
chocoland globalChat"..";
sleep 1 ; 

{if(_player == name _x)then {_x setVariable["cmoney",(_x getvariable["cmoney",0])+_money,true];call compile format["[nil,_x,""loc"",rHINT,""%1 gaves you %2$""] call RE;", name player,_money];};}foreach playableunits;
chocoland globalChat"...transfered";

	
	
mutexScriptInProgress = false;