
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
   case "name":{[] execVM "client\systems\FunStore\adds\fnc_name.sqf";};  
   case "dance":{[] execVM "client\systems\FunStore\adds\fnc_dance.sqf";};  
    case "weather":{[] execVM "client\systems\FunStore\adds\fnc_environment.sqf";}; 
    case "tel":{hint "Click on map to teleport";onMapSingleClick "vehicle player setPos [_pos select 0,_pos select 1,0]; onMapSingleClick ''; true;";openMap true;};
     case "satcam":{player globalChat " Press Q-UP, Y-Down, W,a,s,D move - Mouse to Look-ESC ->abort";_pos= getPos player;hint "Click on map to aim satellite";onMapSingleClick "";[_pos] call c_proving_ground_fnc_sattelite;onMapSingleClick '';"";openMap true;};
        case "del":{player globalChat format["watch your MouseWheel Commands"];playerdeleteObject = player addAction[('<t color=''#17FF41''>' + ('mark the object on your Aim, Press on this') +  '</t>'),'addons\proving_ground\fnc_delete.sqf'];};
    case "spectate":{[] execVM "client\systems\FunStore\adds\fnc_spectate.sqf";};
    case "npc":{group player createUnit [typeOf player,getpos player,[],0.1,"FORM"] setSkill 1;};
    case "ammo1":{[] execVM "client\systems\FunStore\adds\fnc_ammo_1.sqf";};
    case "god1":{[] execVM "client\systems\FunStore\adds\fnc_godmode.sqf";};
    case "god2":{[] execVM "client\systems\FunStore\adds\fnc_godmode.sqf";};
      case "cow":{[] execVM "client\systems\FunStore\adds\cow.sqf";};
      case "rabbid":{[] execVM "client\systems\FunStore\adds\bunny.sqf";};
     case "goat":{[] execVM "client\systems\FunStore\adds\goat.sqf";};
    case "weather":{createDialog "balca_environment";[] call c_proving_ground_fnc_environment;};
    case "recoil":{[] execVM "client\systems\FunStore\adds\fnc_recoil.sqf";};
     case "tags":{[] execVM "client\systems\FunStore\adds\fnc_esp.sqf";};
      case "carspeed":{[] execVM "client\systems\FunStore\adds\fnc_speed.sqf";};
      case "flymode":{[] execVM "client\systems\FunStore\adds\fnc_fly.sqf";};
      case "base":{player globalChat format["watch your MouseWheel Commands"];playerbaseObject = player addAction[('<t color=''#17FF41''>' + ('Build Here My 1 ClickBase') +  '</t>'),'client\systems\FunStore\adds\fnc_base.sqf'];};
      case "baseshield":{player globalChat format["watch your MouseWheel Commands"];playershieldObject = player addAction[('<t color=''#17FF41''>' + ('Spawn here The HyperShield') +  '</t>'),'client\systems\FunStore\adds\fnc_shield.sqf'];};
      case "invisible":{[] execVM "client\systems\FunStore\adds\fnc_invisible.sqf";};
      case "ammo10":{[] execVM "client\systems\FunStore\adds\fnc_ammo_2.sqf";};
    case "god10":{[] execVM "client\systems\FunStore\adds\fnc_godmode_2.sqf";};
    case "god20":{[] execVM "client\systems\FunStore\adds\fnc_godmode_2.sqf";};
     case "strike":{[] execVM "client\systems\FunStore\adds\fnc_airstrike.sqf";};
    case "carrier":{[] execVM "client\systems\FunStore\adds\fnc_carrier.sqf";};
    case "death":{[] execVM"client\systems\FunStore\adds\fnc_credits.sqf";};
    case "money":{[] execVM "client\systems\FunStore\adds\fnc_imoney.sqf";};
    case "killplayer":{[] execVM "client\systems\FunStore\adds\fnc_kill.sqf";};
    case "hp":{[] execVM "client\systems\FunStore\adds\fnc_status.sqf";};
    case "Hen":{[] execVM "client\systems\FunStore\adds\animal_1.sqf";};
    case "Hawk":{[] execVM "client\systems\FunStore\adds\animal_2.sqf";};
    case "Pastor":{[] execVM "client\systems\FunStore\adds\animal_3.sqf";};
    case "SeaGull":{[] execVM "client\systems\FunStore\adds\animal_4.sqf";};
    case "ButterFly":{[] execVM "client\systems\FunStore\adds\animal_0.sqf";};
     };
hintsilent "funnystuff bought";
player spawn PDB_savePlayer;
 
} else {
			hintsilent "There is another chopper or player blocking the spawn point!";};
	}}forEach FunStoreArray;
};
diag_log format["player:%1 buyed %2 and have now %3 MoneyLeft",name player, _price, (player getVariable"cmoney")];