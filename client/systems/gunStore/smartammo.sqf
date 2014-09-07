

//	@file Version: 1.0
//	@file Name: addToCart.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\gunstoreDefines.sqf";
disableSerialization;
if (local player) then {
     _price =500;
_weapon = currentWeapon player;
if (isnil "_weapon")exitwith{};
_magazines = getArray(configFile >> "cfgWeapons" >> _weapon>> "magazines");
_magazines = _magazines select 0;
//_magazines = _magazines call BIS_fnc_selectRandom; 
	{ if(_magazines == _x select 1) then { _price = _x select 2;};
        }forEach ammoArray;
        _price = _price *2;
	_money = player getvariable"choco";
       
        if(_money >_price)then {player setvariable["choco",_money -_price,true];player addmagazine _magazines}else{hint"you dont have enough money"};
	
};