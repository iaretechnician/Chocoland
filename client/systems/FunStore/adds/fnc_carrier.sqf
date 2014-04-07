//	**ModdedGaming.Org**
//	**Original by tonic altered by [404] Deadbeat**
//	**Custom Modifications By ModdedGaming.Org**
//	**If you use any of these files, please leave credits**
// by Xeno
#define THIS_FILE "x_setupcarrier.sqf"
TitleText ["Requesting Carrier on following coordinates.( dont spawn on island or over other Carriers!)","Plain Down"];


titleText ["Click on the map to set your firedirection","plain down"];
onMapSingleClick "_pos setPos _pos";

"Carrierdirection" setmarkerpos getPos _pos;

onMapSingleClick "";
titleText ["", "plain down"];
sleep 1;
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
"Carrierdirection" setMarkerPos [0,0];