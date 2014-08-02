//	@file Version: 1.0
//	@file Name: optionSelect.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define serverAdminMenu_option 50007
#define modMenu_option 50005
#define debugMenu_option 50003
#define adminMenu_option 50001
disableSerialization;

private ["_panelType","_displayAdmin","_displayMod","_displayServerAdmin","_displayDebug","_modSelect","_adminSelect","_serverAdminSelect","_debugSelect"];
_uid = getPlayerUID player;
if ((_uid in moderators) OR (_uid in administrators) OR (_uid in serveradministrators)) then {
	_panelType = _this select 0;
	
	_displayAdmin = uiNamespace getVariable "AdminMenu";
	_displayMod = uiNamespace getVariable "ModMenu";
	_displayServerAdmin = uiNamespace getVariable "ServerAdminMenu";
	_displayDebug = uiNamespace getVariable "DebugMenu";
	
	_modSelect = _displayMod displayCtrl modMenu_option;
	_adminSelect = _displayAdmin displayCtrl adminMenu_option;
	_serverAdminSelect = _displayServerAdmin displayCtrl serverAdminMenu_option;
	_debugSelect = _displayDebug displayCtrl debugMenu_option;
	
	switch (_panelType) do
	{   
            case 1: //Administrator panel
	    {
			switch (lbCurSel _adminSelect) do
			{
			    case 0: //Player Menu
				{closeDialog 0;
				execVM "client\systems\adminPanel\playerMenu.sqf";
				};
				case 1: //Full Vehicle Management
				{
	                closeDialog 0;
					execVM "client\systems\adminPanel\vehicleManagement.sqf";
				};
			  
			    case 2: //Teleport
			    {
	                closeDialog 0;    
	                hint "Click on map";
	                onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true;";
                    openMap true;
			    };
	            case 3: //Money
			    {      
					player setVariable["choco", (player getVariable "choco")+100000,true];
			    };
                    case 4: //bounty
			    {      
					player setVariable["bounty", (player getVariable "bounty")+10,true];
			    };
	            case 5: //Debug Menu
			    {   
	            	closeDialog 0;   
	                hint format["Server FPS: %1",serverFPS];
			    };
                             case 6: //Debug Menu
                         {   
	            	closeDialog 0;   
	                
			    };
                   
                                 case 7: //Debug Menu
                         {   
	            	deleteVehicle cursorTarget;closeDialog 0;
			    };
                                 case 8: //Debug Menu
                         {   
	            	closeDialog 0;   
	              [0] execVM "addons\proving_ground\fnc_destroy30.sqf";
			    };
                                 case 9: //Debug Menu
                         {   
	            	closeDialog 0;   
	                [] execVM "addons\proving_ground\fnc_fly1.sqf";
			    };
                                 case 10: //Debug Menu
                         {   
	            	closeDialog 0;   
	               [] execVM "addons\proving_ground\fnc_fly2.sqf";
			    };
                                 case 11: //Debug Menu
                         {   
	            	closeDialog 0;   
	                [] execVM "addons\proving_ground\fnc_godmode.sqf";
			    };
			};
	    };
	    
	    case 2: //Server Administrator panel
	    {
			switch (lbCurSel _serverAdminSelect) do
			{
			    case 0: //Player Menu
				{
	                closeDialog 0;
					execVM "client\systems\adminPanel\playerMenu.sqf";
				};
				case 1: //Full Vehicle Management
				{
	                closeDialog 0;
					execVM "client\systems\adminPanel\vehicleManagement.sqf";
				};
			  
			    case 2: //Teleport
			    {
	                closeDialog 0;    
	                hint "Click on map";
	                onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true;";
                    openMap true;
			    };
	            case 3: //Money
			    {      
					player setVariable["choco", (player getVariable "choco")+100000,true];
			    };
                    case 4: //bounty
			    {      
					player setVariable["bounty", (player getVariable"bounty")+10,true];
			    };
	            case 5: //Debug Menu
			    {   
	            	closeDialog 0;   
	                hint format["Server FPS: %1",serverFPS];
			};
			};
	    };
	    
	};
} else {
  exit;  
};