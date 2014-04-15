//	**ModdedGaming.Org**
//	**Original by tonic altered by [404] Deadbeat**
//	**Custom Modifications By ModdedGaming.Org**
//	**If you use any of these files, please leave credits**
// by Xeno
_private =["_pos"];
_pos = _this select 0;
_LHDspawnpoint = [getPosASL _pos select 0, getPosASL _pos select 1, -0.9];
{
	_dummy = createVehicle [_x, _LHDspawnpoint, [], 0, "NONE"];
	_dummy setdir 270;
	_dummy setPos _LHDspawnpoint;
} foreach ["Land_LHD_house_1","Land_LHD_house_2","Land_LHD_elev_R","Land_LHD_1","Land_LHD_2","Land_LHD_3","Land_LHD_4","Land_LHD_5","Land_LHD_6"];
