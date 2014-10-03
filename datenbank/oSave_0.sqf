PersistentDB_ObjCount = 0;
	{
		_var = _x getVariable "objectLocked";
		if(!isNil "_var" && (alive _x)&& (_x getvariable"base") ==1) then {
			_classname = typeOf _x;
			_pos = getPosAtL _x;
                        _playerGUID = _x getvariable"playerGUID";
			_dir = [vectorDir _x] + [vectorUp _x];

			_weapons = getWeaponCargo _x;
			_magazines = getMagazineCargo _x;
			_objSaveName = format["obj%1", PersistentDB_ObjCount];

			["Objects" call PDB_databaseNameCompiler, _objSaveName, "classname", _classname] call iniDB_write;
			 ["Objects" call PDB_databaseNameCompiler, _objSaveName, "playerGUID", _playerGUID] call iniDB_write;
                         ["Objects" call PDB_databaseNameCompiler, _objSaveName, "pos", _pos] call iniDB_write;
			["Objects" call PDB_databaseNameCompiler, _objSaveName, "dir", _dir] call iniDB_write;
			
			["Objects" call PDB_databaseNameCompiler, _objSaveName, "weapons", _weapons] call iniDB_write;
			["Objects" call PDB_databaseNameCompiler, _objSaveName, "magazines", _magazines] call iniDB_write;

			PersistentDB_ObjCount = PersistentDB_ObjCount + 1;
		};
	} forEach allMissionObjects "All";
	["Objects" call PDB_databaseNameCompiler, "Count", "Count", PersistentDB_ObjCount] call iniDB_write;