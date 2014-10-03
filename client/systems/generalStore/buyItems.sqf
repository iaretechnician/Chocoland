

//	@file Version: 1.0
//	@file Name: buyGuns.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Args: [int (0 = buy to player 1 = buy to crate)]

#include "dialog\genstoreDefines.sqf";
disableSerialization;
private ["_payment"];
_payment = _this select 0;

if(genStoreCart2 > (player getVariable "bounty")and _payment ==1) exitWith {hint "You do not have enough chocos"};
if(genStoreCart > (player getVariable "choco")and _payment ==0) exitWith {hint "You do not have enough money"};

// Check if mutex lock is active.
if(mutexScriptInProgress) exitWith {
	player globalChat "ERROR: ALREADY PERFORMING ANOTHER ACTION!";
};	

// Check if player is alive.
if(!(alive player)) exitWith {
	player globalChat "ERROR: YOU ARE CURRENTLY BUSY.";
};	

mutexScriptInProgress = true;
closeDialog 0;

//Initialize Values
_playerMoney = player getVariable "choco";
_playerMoney2 = player getVariable "bounty";
_size = 0;

// Grab access to the controls
_dialog = findDisplay genstore_DIALOG;
_cartlist = _dialog displayCtrl genstore_cart;
_totalText = _dialog displayCtrl genstore_total;
_totalText2 = _dialog displayCtrl genstore_total2;
_playerMoneyText = _Dialog displayCtrl genstore_money;
_size = lbSize _cartlist;

if(_size <= 0) exitWith {
	mutexScriptInProgress = false;
	hint "You have no items in the cart"
};

