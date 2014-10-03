

#include "dialog\chopstoreDefines.sqf";
disableSerialization;

_chopshopDialog = createDialog "chopshopd";
chopStoreCart = 0;

_Dialog = findDisplay chopshop_DIALOG;
_playerMoney = _Dialog displayCtrl chopshop_money;
_money = player getVariable "choco";
_playerMoney CtrlsetText format[""];
