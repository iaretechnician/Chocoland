


//	@file Version: 1.0
//	@file Name: onKeyPress.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:


private["_handled", "_faceCP", "_faceVP"];

_key     = _this select 1;
_shift   = _this select 2;
_handled = false;

switch _key do
{      
    // window key
    case 219:
    {
        player setVariable ["ShowNameAllies", true];
        [] spawn {
        sleep 5;
        player setVariable ["ShowNameAllies", false];
        };
    };
        //U key
    case 22:
    {
		execVM "client\systems\adminPanel\playerMenu.sqf";
    };
    
    // Y key
    case 21:
    {
    	[1] execVM "client\systems\adminPanel\checkAdmin.sqf";
    };
     case 63: // f5
    {
    	[] execVM "client\systems\menu\loadmenu.sqf";
    };
     case 64://f6
    {
    	[] execVM "client\chocofunc\restoreObjects.sqf";
    };
    //tilde ~
     case 61://f3
    {
    	[] execVM "client\systems\gunStore\smartammo.sqf"
    };
    
    case 41:
    {
      
        if(!alive player) exitwith{};  // Check the player is not dead.
      
        [] call loadPlayerMenu;
    };
     case 38: //L
    {
       
       if (isnil "pressL") then {pressL = 0;}; if (pressL == 0) then {pressL = 1;player globalchat format ["Do you really want to buy your Loadout which costs %1, if yes press L again! ",geld];} else {pressL = 0;[]execVM"client\systems\gunStore\loadout.sqf";};
    };
    //o key
	case 24:
    {
	if( player distance doorobject < 30) then{ _nic = [player, doorobject, "per", rHideobject, true] call RE; cooldown = 3; if(behindi == 1)then{execVM "client\functions\cooldown.sqf"; };};
    };
	case 20:// t
	{ if(!alive player) exitwith{};if((player getvariable"attach") ==1)then{
		[] spawn loadattach;};
    };
    case 76:// 	NUM_5 
     {_uid = getPlayerUID player;if (_uid in serverAdministrators) then {deleteVehicle cursorTarget;};
    };
};

_handled;