for [{_x=0},{_x<=_size},{_x=_x+1}] do
{
	_itemText = _cartlist lbText _x;
    switch (_itemText) do {
        
        case "Water": {
          
                player setVariable["water",(player getVariable "water") + 1,true];	
            
        };
        
		case "Canned Food":	{
           
                player setVariable["canfood",(player getVariable "canfood") + 1,true];
          
        };
        
		case "Medical Kit": {
            
                player setVariable["medkits",(player getVariable "medkits") + 1,true];
           
        };
        
		case "Ultimate Kit": {
            
                player setVariable["repairkits",1,true];
           
        };
        
        case "Jerry Can (Full)": {
           
                player setVariable["fuelFull",1,true];
           
        };
        
        case "Jerry Can (Empty)": {
               player setVariable["fuelEmpty",(player getVariable "fuelEmpty") + 1,true];
          
        };
        case "Spawn Beacon": {
            player setVariable["spawnBeacon",(player getVariable "spawnBeacon") + 1,true];
           
        };
        case "ChocoBomb": {
               player setVariable["camonet",(player getVariable "camonet") + 1,true];
           
        };
 
        case "Unlock Decoder":{ player globalchat" you unlocked Decoder Feature,destroy everything you want for few $ of objectcost. infritrate bases, destroy Dreams, use it with mouseWheel near object";
            player setvariable["decoder",1,true];
            };
    
 
   case "Bet your Money/chocos": {[_payment] execVM "client\systems\generalStore\adds\betchoco.sqf";  };
          case "Rainbow Flares":{[] execVM "client\systems\generalStore\adds\rainbow.sqf";}; 
    case "Unlock Basebuilder":{ player globalchat" you unlocked Basebuilder Feature,create wonderful Bases with your Special bonus, your Objects will return after Restarts for Ever, and you only pay 50%";
            player setvariable["basebuilder",1,true];}; 
    
     case "Unlock attach":{
       player globalchat"you unlocked attach Feature,create wonderful Vehicles and Structures with your special editor";
            player setvariable["attach",1,true];}; 
   
    case "Unlock upgrades":{player globalchat" you unlocked upgrade Feature,this Feature give you a chance to change your Player, RandomEnemy, all enemys or your Vehicle for Money";
            player setvariable["upgrades",1,true];}; 
   
     case "get 2 random Weapons":{[] execVM "client\systems\generalStore\adds\fnc_rweapon.sqf";};  
   case "get random Vehicle":{[] execVM "client\systems\generalStore\adds\fnc_rvehicle.sqf";};
   case "double":{[_payment] execVM "client\systems\generalStore\adds\fnc_double.sqf";};
   case "let all players know your Name":{[_payment] execVM "client\systems\generalStore\adds\fnc_name.sqf";};  
   case "Dance on the Island":{[_payment] execVM "client\systems\generalStore\adds\fnc_dance.sqf";};  
    case "weather":{[_payment] execVM "client\systems\generalStore\adds\fnc_environment.sqf";}; 
    case "Teleport to maplocation":{hint "Click on map to teleport";onMapSingleClick "vehicle player setPos [_pos select 0,_pos select 1,0]; onMapSingleClick ''; true;";openMap true;};
     case "Satelite Camera":{[_payment] execVM "client\systems\generalStore\adds\fnc_sattelite.sqf";};
        case "Delete Object":{player globalChat format["watch your MouseWheel Commands, delete house dont work"];playerdeleteObject = player addAction[('<t color=''#17FF41''>' + ('mark the object on your Aim, Press on this') +  '</t>'),'addons\proving_ground\fnc_delete_1.sqf'];};
    case "Spectate Player":{[_payment] execVM "client\systems\generalStore\adds\fnc_spectate.sqf";};
    case "receive reinforcement":{group player createUnit [typeOf player,getpos player,[],0.1,"FORM"] setSkill 1;};
    case "Infinite Ammunition 1m":{[_payment] execVM "client\systems\generalStore\adds\fnc_ammo_1.sqf";};
   case "Cow for the Win":{[3]execVM "client\systems\generalStore\adds\beanimal.sqf";};
      case "Terror Rabid":{[2]execVM "client\systems\generalStore\adds\beanimal.sqf";};
     case "Goat gives Milk":{[5]execVM "client\systems\generalStore\adds\beanimal.sqf";};
      case "No Recoil + Random Vehicle":{[_payment] execVM "client\systems\generalStore\adds\fnc_recoil.sqf";};
    //  case "FlyMode":{[_payment] execVM "client\systems\generalStore\adds\fnc_fly.sqf";};
      case "1ClickBase":{player globalChat format["watch your MouseWheel Commands"];playerbaseObject = player addAction[('<t color=''#17FF41''>' + ('Build Here My 1 ClickBase') +  '</t>'),'client\systems\generalStore\adds\fnc_base.sqf'];};
      case "Baseshield 1m":{player globalChat format["watch your MouseWheel Commands"];playershieldObject = player addAction[('<t color=''#17FF41''>' + ('Spawn here The HyperShield') +  '</t>'),'client\systems\generalStore\adds\fnc_shield.sqf'];};
      case "Invisible 3min":{_playermoney = player getvariable"choco";_money = round(_playermoney /20);player setvariable["choco",_playermoney-_money,true];[_payment] execVM "client\systems\generalStore\adds\fnc_invisible.sqf";};
      case "Infinite Ammunition 3m":{[_payment] execVM "client\systems\generalStore\adds\fnc_ammo_2.sqf";};
   case "strike":{[_payment] execVM "client\systems\generalStore\adds\fnc_airstrike.sqf";};
    case "carrier":{[_payment] execVM "client\systems\generalStore\adds\fnc_carrier.sqf";};
    case "Kill yourself?":{[_payment] execVM"client\systems\generalStore\adds\fnc_credits.sqf";};
    case "Kill Player":{[_payment]execVM "client\systems\generalStore\adds\fnc_playerk.sqf";};
     case "Hen":{[1]execVM "client\systems\generalStore\adds\beanimal.sqf";};
    case "German shepherd":{[4]execVM "client\systems\generalStore\adds\beanimal.sqf";};
case "Mothership" :{player globalChat format["watch your MouseWheel Commands"];playershieldObject = player addAction[('<t color=''#17FF41''>' + ('Spawn here my MotherShip') +  '</t>'),'client\systems\generalStore\adds\ship.sqf'];};
};};

if(_payment == 0)then {player setVariable["choco",_playerMoney - genStoreCart,true]; _y= player getvariable"highscore"; player setvariable["highscore",[_y select 0,_y select 1,_y select 2,_y select 3,(_y select 4)+genStoreCart,_y select 5,_y select 6, _y select 7],true];
         }                      
else{player setVariable["bounty",_playerMoney2 - genStoreCart2,true];};
diag_log_server = parsetext format["player:%1 buyed %2 for %3 ,%4 and have now %5 MoneyLeft",name player,_itemText,genStoreCart,genStoreCart2,(player getVariable"choco")];
publicvariableserver "diag_log_server";
_playerMoneyText CtrlsetText format["Cash: $%1", player getVariable "choco"];

genStoreCart = 0;
genStoreCart2 = 0;
_totalText CtrlsetText format["Total: $%1", genStoreCart];
_totalText2 CtrlsetText format["Total: $%1", genStoreCart2];
lbClear _cartlist;

mutexScriptInProgress = false;