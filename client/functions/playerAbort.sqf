
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
		titleText ["", "BLACK IN", 0.01];
            
                waitUntil {isNull (findDisplay 49)};
	};
};