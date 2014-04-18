#include "dialog\FunStoreDefines.sqf";
disableSerialization;

_chopshopDialog = createDialog "funshopd";
funStoreCart = 0;

_Dialog = findDisplay funshop_DIALOG;
_playerMoney = _Dialog displayCtrl funshop_money;
_money = player getVariable "choco";
_playerMoney CtrlsetText format[""];

funShop = str(_this select 0);
ShopSpawn = getPos player;