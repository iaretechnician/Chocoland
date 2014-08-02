
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
    //U key
    case 22:
    {
		[0] execVM "client\systems\adminPanel\checkAdmin.sqf";
    };
    
    // Y key
    case 21:
    {
    	[1] execVM "client\systems\adminPanel\checkAdmin.sqf";
    };
    
    //tilde ~
    case 41:
    {
       // if(vehicle player != player) exitwith{};  // Check the player is not a car.
        if(!alive player) exitwith{};  // Check the player is not dead.
       // [] execVM "client\systems\menu\loadmenu.sqf";
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
	case 48:
	{ if(!alive player) exitwith{};if((player getvariable"attach") ==1)then{
		[] spawn loadattach;};
    };
};

_handled;



