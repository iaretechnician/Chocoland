#include "dialog\attachDefines.sqf";
disableSerialization;
_playerMoney = player getVariable "cmoney";
_price = 1000;
_price2= 1000;
_dialog = findDisplay attach_DIALOG;

//Buy
if(!isnil"object1")then{
    funStoreCart = 1;closeDialog attach_DIALOG;// color change
 
    if(!isnil"object2")then {
   
        chocoland globalChat "now move your Player to calibrate your Objects";
on= true;
     
        if(1000 > _playerMoney) exitWith {hintsilent "You do not have enough money"};
	player setVariable["cmoney",_playerMoney - 1000,true];[]call savePlayer;
    _y= player getvariable["highscore",[0,0,0,0,0,0,0,0]]; _y set [4,(_y select 4)+(_price + _price2*4)];player setvariable["highscore",_y ,false];
         
        chocoland globalChat format["you attach successfully your objects for %1$",(_price + _price2*4)];
        }else{hint"object2 is empty";};
}else{hint"object1 is empty"};


