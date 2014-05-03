PDB_savePlayer = {
	_x = _this;
	if(isPlayer (_x)) then 
	{
		_playerUID = getPlayerUID _x;
		_playerSide = side _x;
		if(!isNil "_playerUID" && !isNil "_playerSide") then {
			_weapons = weapons _x;
			[_playerUID call PDB_databaseNameCompiler, _playerSide, "weapons", _weapons] call iniDB_write;
			
			_magazines = magazines _x;
			[_playerUID call PDB_databaseNameCompiler, _playerSide, "magazines", _magazines] call iniDB_write;
		                        
			_dir = getDir _x;
			[_playerUID call PDB_databaseNameCompiler, _playerSide, "dir", _dir] call iniDB_write;
			
			_pos = getPosASL _x;
			[_playerUID call PDB_databaseNameCompiler, _playerSide, "pos", _pos] call iniDB_write;
			
			_dammage = getDammage _x;
			[_playerUID call PDB_databaseNameCompiler, _playerSide, "dammage", _dammage] call iniDB_write;
			
			_cmoney = _x getVariable "choco";
			if(!isNil "_cmoney") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "cmoney", _cmoney] call iniDB_write;
			};                
                        _donator = _x getVariable "donator";
			if(!isNil "_donator") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "donator", _donator] call iniDB_write;
			};
                        
                        _decoder = _x getVariable "decoder";
			if(!isNil "_decoder") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "decoder", _decoder] call iniDB_write;
			};
                        _basebuilder = _x getVariable "basebuilder";
			if(!isNil "_basebuilder") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "basebuilder", _basebuilder] call iniDB_write;
			};
                        _saveVehicle =_x getVariable"saveVehicle";
                        if(!isNil"_saveVehicle")then {
                                [_playerUID call PDB_databaseNameCompiler, _playerSide, "saveVehicle", _saveVehicle] call iniDB_write;
                        };
                  
                        _chocopack = _x getVariable"chocopack";
                        if(!isnil"_chocopack")then {
                            [_playerUID call PDB_databaseNameCompiler, _playerSide, "chocopack", _chocopack] call iniDB_write;
                        };
                 
                        _bounty = _x getVariable "bounty";
			if(!isNil "_bounty") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "bounty", _bounty] call iniDB_write;
			};
			_canfood = _x getVariable "canfood";
			if(!isNil "_canfood") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "canfood", _canfood] call iniDB_write;
			};
			_medkits = _x getVariable "medkits";
			if(!isNil "_medkits") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "medkits", _medkits] call iniDB_write;
			};
			_water = _x getVariable "water";
			if(!isNil "_water") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "water", _water] call iniDB_write;
			};
			_fuel = _x getVariable "fuel";
			if(!isNil "_fuel") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "fuel", _fuel] call iniDB_write;
			};
			_repairkits = _x getVariable "repairkits";
			if(!isNil "_repairkits") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "repairkits", _repairkits] call iniDB_write;
			};
			_fuelFull = _x getVariable "fuelFull";
			if(!isNil "_fuelFull") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "fuelFull", _fuelFull] call iniDB_write;
			};
			_fuelEmpty = _x getVariable "fuelEmpty";
			if(!isNil "_fuelEmpty") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "fuelEmpty", _fuelEmpty] call iniDB_write;
			};
			_bombs = _x getVariable "bombs";
			if(!isNil "_bombs") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "bombs", _bombs] call iniDB_write;
			};
			_spawnBeacon = _x getVariable "spawnBeacon";
			if(!isNil "_spawnBeacon") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "spawnBeacon", _spawnBeacon] call iniDB_write;
			};
			_camonet = _x getVariable "camonet";
			if(!isNil "_camonet") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "camonet", _camonet] call iniDB_write;
			};
			_thirstLevel = _x getVariable "thirstLevel";
			if(!isNil "_thirstLevel") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "thirstLevel", _thirstLevel] call iniDB_write;
			};
			_hungerLevel = _x getVariable "hungerLevel";
			if(!isNil "_hungerLevel") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "hungerLevel", _hungerLevel] call iniDB_write;
			};
		};
	};
};
{
		_x spawn PDB_savePlayer;
}foreach playableUnits;