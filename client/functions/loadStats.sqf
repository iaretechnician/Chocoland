
_test= _this select 0;
_player = _this select 1;
_player setDammage statsDMG;
_player setVariable["bounty",statsbounty,true];
_player setVariable["donator",statsdonator,true];
_player setVariable["basebuilder",statsbasebuilder,true];
_player setVariable["upgrades",statsupgrades,true];
_player setVariable["attach",statsattach,true];
_player setVariable["decoder",statsdecoder,true];
_player setVariable["choco",statschoco,true];
_player setVariable["canfood",statscanfood,false];
_player setVariable["chocopack",statschocopack,true];
_player setVariable["saveVehicle",statssaveVehicle,true];
_player setVariable["medkits",statsmedkits,true];
_player setVariable["water",statswater,true];
_player setVariable["fuel",statsfuel,true];
_player setVariable["repairkits",statsrepairkits,true];
_player setVariable["fuelFull", statsfuelFull,true];
_player setVariable["fuelEmpty",statsfuelEmpty,true];
_player setVariable["bombs",statsbombs,true];
_player setVariable["spawnBeacon",statsspawnBeacon,true];
_player setVariable["camonet",statscamonet,true];
_player setVariable["canDrop",statscanDrop,true];
if(_test == 1)exitwith{};
{
		_player addMagazine _x;
}foreach statsmag;
	removeAllWeapons player;
	{
		_player addWeapon _x;
                _player selectWeapon _x;
	}foreach statsweapon;