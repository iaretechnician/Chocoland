#include "dialog\attachDefines.sqf";
disableSerialization;
_playerMoney = player getVariable "choco";
_price = 0;
_price2 =0;
_pricePercent=Round(_playerMoney /100);
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
        if(_price > (player getVariable "choco")) exitWith {hintsilent "You do not have enough money"};
	player setVariable["choco",_playerMoney - (_price + _price2+_pricePercent),true];
     //   object2 attachTo [object1,[0,0,0]];
        player globalchat format["you attach successfully your objects for %1$",_price+_price2+_pricePercent];
        }else{hint"object2 is empty";};
}else{hint"object1 is empty"};


