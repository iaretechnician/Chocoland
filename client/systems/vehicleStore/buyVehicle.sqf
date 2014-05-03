#include "dialog\vehstoreDefines.sqf";
disableSerialization;

_playerMoney = player getVariable "choco";
_size = 0;
_price = 0;
_ObjectsInArea = [];

_dialog = findDisplay vehshop_DIALOG;
_cartlist = _dialog displayCtrl vehshop_cart;
_totalText = _dialog displayCtrl vehshop_total;
_playerMoneyText = _Dialog displayCtrl vehshop_money;
_size = lbSize _cartlist;
_itemlist = _dialog displayCtrl vehshop_item_list;

hintsilent "Checking Purchase";
closeDialog objshop_DIALOG;
   dir = getdir player;
   pos = getPosatl player;
   pos = [(pos select 0)+20*sin(dir),(pos select 1)+20*cos(dir),(pos select 2)+100];
   on = false;

//Buy
for [{_x=0},{_x<=_size},{_x=_x+1}] do
{
	_selectedItem = lbCurSel _itemlist;
	_itemText = _itemlist lbText _selectedItem;
	{if(_itemText == _x select 0) then{
	if(0 <= 1) then {
			_price = _x select 1;
			if(_price > (player getVariable "choco")) exitWith {hintsilent "You do not have enough money"};
			player setVariable["choco",_playerMoney - _price,true];
			_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "choco"];
			hintsilent "Vehicle bought - watch the sky";
                        closeDialog 0;
                        _spawn = createVehicle [(_x select 2),pos,[], 0,"CAN_COLLIDE"];
			_spawn setDir dir;
                        _spawn allowdamage false;
			clearMagazineCargoGlobal _spawn;
			clearWeaponCargoGlobal _spawn;
			_spawn setVariable["original",1,true];
			_spawn setVariable["R3F_LOG_disabled", false, true];                
                _Parachute = "ParachuteBigWest_EP1" createVehicle position _spawn;
		_Parachute setPosatl (getPosatl _spawn);
                _Parachute setVelocity [0, 3, 1];
                _random = Round (random 5);
                _spawn attachTo [_Parachute,[0,0,-1.5]];
		 if (_random == 5) then {
		_smoke = "smokeShellblue" createVehicle position _spawn;
		_smoke setPos (getPos _spawn);
		_smoke attachTo [_Parachute,[0,0,-1.5]];
                };
               /// waitUntil {(getPos _spawn select 2) < 2};
               player globalchat"use W,A,S,D to controll your Parachute, you can also Release with mousewheel";
               paraId = player addAction[('<t color=''#FF33CC''>' + ('Rotate Vehicle 90°') +  '</t>'),'client\functions\on.sqf'];
               while {(getPos _spawn select 2) > 2}do
               {_Parachute setVelocity [(velocity player select 0)*3, (velocity player select 1)*3, (velocity _Parachute select 2)];
             if(on)then {_target = (getDir _spawn) + 90;
	_target = _target - getDir player;_spawn setdir _target;rotate9 = [rotate9, _target];
	publicVariable "rotate9";on = false;};
sleep 0.1;
};
player removeaction paraId;
on = false;
		deTach _spawn;
		sleep 3;
		//_spawn setPos [(getPos _spawn select 0),(getPos _spawn select 1),0.001];
    		// Delete parachute
		sleep 15;
		deleteVehicle _Parachute;
                 _spawn setDamage (0.00);
                 _spawn allowdamage true;
		} else {
			hintsilent "There is another vehicle or player blocking the spawn point!";
		};
	}}forEach vehicleStoreArray;
};

diag_log format["player:%1 buyed %2 and have now %3 MoneyLeft",name player, _price, (player getVariable"choco")];