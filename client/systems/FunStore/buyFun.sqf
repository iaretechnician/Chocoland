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
			hintsilent "funnystuff bought";
 
		};
	}}forEach FunStoreArray;
};