
TitleText ["Requesting Carrier on following coordinates.( dont spawn on island or over other Carriers!)","Plain Down"];
sleep 2;
titleText ["Click on the map to set your firedirection","plain down"];
openMap true;
onMapSingleClick "_pos1= [_pos select 0,_pos select 1,0]; onMapSingleClick ''; true;";
sleep 3;
openMap false;
_mark = "SmokeShellRed" Createvehicle _pos1;
TitleText ["Coordinates received.your Carrier is on the way.","Plain Down"];
_dropPosition = getpos _pos;
_LHDspawnpoint = [getPosASL _dropPosition select 0, getPosASL _dropPosition select 1, -0.9];
{
	_dummy = createVehicle [_x, _LHDspawnpoint, [], 0, "NONE"];
	_dummy setdir 270;
	_dummy setPos _LHDspawnpoint;
        _dummy setVariable["original",1,true];
	_dummy setVariable["R3F_LOG_disabled", false, true];
        _dummy setVariable ["objectLocked", true, true];
} foreach ["Land_LHD_house_1","Land_LHD_house_2","Land_LHD_elev_R","Land_LHD_1","Land_LHD_2","Land_LHD_3","Land_LHD_4","Land_LHD_5","Land_LHD_6"];
