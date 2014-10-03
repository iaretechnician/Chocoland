_counter = 0;

{_var = 0;
		_name = _x getvariable"playerGUID";if (isnil"_name")then {_var = 1;};
		if(_name == name player && _var == 1) then {
                    _x setdamage 0;
                    _counter = _counter + 1;
};
} forEach allMissionObjects "All";
player globalchat format ["%1 objects restored.Your base is now save for the next 24H",_counter];