_objPos = _this select 0;

_random = Round(random 2);
if(_random == 2) then {
_Objtype = objectList select (random (count objectList - 1));
_obj = createVehicle [_Objtype,_objPos,[], 50,"None"]; 

_obj setpos [(getpos _obj select 0) + 50,(getpos _obj select 1)+ 50,0];
 _obj setVariable["R3F_LOG_disabled", false, true];               };
//////orginal
_Objtype = objectList select (random (count objectList - 1));
_obj = createVehicle [_Objtype,_objPos,[], 50,"None"]; 

_obj setpos [getpos _obj select 0,getpos _obj select 1,0];
_obj setVariable["R3F_LOG_disabled", false, true];