PDB_savePlayer = {
	_x = _this;
	if(isPlayer (_x)) then 
	{
		_playerUID = getPlayerUID _x;
		_playerSide = 1;
		if(!isNil "_playerUID") then {
			_weapons = weapons _x;
			[_playerUID call PDB_databaseNameCompiler, _playerSide, "weapons", _weapons] call iniDB_write;
			
			_magazines = magazines _x;
			[_playerUID call PDB_databaseNameCompiler, _playerSide, "magazines", _magazines] call iniDB_write;
			
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
                           _mothership = _x getVariable "mothership";
			if(!isNil "_mothership") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "mothership", _mothership] call iniDB_write;
			};
                        _decoder = _x getVariable "decoder";
			if(!isNil "_decoder") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "decoder", _decoder] call iniDB_write;
			};
                        _basebuilder = _x getVariable "basebuilder";
			if(!isNil "_basebuilder") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "basebuilder", _basebuilder] call iniDB_write;
			};
                        _highscore = _x getVariable "highscore";
			if(!isNil "_highscore") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "highscore", _highscore] call iniDB_write;
			};
                         _attach = _x getVariable "attach";
			if(!isNil "_attach") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "attach", _attach] call iniDB_write;
			};
                        _saveVehicle =_x getVariable"saveVehicle";
                        if(!isNil"_saveVehicle")then {
                                [_playerUID call PDB_databaseNameCompiler, _playerSide, "saveVehicle", _saveVehicle] call iniDB_write;
                        };
                        _chocoload =_x getVariable"chocoload";
                        if(!isNil"_chocoload")then {
                                [_playerUID call PDB_databaseNameCompiler, _playerSide, "chocoload", _chocoload] call iniDB_write;
                        };
                        _chocopack = _x getVariable"chocopack";
                        if(!isnil"_chocopack")then {
                            [_playerUID call PDB_databaseNameCompiler, _playerSide, "chocopack", _chocopack] call iniDB_write;
                        };
                 
                        _bounty = _x getVariable "bounty";
			if(!isNil "_bounty") then {
				[_playerUID call PDB_databaseNameCompiler, _playerSide, "bounty", _bounty] call iniDB_write;
			};
		};
	};
};

{
		_x spawn PDB_savePlayer;
}foreach playableUnits;