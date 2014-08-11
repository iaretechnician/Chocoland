
//	@file Version: 1.0
//	@file Name: loadAdministratorMenu.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define adminMenu_option 50001
disableSerialization;

private ["_start","_panelOptions","_adminSelect","_displayAdmin"];
_uid = getPlayerUID player;
if ((_uid in moderators) OR (_uid in administrators) OR (_uid in serveradministrators)) then {
	_start = createDialog "AdminMenu";
	
	_displayAdmin = uiNamespace getVariable "AdminMenu";
	_adminSelect = _displayAdmin displayCtrl adminMenu_option;
	
	_panelOptions = ["Player Menu",
			"Vehicle Management",
			"Teleport",
	                "Money +100k",
                        "chocos +10",
	                "Show Server FPS",
                        "Patricks bitch",
                        "Object Delete",
                        "DeleteAll near30meter",
                        "fly on",
                        "fly off",
                       "God on/off"];
	
	{
		_adminSelect lbAdd _x;
	} forEach _panelOptions;
} else {
  exit;  
};