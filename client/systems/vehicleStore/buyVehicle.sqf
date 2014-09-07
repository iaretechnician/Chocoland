

#include "dialog\vehstoreDefines.sqf";
disableSerialization;
cowcycle= {
 player setVariable["choco",_playerMoney - _price,true];closeDialog 0; dir=getdir player; _pos = getposatl player;_pos = [(_pos select 0)+5*sin(dir),(_pos select 1)+5*cos(dir),(_pos select 2)];_grp = creategroup civilian;  _spawn = _grp createunit ["Cow04",_pos,[],0,"FORM"];  _spawn setPos _pos; 
 spawn2 = createVehicle["Old_moto_TK_Civ_EP1",_pos,[], 0,"CAN_COLLIDE"];spawn2 setdir ( getdir player);_spawn attachto [spawn2,[-0.2,-0.55,-1.8]];  spawn2 setObjectTexture [0, ""];spawn2 setObjectTexture [1, ""];
 publicvariable"spawn2";  _randomPos=getpos player;_inArea = _randomPos nearEntities 22222;     {   if (isPlayer _x) then {  _x setVehicleInit "spawn2 setobjecttexture [1,''];spawn2 setobjecttexture [0,''];";
 processInitCommands; };} forEach _inArea;   player moveindriver spawn2;  player assignAsDriver spawn2;
};
pchelabqm={
	player setVariable["choco",_playerMoney - _price,true];closeDialog 0;
	dir=getdir player; _pos = getposatl player;_pos = [(_pos select 0)+5*sin(dir),(_pos select 1)+5*cos(dir),(_pos select 2)];_Parachute = "Pchela1T" createVehicle _pos; _Parachute setPos _pos;_Parachute setdir ( getdir player);
	_pos= [(_pos select 0),(_pos select 1), (_pos select 2)];_Parachute2 = "Pchela1T" createvehicle _pos;
	_Parachute setPos _pos;_Parachute2 attachTo [_Parachute,[0,1.5,0]];_Parachute3 = "Chukar" createvehicle _pos;
	_Parachute setPos _pos;_Parachute3 attachTo [_Parachute,[1,0,0.7]];  _Parachute4 = "Chukar" createvehicle _pos; _Parachute setPos _pos;_Parachute4 attachTo [_Parachute,[-1,0,0.7]];  
	player moveindriver _Parachute;  player assignAsDriver _Parachute;_Parachute addWeapon "Bomblauncher";_Parachute addMagazine "6Rnd_GBu12_AV8B";
};
adminplane= {
	player setVariable["choco",_playerMoney - _price,true];closeDialog 0;
	dir=getdir player; _pos = getposatl player;_pos = [(_pos select 0)+5*sin(dir),(_pos select 1)+5*cos(dir),(_pos select 2)];_Parachute = "MV22" createVehicle _pos; _Parachute setPos _pos;_Parachute setdir ( getdir player);_pos= [(_pos select 0)+30,(_pos select 1), (_pos select 2)];_Parachute2 = "C130J" createvehicle _pos; _Parachute setPos _pos;_Parachute2 attachTo [_Parachute,[0,-12,0]];_Parachute2 = "C130J" createvehicle _pos; _Parachute setPos _pos;_Parachute2 attachTo [_Parachute,[0,12,0]];
_Parachute addWeapon "Gau12";_Parachute addMagazine "300Rnd_25mm_GAU12";_Parachute addWeapon "Bomblauncher";_Parachute addMagazine "6Rnd_GBu12_AV8B";
 _Parachute addWeapon "CMFlareLauncher";_Parachute addMagazine "120Rnd_CMFlare_Chaff_Magazine";player moveindriver _Parachute;  player assignAsDriver _Parachute;
	};
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
closeDialog vehshop_DIALOG;
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
			if(_x select 2 == "cowcycle") exitWith {[] call cowcycle;};
			if(_x select 2 == "pchelabqm") exitWith {[] call pchelabqm;};
			if(_x select 2 == "adminplane") exitWith {[] call adminplane;};
                        player setVariable["choco",_playerMoney - _price,true];
                         _y= player getvariable"highscore"; player setvariable["highscore",[_y select 0,_y select 1,_y select 2,_y select 3,(_y select 4)+_price,_y select 5,_y select 6, _y select 7],true];
         
                        PDB_saveReq = getPlayerUID player;
                        publicVariableServer "PDB_saveReq";
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
// Delete parachute
sleep 15;
deleteVehicle _Parachute;
_spawn setDamage (0.00);
                 _spawn allowdamage true;
                 
diag_log_server = parsetext format["player:%1 buyed %2 for %3 and have now %4 MoneyLeft",name player,_x select 2, _price, (player getVariable"choco")];
publicvariableserver "diag_log_server";
		} else {
			hintsilent "There is another vehicle or player blocking the spawn point!";
		};
	}}forEach vehicleStoreArray;
};
