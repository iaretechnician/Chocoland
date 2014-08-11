

#include "dialog\menuDefines.sqf";
disableSerialization;

_chopshopDialog = createDialog "confirmpd";

_Dialog = findDisplay confirm_DIALOG;
CopperShop = str(_this select 0);

if(ChopperShop == "ChopStore2") then {ShopSpawn = ChopSpawn2;};
if(ChopperShop == "ChopStore3") then {ShopSpawn = ChopSpawn3;};
