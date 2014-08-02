#include "dialog\buildstoreDefines.sqf";
disableSerialization;

//if(objStoreCart > (player getVariable "choco")) exitWith {hintsilent "You do not have enough money"};
//objshop_cart

_playerMoney = player getVariable "choco";
_size = 0;
_price = 0;
_ObjectsInArea = [];

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
 pos = getPosatl player;


// pos = [(pos select 0),(pos select 1),100];
pos = [(pos select 0)+4*sin(dir),(pos select 1)+4*cos(dir),(pos select 2)+100];

//Buy
for [{_x=0},{_x<=_size},{_x=_x+1}] do
{
	_selectedItem = lbCurSel _itemlist;
	_itemText = _itemlist lbText _selectedItem;
	{if(_itemText == _x select 0) then{
	if(0 <= 1) then {
			_price = _x select 1;if(player getvariable"basebuilder" == 1)then{_price = Round(_price /2);};
			if(_price > (player getVariable "choco")) exitWith {hintsilent "You do not have enough money"};
			player setVariable["choco",_playerMoney - _price,true];
                        
			_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "choco"];
                        _spawn = createVehicle [(_x select 2),pos,[], 0,"CAN_COLLIDE"];
			_spawn setDir dir;
                        _spawn setPos pos;
				clearMagazineCargoGlobal _spawn;
				clearWeaponCargoGlobal _spawn;
			_spawn setVariable["original",1,true];
			_spawn setVariable["R3F_LOG_disabled", false, true];
			hintsilent "Building bought - watch the sky";
                _Parachute = "ParachuteBigWest_EP1" createVehicle position _spawn;
		_Parachute setPosatl (getPosatl _spawn);
		_spawn attachTo [_Parachute,[0,0,-1.5]];
              //  waitUntil {(getPos _spawn select 2) < 2};
              paraId = player addAction[('<t color=''#FF33CC''>' + ('Release Object') +  '</t>'),'client\functions\on.sqf'];
               while {(getPos _spawn select 2) > 2 }do
               {_Parachute setVelocity [(velocity player select 0)*3, (velocity player select 1)*3, (velocity _Parachute select 2)];
                sleep 0.1;
                 if(on)then {deTach _spawn;on = false;};
        sleep 0.1;
};
		deTach _spawn;
		sleep 3;
if((_x select 2) == "Land_Barrel_water") then 
{
    _spawn setVariable["water",40,true];
};

if((_x select 2) == "Land_stand_small_EP1") then 
{
    _spawn setVariable["food",40,true];
};
if((_x select 2) == "Misc_cargo_cont_tiny") then 
{
    _spawn setVariable ["basecore",0, true];
};
if((_x select 2) == "76n6ClamShell") then 
{
    _spawn setVariable ["basecore",0, true];
};
//bigobjects_currObject setVariable ["basecore",1, true];
if((_x select 2) == "Land_A_Castle_Bastion" ||(_x select 2) == "Land_A_CraneCon" ||(_x select 2) == "Land_A_statue02" ||(_x select 2) == "Land_A_GeneralStore_01a" ||(_x select 2) == "Land_A_TVTower_Base" ||(_x select 2) == "Land_Barn_Metal" ||(_x select 2) == "Land_A_Office01" ||(_x select 2) == "Land_A_BuildingWIP" ||(_x select 2) == "Land_A_Hospital"||(_x select 2) == "Land_HouseB_Tenement") then 
{
        _spawn setVariable ["objectLocked", true, true];
};
_spawn setPos [(getPos _spawn select 0),(getPos _spawn select 1),0.0014];
    		// Delete parachute
		sleep 15;
		deleteVehicle _Parachute;      
                 _spawn setDamage (0.00);
		} else {
			hintsilent "There is another Building or player blocking the spawn point!";
		};
	}}forEach BuildStoreArray;
};
diag_log format["player:%1 buyed %2 and have now %3 MoneyLeft",name player, _price, (player getVariable"choco")];