
private ["_side"];
playerSpawning = true;
playerUID = getPlayerUID(player);
townSearch = 0;
beaconSearch = 0;
doKickTeamKiller = false;
doKickTeamSwitcher = false;

player setPos [2101.75,4314.7,0.00130653];

true spawn client_respawnDialog;
waitUntil {respawnDialogActive};
while {respawnDialogActive} do {
	//titleText ["", "BLACK OUT", 0.00001];
};
sleep 1;
titleText [" ","BLACK IN",3];
player enableSimulation true;