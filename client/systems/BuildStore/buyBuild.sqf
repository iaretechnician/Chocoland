#include "dialog\buildstoreDefines.sqf";
disableSerialization;

//if(objStoreCart > (player getVariable "cmoney")) exitWith {hintsilent "You do not have enough money"};
//objshop_cart

_playerMoney = player getVariable "cmoney";
_size = 0;
_price = 0;
_ObjectsInArea = [];

//_price = _x select 1;
//if(_price > (player getVariable "cmoney")) exitWith {hintsilent "You do not have enough money"};

// Grab access to the controls
_dialog = findDisplay buildshop_DIALOG;
_cartlist = _dialog displayCtrl buildshop_cart;
_totalText = _dialog displayCtrl buildshop_total;
_playerMoneyText = _Dialog displayCtrl buildshop_money;
_size = lbSize _cartlist;
_itemlist = _dialog displayCtrl buildshop_item_list;

hintsilent "Checking Purchase";
closeDialog objshop_DIALOG;
 dir = getdir player;
   pos = getPos player;
   pos = [(pos select 0)+20*sin(dir),(pos select 1)+20*cos(dir),100];
 
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
			_spawn = createVehicle [(_x select 2),pos,[], 0,"CAN_COLLIDE"];
			_spawn setDir dir + 180;
				clearMagazineCargoGlobal _spawn;
				clearWeaponCargoGlobal _spawn;
			_spawn setVariable["original",1,true];
			_spawn setVariable["R3F_LOG_disabled", false, true];
			player setVariable["cmoney",_playerMoney - _price,true];
			_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];
			hintsilent "Building bought - Follow the arrows to the spawn point";
                  
                _Parachute = "ParachuteBigWest_EP1" createVehicle position _spawn;
		_Parachute setPos (getPos _spawn);
		_smoke = "smokeShellblue" createVehicle position _spawn;
		_smoke setPos (getPos _spawn);
		_spawn attachTo [_Parachute,[0,0,-1.5]];
		_smoke attachTo [_Parachute,[0,0,-1.5]];
                waitUntil {(getPos _spawn select 2) < 2};
		deTach _spawn;
		sleep 3;
              
		_spawn setPos [(getPos _spawn select 0),(getPos _spawn select 1),0.001];

    		// Delete parachute
		sleep 15;
		
		deleteVehicle _Parachute;
                
                 _spawn setDamage (0.00);
		} else {
			hintsilent "There is another Building or player blocking the spawn point!";
		};
	}}forEach BuildStoreArray;
};