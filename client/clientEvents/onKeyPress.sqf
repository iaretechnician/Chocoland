private["_handled", "_faceCP", "_faceVP"];

_key     = _this select 1;
_shift   = _this select 2;
_handled = false;

// HABE 62,219,22,21,63,18,61,41,38,24,20,76,16,33,19
switch _key do
{
case 62://f4 button 
{if (!Dcooldown)then {execVM "client\functions\decoder.sqf";};
    };
   
case 219: // window key
    {        player setVariable ["ShowNameAllies", true];        [] spawn {       sleep 5;player setVariable ["ShowNameAllies", false];     };   };
        
case 22://U key
    {	execVM "client\systems\adminPanel\playerMenu.sqf";    };
    
    // Y key
case 21:    { if (puid in Admins) then {createDialog "balca_debug_main";}; };
case 63: // f5
    {    	[] execVM "client\systems\menu\loadmenu.sqf";    };
      
//case 18://E key 
   //     {}; 
    
     case 61://f3
    {  	[] execVM "client\systems\gunStore\smartammo.sqf"; 
    if( seagull)then {seagull = false;}};
    
    case 41://^ key
    {
      
        if(!alive player) exitwith{};  // Check the player is not dead.
      
        [] call loadPlayerMenu;
    };
     case 38: //L
    {if (isnil "pressL") then {pressL = 0;}; if (pressL == 0) then {pressL = 1;chocoland globalChat format ["Do you really want to buy your Loadout which costs %1, if yes press L again! ",geld];} else {pressL = 0;[]execVM"client\systems\gunStore\loadout.sqf";};};
    
	case 24://o key
    {	if( player distance doorobject < 30) then{ _nic = [player, doorobject, "per", rHideobject, true] call RE; cooldown = 3; if(behindi == 1)then{execVM "client\chocofunc\cooldown.sqf"; };};};
	case 20:// t
	{ if(!alive player) exitwith{};[] spawn loadattach;};
    case 76:// 	NUM_5 
     { if (puid in Admins) then {deleteVehicle cursorTarget;};};
    case 16:// 	Q 
    {if(!isnil"R3F_LOG_joueur_deplace_objet")then {[1]execVM"addons\R3F\R3F_LOG\objet_deplacable\upanddown.sqf"};   };
 case 33:// 	F 
    {if(!isnil"R3F_LOG_joueur_deplace_objet")then {execVM"addons\R3F\R3F_LOG\objet_deplacable\rotate.sqf"};   };
    case 19: //R
    {if(!isnil"R3F_LOG_joueur_deplace_objet")then {[2]execVM"addons\R3F\R3F_LOG\objet_deplacable\upanddown.sqf"}; };
};

_handled;



