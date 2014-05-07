#include "dialog\classDefines.sqf";
disableSerialization;

_buildshopDialog = createDialog "classd";
classStoreCart = 0;

_Dialog = findDisplay class_DIALOG;
_playerMoney = _Dialog displayCtrl class_money;
_playerMoney CtrlsetText format[""];

classShop = str(_this select 0);

ShopSpawn = getPos player;