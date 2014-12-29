/*
chocoland globalChat format ["%1 script started",_object ];
_nameString = "<t size='0.5' shadow='2' color='#FFFFFF'>" + "Exchange your Chocos (Press E)" + "</t>";
[_nameString,0,0.8,0.1,0,0,3] spawn bis_fnc_dynamicText;
[nil, _x, "loc", rEXECVM, "addons\scripts\cow_1.sqf",name player] call RE;
[nil, _x, "loc", rSPAWN, [], { player say "cow"; }] call RE;
//kein insasse if ((count(crew _x) == 0)
call compile preprocessfilelinenumbers "file"
  call compile format["_Index = _pvalue lbadd ""%1"";    _pvalue lbSetData [(lbSize _pvalue)-1, ""%1""];", name _x];
PLAYERGUID muss im STRING behandelt werden und darf nicht an letzter stelle stehen, bei ADDACTION von R3F wenn bedingung abgefragt wird.
*/
if(!X_Client) exitWith {};
player enableSimulation false; 
removeAllWeapons player;
[] execVM "client\functions\playerAbort.sqf";

puid = getplayeruid player;
chocoBounty=1;
oldBounty=1;

//colors

COLORRED=0;
COLORGREEN=0;
COLORBLUE = 0;
COLORALPHA =0;

Admins = [
"76561198078783807",  // ikke chocobo
"76561198010316297",  // viggomarksman
"76561198032150693",  // misterixi
"76561198135184514",  // patrick2
//"76561198074957735",  // gheotic
"76561198112291918"]; // patrick
    _a = ["76561198022630238","76561198050707637","76561198016588115","76561198074348892",
"76561197962945132","76561197968415627","76561197977238641","76561197981614079","76561197982885726","76561197988554786","76561197991731117","76561198003664412",
"76561198009944957","76561198010316297","76561198016588115","76561198016907158","76561198020079531","76561198026035328","76561198033350330","76561198038481736",
"76561198042654805","76561198043208691","76561198043721057","76561198047216408","76561198048406470","76561198048443141","76561198057741672","76561198058216530",
"76561198061622698","76561198062800100","76561198068265467","76561198071074929","76561198078783807","76561198079173607","76561198079412050","76561198083309572",
"76561198086161494","76561198089297759","76561198097791570","76561198100931853","76561198119107066","76561198136531112","76561198164722496","76561198024675230",
"76561198128633060",//player1
"76561198078783807","76561198010316297","76561198032150693","76561198135184514","76561198112291918"//admins
];

chocoString="";
detachCounter=0;
atthfix = 0;
home = false;
Donatorweapon = [];
capturecore= [0];
classselect =0;
spawnHalo = false;
punishplayer = 0;
seagull = false;
mutexScriptInProgress = false;
respawnDialogActive = false;
groupManagmentActive = false;
pvar_PlayerTeamKiller = objNull;
doCancelAction = false;
shipspawned= false;
behindi = 1;
claymorelimit = 0;
locking= false;
moneypick = 1;
timeplayer = 0;
loadout=nil;
currentMissionsMarkers = [];
currentRadarMarkers = [];
chocodoor =0;
rainbow= 0;
walked =true;
Dcooldown =false;
//Initialization Variables
playerCompiledScripts = false;
playerSetupComplete = false;
poscheck =false;
RESCUE =false;
waitUntil {!isNull player};
waitUntil{time > 2};
player call compile preprocessFileLineNumbers "client\functions\clientCompile.sqf";

player call playerSetup;

if(!isNil "client_initEH") then {player removeEventHandler ["Respawn", client_initEH];};
player addEventHandler ["Respawn", {[_this] call onRespawn;}];
player addEventHandler ["Killed", {[_this] call onKilled;}];

[] execVM "client\clientEvents\onMouseWheel.sqf";

waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyPress"];
"clientMissionMarkers" addPublicVariableEventHandler {[] call updateMissionsMarkers};
"clientRadarMarkers" addPublicVariableEventHandler {[] call updateRadarMarkers};
"pvar_teamKillList" addPublicVariableEventHandler {[] call updateTeamKiller};
"chocostring" addPublicVariableEventHandler { call compile chocoString;chocostring ="";};
"publicVar_teamkillMessage" addPublicVariableEventHandler {if(local(_this select 1)) then {[] spawn teamkillMessage;};};


