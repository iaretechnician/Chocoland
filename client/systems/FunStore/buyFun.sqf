#include "dialog\FunStoreDefines.sqf";
disableSerialization;
_playerMoney = player getVariable "cmoney";
_size = 0;
_price = 0;
_ObjectsInArea = [];

_dialog = findDisplay funshop_DIALOG;
_cartlist = _dialog displayCtrl funshop_cart;
_totalText = _dialog displayCtrl funshop_total;
_playerMoneyText = _Dialog displayCtrl funshop_money;
_size = lbSize _cartlist;
_itemlist = _dialog displayCtrl funshop_item_list;

hintsilent "Checking Purchase";
closeDialog funshop_DIALOG;
  //Buy
for [{_x=0},{_x<=_size},{_x=_x+1}] do
{
	_selectedItem = lbCurSel _itemlist;
	_itemText = _itemlist lbText _selectedItem;
	{if(_itemText == _x select 0) then{
		sleep 1;
		if(0 <= 1) then {
			_price = _x select 1;
			if(_price > (player getVariable "cmoney")) exitWith {hintsilent "You do not have enough money"};
			player setVariable["cmoney",_playerMoney - _price,true];
			_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];
            switch (_x select 2) do
{
    case "dance":{[] execVM "addons\proving_ground\fnc_dance.sqf";};  
    case "weather":{[] execVM "addons\proving_ground\fnc_environment.sqf";}; 
    //case "tel":{player setPos [_pos select 0,_pos select 1,0]; onMapSingleClick ""; openMap true;};
    case "del":{playerdeleteObject = player addAction[('<t color=''#FF11AA''>' + ('mark the object on your Aim, Press on this') +  '</t>'),'addons\proving_ground\fnc_delete.sqf'];
              };
    case "spectate":{[] execVM "addons\proving_ground\fnc_spectate.sqf";};
    case "npc":{group player createUnit [typeOf player,getpos player,[],0.1,"FORM"] setSkill 1;};
    case "ammo1":{[1] execVM "addons\proving_ground\fnc_ammo_1.sqf";};
    case "god1":{[1] execVM "addons\proving_ground\fnc_godmone_1.sqf";};
    case "god2":{[1] execVM "addons\proving_ground\fnc_godmone_1.sqf";};
      case "cow":{[] execVM "cow.sqf";};
      case "rabbid":{[] execVM "bunny.sqf";};
     case "goat":{[] execVM "goat.sqf";};
    
   };
hintsilent "funnystuff bought";
 
} else {
			hintsilent "There is another chopper or player blocking the spawn point!";};
	}}forEach FunStoreArray;
};