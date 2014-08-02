#include "dialog\attachDefines.sqf";
disableSerialization;
_playerMoney = player getVariable "choco";
_price = 1000;
_price2 =1000;
_dialog = findDisplay attach_DIALOG;

//Buy
if(!isnil"object1")then{if(!isnil"object2")then {closeDialog attach_DIALOG;
        player globalchat "now move your Player to calibrate your Objects";
on= true;
        {if(typeof object1 == _x select 2)then {_price= _x select 1; }; }foreach ChopperStoreArray; 
        {if(typeof object2 == _x select 2)then {_price2= _x select 1; }; }foreach ChopperStoreArray; 
        {if(typeof object1 == _x select 2)then {_price= _x select 1; }; }foreach vehicleStoreArray; 
        {if(typeof object2 == _x select 2)then {_price2= _x select 1; }; }foreach vehicleStoreArray; 
        {if(typeof object1 == _x select 2)then {_price= _x select 1; }; }foreach BuildStoreArray; 
        {if(typeof object2 == _x select 2)then {_price2= _x select 1; }; }foreach BuildStoreArray; 
        if((_price+_price2) > _playerMoney) exitWith {hintsilent "You do not have enough money"};
	player setVariable["choco",_playerMoney - (_price + _price2),true];
     //   object2 attachTo [object1,[0,0,0]];
        player globalchat format["you attach successfully your objects for %1$",_price+_price2];
        }else{hint"object2 is empty";};
}else{hint"object1 is empty"};


