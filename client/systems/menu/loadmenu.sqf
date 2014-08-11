

#include "dialog\menuDefines.sqf";
disableSerialization;

_chopshopDialog = createDialog "menu1d";

_Dialog = findDisplay menu_DIALOG;
CopperShop = str(_this select 0);

if(ChopperShop == "ChopStore2") then {ShopSpawn = ChopSpawn2;};
if(ChopperShop == "ChopStore3") then {ShopSpawn = ChopSpawn3;};
