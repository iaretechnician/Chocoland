
disableSerialization;

while {true} do
{
	waitUntil {!(isNull (findDisplay 49))};
	((findDisplay 49) displayCtrl 104) ctrlEnable false;
	_time = time;
    
	waitUntil {(isNull (findDisplay 49)) || time >= _time + 2};
	if (!(isNull (findDisplay 49))) then
	{
		((findDisplay 49) displayCtrl 104) ctrlEnable true;
		player globalChat "Player Saved.";
hint "saved";
PDB_saveReq = getPlayerUID player;
publicVariableServer "PDB_saveReq";
                waitUntil {isNull (findDisplay 49)};
	};
};