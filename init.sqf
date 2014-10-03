//	@file Version: 1.0
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:13
//	@file Description: The main init.
//	@file Args:

#include "setup.sqf"
if (isnil "RE") then {[] execVM "\ca\Modules\MP\data\scripts\MPframework.sqf"};
[] execVM "addons\bisfix11\init.sqf";
StartProgress = false;
enableSaving[false,false];

X_Server = false;
X_Client = false;
X_JIP = false;
hitStateVar = false;
versionName = "v1.0";
spawnHalo = false;
basecoreState = false;
Donatorweapon = [];

if(isServer) then { X_Server = true;};
if(!isDedicated) then { X_Client = true;};
if(isNull player) then {X_JIP = true;};

true spawn {
	if(!isDedicated) then {
		titleText ["connecting to HeavensDelight...", "BLACK", 0];
		//waitUntil {player == player};
                classselect =0;
		client_initEH = player addEventHandler ["Respawn", {removeAllWeapons (_this select 0);}];
	};
};

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "briefing.sqf";

if(X_Client) then {
	//waitUntil {player == player};

	//Wipe Group.
	if(count units group player > 1) then
	{  
		//diag_log "Player Group Wiped";
		[player] join grpNull;    
	};

	[] execVM "client\init.sqf";
};

if(X_Server) then {
	diag_log format ["############################# ChocoLand #############################"];
	[] execVM "server\init.sqf";
};

//init 3rd Party Scripts
[] execVM "addons\R3F\init.sqf";
[] execVM "addons\proving_Ground\init.sqf";
[0, 0, 0] execVM "addons\scripts\DynamicWeatherEffects.sqf";
[] execVM "motd.sqf";
_null = [] execVM "addons\scripts\cleanupnew.sqf";
execVM "datenbank\init.sqf";