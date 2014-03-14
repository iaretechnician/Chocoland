#include "dialog\buildstoreDefines.sqf";
disableSerialization;

_buildshopDialog = createDialog "buildshopd";
buildStoreCart = 0;

_Dialog = findDisplay buildshop_DIALOG;
_playerMoney = _Dialog displayCtrl buildshop_money;
_money = player getVariable "cmoney";
_playerMoney CtrlsetText format[""];

BuildShop = str(_this select 0);

ShopSpawn = getPos player;