
multiobjects== 0
#include "dialog\chopstoreDefines.sqf";
disableSerialization;
_playerMoney = player getVariable "choco";
_size = 0;
_price = 0;
_ObjectsInArea = [];
_dialog = findDisplay chopshop_DIALOG;
_cartlist = _dialog displayCtrl chopshop_cart;
_totalText = _dialog displayCtrl chopshop_total;
_playerMoneyText = _Dialog displayCtrl chopshop_money;
_size = lbSize _cartlist;
_itemlist = _dialog displayCtrl chopshop_item_list;

hintsilent "Checking Purchase";
closeDialog objshop_DIALOG;
   dir = getdir player;
   pos = getPosATL player;
     pos = [(pos select 0),(pos select 1),(pos select 2)+100];
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
                         _y= player getvariable"highscore"; player setvariable["highscore",[_y select 0,_y select 1,_y select 2,_y select 3,(_y select 4)+_price,_y select 5,_y select 6, _y select 7],true];
         
PDB_saveReq = getPlayerUID player;
publicVariableServer "PDB_saveReq";
			_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "choco"];
			hintsilent "Chopper bought - watch the sky";
                        closeDialog 0;
                        _spawn = createVehicle[(_x select 2),pos,[], 0,"CAN_COLLIDE"];
			_spawn setDir dir;
                     _spawn allowdamage false;
			clearMagazineCargoGlobal _spawn;
			clearWeaponCargoGlobal _spawn;
			_spawn setVariable["original",1,true];
			_spawn setVariable["R3F_LOG_disabled", false, true];
         
              _Parachute = "ParachuteBigWest_EP1" createVehicle position _spawn;
		_Parachute setPosATL (getPosATL _spawn);
                _Parachute setVelocity [0, 3, 0];
                 _spawn attachTo [_Parachute,[0,0,-1.5]];
		_smoke = "smokeShellblue" createVehicle position _spawn;
		_smoke setPos (getPos _spawn);
		_smoke attachTo [_Parachute,[0,0,-1.5]];
              
            player globalchat"use W,A,S,D to controll your Parachute, you can Rotate with mousewheel";
              paraId = player addAction[('<t color=''#FF33CC''>' + ('Rotate Vehicle 90°') +  '</t>'),'client\functions\on.sqf'];
               while {(getPos _spawn select 2) > 2 and (alive _Parachute)and  (alive _spawn)}do
               {_Parachute setVelocity [(velocity player select 0)*3, (velocity player select 1)*3, (velocity _Parachute select 2)*1.07];
             if(on)then {_spawn setdir ((getDir _spawn) + 90);
	rotate9 = [rotate9, _spawn];
	publicVariable "rotate9";on = false;};
sleep 0.1;
};
player removeaction paraId;
on = false;
deTach _spawn;
sleep 3;

		deleteVehicle _Parachute;
                 _spawn setDamage (0.00);
                 _spawn allowdamage true;

diag_log_server = parsetext format["player:%1 buyed %2 for %3 and have now %4 MoneyLeft",name player,_x select 2, _price, (player getVariable"choco")];
publicvariableserver "diag_log_server";
		} else {
			hintsilent "There is another chopper or player blocking the spawn point!";
		};
	}}forEach ChopperStoreArray;
};