[] execVM "client\functions\createTownMarkers.sqf";
[]execVM"client\functions\createMarkers.sqf";

[]execVM"client\functions\createMCapturing.sqf";
true execVM "client\functions\loadAtmosphere.sqf";
[] execVM "client\functions\playerTags.sqf";
[] execVM "client\functions\groupTags.sqf";
[]execVM"client\chocofunc\fnc_numberformat.sqf";

[] call updateMissionsMarkers;
[] call updateRadarMarkers;
if (isNil "FZF_IC_INIT") then   
{
    call compile preprocessFileLineNumbers "client\functions\newPlayerIcons.sqf";
};
sleep 1;
player setDamage 0;
player setvariable["home",nil,false];
player setvariable["ongui","",false];
player setVariable["dot",0,false];
player setVariable["animal",false,false];
player setVariable["bounty",1,true];
player setVariable["donator",0,false];
player setVariable["decoder",0,false];
player setVariable["basebuilder",0,false];
player setVariable["cmoney",500,true];
player setVariable["attach",0,false];
player setVariable["upgrades",0,false];
player setVariable["chocopack",nil,false];
player setVariable["chocoload",[],false];
player setVariable["mothership",[0,0],false];
player setVariable["highscore",[0,0,0,0,0,0,0,0],false];
player setVariable["saveVehicle",nil,false];
player setVariable["medkits",0,false];
player setVariable["ongui2","",false];
player setVariable["fuel",0,false];
player setVariable["repairkits",0,false];
player setVariable["fuelFull", 1,false];
player setVariable["fuelEmpty",0,false];
player setVariable["bombs",false,false];
player setVariable["spawnBeacon",0,false];
player setVariable["camonet",0,false];
player setVariable["canDrop",false,false];
if(puid in _a)then {regular = 1;player setvariable["donator",1,false];player setVariable["decoder",1,false];
player setVariable["attach",1,false];player setVariable["basebuilder",1,false];
chocoland globalChat format["%1, thanks for playing along time (1 of 48) Regular Chocoland Players",name player];};
_mapcenter = [3445.93,3665.25,0.0013];
_buildings = nearestObjects [_mapcenter, ["house","Land_A_BuildingWIP","Land_A_CraneCon","Land_A_TVTower_Base","Land_Destroyer","Land_HouseB_Tenement","Land_Barn_Metal","Land_Ind_Pec_01","Land_Ind_Mlyn_01"], 10000];
{_x allowdamage false;} forEach _buildings;
[] execVM "client\functions\antiCheatClient.sqf";
[] execVM "client\systems\hud\playerHud.sqf";
[] spawn FZF_IC_INIT;
true spawn playerSpawn;
enableEnvironment true;
[]spawn {waituntil{playerSetupComplete}; _test = fp8 getvariable puid;if(!isnil"_test")then {
    // MONEY , BOUNTY , donator, decoder, basebuilder,attach,chocopack,savevehicle,weapons,magazines
    player setVariable["cmoney",_test select 0,true];
    player setVariable["bounty",_test select 1,true];
    player setVariable["donator",_test select 2,false];
    player setVariable["decoder",_test select 3,false];
    player setVariable["basebuilder",_test select 4,false];
    player setVariable["attach",_test select 5,false];
    player setVariable["chocopack",_test select 6,false];
    player setVariable["savevehicle",_test select 7,false];
    _statsweapon=_test select 8;
    _statsmag=_test select 9;
    {
		player addMagazine _x;
}foreach _statsmag;
	removeAllWeapons player;
	{
		player addWeapon _x;
                player selectWeapon _x;
	}foreach _statsweapon;
        
chocoland globalChat"Server-Session Profile loaded,if the server restart you stats will delete, please hide your money in objects(soon it will save automatically)";};
};//load ServerSceneDB

[]spawn {while{true}do{sleep 60;[]call savePlayer;}};
