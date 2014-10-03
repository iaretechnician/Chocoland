

#include "dialog\attachDefines.sqf";
disableSerialization;
_playerMoney = player getVariable "choco";
_price = 1000;
_price2= 1000;
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
	player setVariable["choco",_playerMoney - (_price + _price2*4),true];
    _y= player getvariable"highscore"; player setvariable["highscore",[_y select 0,_y select 1,_y select 2,_y select 3,(_y select 4)+(_price + _price2*4),_y select 5,_y select 6, _y select 7],true];
         
        player globalchat format["you attach successfully your objects for %1$",(_price + _price2*4)];
        }else{hint"object2 is empty";};
}else{hint"object1 is empty"};


