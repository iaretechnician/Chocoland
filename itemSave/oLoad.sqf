//the OMG CLAN - creedcoder thanks for your help
sleep 1;
diag_log format["Creedcoder DB - Starting Object Load!"];
_dbname = "Objects" call PDB_databaseNameCompiler;

_check = (_dbname) call iniDB_exists;
if (!_check) exitWith {
	diag_log format["Creedcoder DB - No DB found for objects!"];
	objectsLoaded = true;
};
_objectscount = [_dbname, "Objects", "Count", "SCALAR"] call iniDB_read;
if (isNil "_objectscount") exitWith {
	diag_log format["Creedcoder DB - No objects in database!"];
	objectsLoaded = true;
};
_count = 0;
for "_i" from 0 to _objectscount do {
	_object = [_dbname, "Objects", format['data%1', _i], "ARRAY"] call iniDB_read;
//_array = [_classname,_pos,_dir,_weapons,_magazines,_playerGUID];
	{
		_obj = createVehicle [(_x select 0),(_x select 1), [], 0, "CAN COLLIDE"];
		_obj setVectorDirAndUp (_x select 2);
		_obj setPosatl (_x select 1);

		_obj setVariable ["objectLocked", true, true];
		 _obj setVariable ["playerGUID", (_x select 5), true];
                 
        clearWeaponCargoGlobal _obj;
        clearMagazineCargoGlobal _obj;
		
		_weapons = _x select 3;
		for[{_ii = 0}, {_ii < (count (_weapons select 0))}, {_ii = _ii + 1}] do {
			_obj addWeaponCargoGlobal [(_weapons select 0) select _ii, (_weapons select 1) select _ii];
		};
		
		_magazines = _x select 4;
		for[{_ii = 0}, {_ii < (count (_magazines select 0))}, {_ii = _ii + 1}] do {
			_obj addMagazineCargoGlobal [(_magazines select 0) select _ii, (_magazines select 1) select _ii];
		};
		_count = _count + 1;  
	} count _object;
};
diag_log format["Creedcoder DB - Loaded %1 parts from %2 datalines from iniDB!", _count,_objectscount];
objectsLoaded = true;