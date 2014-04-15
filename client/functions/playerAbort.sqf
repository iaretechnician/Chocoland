disableSerialization;

while {true} do
{
	waitUntil {!(isNull (findDisplay 49))};
	((findDisplay 49) displayCtrl 104) ctrlEnable false;
	_time = time;
    
	waitUntil {(isNull (findDisplay 49)) || time >= _time + 5};
	if (!(isNull (findDisplay 49))) then
	{
		((findDisplay 49) displayCtrl 104) ctrlEnable true;player spawn PDB_savePlayer;
		waitUntil {isNull (findDisplay 49)};
	};
};