
//@file Version: 1.0
//@file Name: init.sqf
//@file Author: [404] Deadbeat, [404] Costlyy
//@file Created: 20/11/2012 05:19
//@file Description: The client init.

if(!X_Client) exitWith {};

// Disable player from killing in the spawn area.
player enableSimulation false; 
removeAllWeapons player;
[] execVM "client\functions\playerAbort.sqf";
// Start the loading screen ASAP.
//titleText ["connecting to HeavensDelight...", "BLACK OUT", 0];

mutexScriptInProgress = false;
respawnDialogActive = false;
groupManagmentActive = false;
pvar_PlayerTeamKiller = objNull;
doCancelAction = false;
behindi =1;
moneypick = 1;
loadout=nil;
currentMissionsMarkers = [];
currentRadarMarkers = [];
chocodoor =0;
rainbow= 0;
//Initialization Variables
playerCompiledScripts = false;
playerSetupComplete = false;

waitUntil {!isNull player};
waitUntil{time > 2};

player call compile preprocessFileLineNumbers "client\functions\clientCompile.sqf";
[] execVM "client\systems\class\loadclass.sqf";
waitUntil { sleep 1;classSelect==1;};
//Player setup
player call playerSetup;
//classSelection
//Setup player events.
if(!isNil "client_initEH") then {player removeEventHandler ["Respawn", client_initEH];};
player addEventHandler ["Respawn", {[_this] call onRespawn;}];
player addEventHandler ["Killed", {[_this] call onKilled;}];

//Setup player menu scroll action.
[] execVM "client\clientEvents\onMouseWheel.sqf";

//Setup Key Handler
waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyPress"];

//"currentDate" addPublicVariableEventHandler {[] call timeSync};
"clientMissionMarkers" addPublicVariableEventHandler {[] call updateMissionsMarkers};
"clientRadarMarkers" addPublicVariableEventHandler {[] call updateRadarMarkers};
"pvar_teamKillList" addPublicVariableEventHandler {[] call updateTeamKiller};
"publicVar_teamkillMessage" addPublicVariableEventHandler {if(local(_this select 1)) then {[] spawn teamkillMessage;};};

[] execVM "client\functions\initSurvival.sqf";
[] execVM "client\systems\hud\playerHud.sqf";
[] execVM "client\functions\createTownMarkers.sqf";
//[] execVM "client\functions\createGunStoreMarkers.sqf";
//[] execVM "client\functions\createGeneralStoreMarkers.sqf";
true execVM "client\functions\loadAtmosphere.sqf"; // Set to false to disable dust, ash and wind
[] execVM "client\functions\playerTags.sqf";
[] execVM "client\functions\groupTags.sqf";
[]execvM"client\functions\chocotime.sqf";
[]execVM"client\functions\fnc_numberformat.sqf";
[] call updateMissionsMarkers;
[] call updateRadarMarkers;
if (isNil "FZF_IC_INIT") then   
{
	call compile preprocessFileLineNumbers "client\functions\newPlayerIcons.sqf";
};
sleep 1;
true spawn playerSpawn;
[] execVM "client\functions\antiCheatClient.sqf";
[] spawn FZF_IC_INIT;
player setDamage 0;
player setVariable["dot",0,true];
player setVariable["animal",false,true];
player setVariable["bounty",0,true];
player setVariable["donator",0,true];
player setVariable["decoder",0,true];
player setVariable["basebuilder",0,true];
player setVariable["choco",500,true];
player setVariable["attach",0,true];
player setVariable["upgrades",0,true];
player setVariable["canfood",2,true];
player setVariable["chocopack",nil,true];
player setVariable["chocoload",[],true];
player setVariable["saveVehicle",0,true];
player setVariable["medkits",0,true];
player setVariable["water",2,true];
player setVariable["fuel",0,true];
player setVariable["repairkits",0,true];
player setVariable["fuelFull", 1,true];
player setVariable["fuelEmpty",0,true];
player setVariable["bombs",false,true];
player setVariable["spawnBeacon",0,true];
player setVariable["camonet",0,true];
player setVariable["canDrop",false,true];
[]execVM"client\functions\createBaseMarker.sqf";
_mapcenter = [3445.93,3665.25, 0.0013];
_buildings = nearestObjects [_mapcenter, ["house","Land_A_BuildingWIP","Land_A_CraneCon","Land_A_TVTower_Base","Land_Destroyer","Land_HouseB_Tenement","Land_Barn_Metal","Land_Ind_Pec_01","Land_Ind_Mlyn_01"], 25000];
{_x allowdamage false;_x enableSimulation false;} forEach _buildings;

