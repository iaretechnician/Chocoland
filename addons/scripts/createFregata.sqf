
player removeaction playerbaseObject;
_private =["_pos"];
_pos = player;
_LHDspawnpoint = [getPosASL _pos select 0, getPosASL _pos select 1, -0.9];
{
	_dummy = createVehicle [_x, _LHDspawnpoint, [], 0, "NONE"];
	_dummy setdir 270;
	_dummy setPos _LHDspawnpoint;
         _dummy setVariable ["objectLocked", true, true];
        _dummy setVariable ["base", 1, true];
          _dummy setVariable ["playerGUID", name player, true];
} foreach ["Land_Fregata"];
