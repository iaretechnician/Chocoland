_pos1= [];
TitleText ["Requesting Carrier on following coordinates. click to Spawn( dont spawn on island or over other Carriers!)","Plain Down"];
openMap true;
onMapSingleClick "_pos1= [_pos select 0,_pos select 1,0];openMap false; onMapSingleClick ''; true;";
sleep 4;
TitleText ["Coordinates received.your Carrier is on the way.","Plain Down"];
_dropPosition = _pos1;
_LHDspawnpoint = [_dropPosition select 0,_dropPosition select 1, -0.9];
{
	_dummy = createVehicle [_x, _LHDspawnpoint, [], 0, "NONE"];
	_dummy setdir 270;
	_dummy setPos _LHDspawnpoint;
        _dummy setVariable["original",1,true];
	_dummy setVariable["R3F_LOG_disabled", false, true];
        _dummy setVariable ["objectLocked", true, true];
         _dummy setVariable ["base",1, true];
         _dummy setVariable ["playerGUID", _uid, true];
}foreach ["Land_LHD_house_1","Land_LHD_house_2","Land_LHD_elev_R","Land_LHD_1","Land_LHD_2","Land_LHD_3","Land_LHD_4","Land_LHD_5","Land_LHD_6"];
