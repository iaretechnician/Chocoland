#include "setup.sqf"
if(!X_Server) exitWith {};
mission_APC = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_APC.sqf";
mission_Heli = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_Heli.sqf";
mission_LightArmVeh = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_LightArmVeh.sqf";
mission_LightTank = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_LightTank.sqf";
mission_MBT = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_MBT.sqf";
mission_Outpost = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_Outpost.sqf";
mission_RadarTruck = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_RadarTruck.sqf";
mission_SupplyDrop = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_SupplyDrop.sqf";
mission_VIP = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_VIP.sqf";

mission_AirWreck = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_AirWreck.sqf";
mission_Truck = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_Truck.sqf";
mission_ReconVeh = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_ReconVeh.sqf";
mission_WepCache = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_WepCache.sqf";
mission_SmallHeli = compile preprocessFileLineNumbers "server\missions\mainMissions\mission_SmallHeli.sqf";

npcRweapon = compile preprocessFileLineNumbers "server\factoryMethods\npcweapon.sqf";
createSmallGroup = compile preprocessFileLineNumbers "server\factoryMethods\createUnits\smallGroup.sqf";
createMidGroup = compile preprocessFileLineNumbers "server\factoryMethods\createUnits\midGroup.sqf";
createLargeGroup = compile preprocessFileLineNumbers "server\factoryMethods\createUnits\largeGroup.sqf";
createMissionVehicle = compile preprocessFileLineNumbers "server\factoryMethods\createMissionVehicle.sqf";
createMissionLocation = compile preprocessFileLineNumbers "server\factoryMethods\createMissionLocation.sqf";
createClientMarker = compile preprocessFileLineNumbers "server\factoryMethods\createClientMarker.sqf";
createWaitCondition = compile preprocessFileLineNumbers "server\factoryMethods\createWaitCondition.sqf";
deleteClientMarker = compile preprocessFileLineNumbers "server\factoryMethods\deleteClientMarker.sqf";
createCargoItem = compile preprocessFileLineNumbers "server\factoryMethods\createCargoItem.sqf";
defendArea = compile preprocessFileLineNumbers "server\functions\defendArea.sqf";

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
