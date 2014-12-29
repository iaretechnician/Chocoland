//the OMG CLAN - creedcoder thanks for your help
waitUntil{sleep 1; objectsLoaded};
while {true} do {
 sleep 600;
	_data = [];
	 call compile format["_dataserver = ""%1"";", "start saving objects"];
	diag_log format["Creedcoder DB - Starting Object Save!"];
	_dbname = "Objects" call PDB_databaseNameCompiler;
	_dataline = 0;
	_objcount = 0;
	{
		_object = _x;
		if (_object getVariable ["objectLocked", false] && {alive _object}) then {
			_classname = typeOf _object;
			_pos = getPosAtL _object;
			_dir = [vectorDir _object] + [vectorUp _object];
                         _playerGUID = _x getvariable["playerGUID", ""];
			
			_weapons = getWeaponCargo _object;
			_magazines = getMagazineCargo _object;
			_array = [_classname,_pos,_dir,_weapons,_magazines,_playerGUID];
			
			_data set [count _data, _array];
			
			if ((count toArray str _data) > 1200) then {
				[_dbname, "Objects", format['data%1', _dataline], _data] call iniDB_write;
				_data = [];
				_dataline = _dataline + 1;
			};
			_objcount = _objcount + 1;
		};
	} count allMissionObjects "All";
	[_dbname, "Objects", format['data%1', _dataline], _data] call iniDB_write;
	
	[_dbname, "Objects", "Count", _dataline] call iniDB_write;
	diag_log format["Creedcoder DB - %1 parts have been saved in %2 datalines to Profile!", _objcount, _dataline];
         call compile format["_dataserver = ""%1"";", "finish saving objects"];
};