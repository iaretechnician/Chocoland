
//	@file Version: 1.0
//	@file Name: buyGuns.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = buy to player 1 = buy to crate)]

#include "dialog\gunstoreDefines.sqf";
disableSerialization;
if(gunStoreCart > (player getVariable "cmoney")) exitWith {hint "You do not have enough money"};

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat "ERROR: ALREADY PERFORMING ANOTHER ACTION!";
};	

// Check if player is alive.
if(!(alive player)) exitWith {
	player globalChat "ERROR: YOU ARE CURRENTLY DEAD.";
    closeDialog 0;
};	

mutexScriptInProgress = true;



private ["_name"];

//Initialize Values
_switch = _this select 0;

_playerMoney = player getVariable "cmoney";
_size = 0;
_price = 0;
// Grab access to the controls
_dialog = findDisplay gunshop_DIALOG;
_cartlist = _dialog displayCtrl gunshop_cart;
_totalText = _dialog displayCtrl gunshop_total;
_playerMoneyText = _Dialog displayCtrl gunshop_money;
_size = lbSize _cartlist;
// custom
dir = getdir player;
   pos = getPos player;
   pos = [(pos select 0)+20*sin(dir),(pos select 1)+20*cos(dir),100];
_currBox = createVehicle ["USBasicAmmunitionBox", pos,[],0, "NONE"];
        _currBox = setDir dir;
        clearMagazineCargoGlobal _currBox;
	clearWeaponCargoGlobal _currBox;
        _currBox allowdamage false;
        _currBox setVariable["original",1,true];
	_currBox setVariable["R3F_LOG_disabled", false, true];
        _Parachute = "BIS_Steerable_Parachute_EP1" createVehicle position _currBox;
	_Parachute setPos (getPos __currBox);
        _Parachute setVelocity [0, 3, 5];
        _random = Round (random 5);
        _currBox attachTo [_Parachute,[0,0,-3]];
	 if (_random == 5) then 
         {
		_smoke = "smokeShellblue" createVehicle position _currBox;
		_smoke setPos (getPos _currBox);
		_smoke attachTo [_Parachute,[0,0,-1.5]];
         };
switch(_switch) do 
{
	//Buy To Player
	case 0: 
	{
		for [{_x=0},{_x<=_size},{_x=_x+1}] do
		{
			_itemText = _cartlist lbText _x;

			{if(_itemText == _x select 0) then{
				_class = _x select 1;
				_currBox addWeaponCargoGlobal [_class, 1];
			}}forEach weaponsArray;

			{if(_itemText == _x select 0) then{
				_class = _x select 1;
				_currBox addMagazineCargoGlobal [_class, 1];
			}}forEach ammoArray;

			{if(_itemText == _x select 0) then{
				_class = _x select 1;
				_currBox addWeaponCargoGlobal [_class, 1];
			}}forEach accessoriesArray;
		};

		player setVariable["cmoney",_playerMoney - gunStoreCart,false];
		_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "cmoney"];

		gunStoreCart = 0;
		_totalText CtrlsetText format["Total: $%1", gunStoreCart];
		lbClear _cartlist;
	};
};

mutexScriptInProgress = false;
waitUntil {(getPos _currBox select 2) < 3};
		deTach _currBox;
		// Delete parachute
		sleep 13;
		deleteVehicle _Parachute;
                
                _currBox setDamage (0.00);
                 _currBox allowdamage true;
               //endeditScript