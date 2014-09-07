#include "setup.sqf"
if(!X_Server) exitWith {};
npcRweapon = compile preprocessFileLineNumbers "server\factoryMethods\npcweapon.sqf";
createSmallGroup = compile preprocessFileLineNumbers "server\factoryMethods\createUnits\smallGroup.sqf";
createMidGroup = compile preprocessFileLineNumbers "server\factoryMethods\createUnits\midGroup.sqf";
createLargeGroup = compile preprocessFileLineNumbers "server\factoryMethods\createUnits\largeGroup.sqf";
createMissionVehicle = compile preprocessFileLineNumbers "server\factoryMethods\createMissionVehicle.sqf";

//Spawning Compiles
randomWeapons = compile preprocessFileLineNumbers "server\spawning\randomWeapon.sqf";
vehicleCreation = compile preprocessFileLineNumbers "server\spawning\vehicleCreation.sqf";
objectCreation = compile preprocessFileLineNumbers "server\spawning\objectCreation.sqf";
staticGunCreation = compile preprocessFileLineNumbers "server\spawning\staticGunCreation.sqf";
staticHeliCreation = compile preprocessFileLineNumbers "server\spawning\staticHeliCreation.sqf";
fn_refillbox = compile preprocessFileLineNumbers "server\functions\fn_refillbox.sqf";
//Player Management
server_playerDied = compile preprocessFileLineNumbers "server\functions\serverPlayerDied.sqf";

createLootMoney = compile preprocessFileLineNumbers "server\functions\dropLoot.sqf";
//Event handlers
bomb = compile preprocessFileLineNumbers "server\functions\bomb.sqf";
