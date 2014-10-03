

#include "dialog\attachDefines.sqf";
disableSerialization;

_chopshopDialog = createDialog "attachd";
funStoreCart = 0;

_Dialog = findDisplay attach_DIALOG;
_playerMoney = _Dialog displayCtrl attach_money;
_money = player getVariable "choco";
_playerMoney CtrlsetText format[""];
on= false;
objectMoveup=0;
objectMovelaenge=0;
dir = 0;
objectMovebreite=0;
if(detachCounter > 0)exitwith{detachCounter = 0;};
detachCounter =0;
while{detachCounter <=60 && !on}do {
 detachCounter = detachCounter +1;
 sleep 1;
 if(detachCounter == 60)then{detach object1;detach object2;};
};
