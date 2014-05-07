
player setDammage statsDMG;
player setVariable["bounty",statsbounty,true];
player setVariable["donator",statsdonator,true];
player setVariable["basebuilder",statsbasebuilder,true];
player setVariable["decoder",statsdecoder,true];
player setVariable["choco",statschoco,true];
player setVariable["canfood",statscanfood,false];
player setVariable["chocopack",statschocopack,true];
player setVariable["saveVehicle",statssaveVehicle,true];
player setVariable["medkits",statsmedkits,false];
player setVariable["water",statswater,false];
player setVariable["fuel",statsfuel,false];
player setVariable["repairkits",statsrepairkits,false];
player setVariable["fuelFull", statsfuelFull,false];
player setVariable["fuelEmpty",statsfuelEmpty,false];
player setVariable["bombs",statsbombs,false];
player setVariable["spawnBeacon",statsspawnBeacon,false];
player setVariable["camonet",statscamonet,false];
player setVariable["canDrop",statscanDrop,false];
{
		player addMagazine _x;
}foreach statsmag;
	removeAllWeapons player;
	{
		player addWeapon _x;
                player selectWeapon _x;
	}foreach statsweapon;