
//	@file Version: 1.0
//	@file Name: Script Name
//	@file Author: [404] Deadbeat
//	@file Created: DD/MM/YYYY HH:MM
//	@file Args:

if(!X_Server) exitWith {};

_objPos = _this select 0;

_random = Round(random 2);
if(_random == 2) then {
_Objtype = objectList select (random (count objectList - 1));
_obj = createVehicle [_Objtype,_objPos,[], 50,"None"]; 

if(_Objtype == "Land_Barrel_water") then 
{
    _obj setVariable["water",40,true];
};

if(_Objtype == "Land_stand_small_EP1") then 
{
    _obj setVariable["food",40,true];
};

_obj setpos [(getpos _obj select 0) + 50,(getpos _obj select 1)+ 50,0];
                };
//////orginal
_Objtype = objectList select (random (count objectList - 1));
_obj = createVehicle [_Objtype,_objPos,[], 50,"None"]; 

if(_Objtype == "Land_Barrel_water") then 
{
    _obj setVariable["water",40,true];
};

if(_Objtype == "Land_stand_small_EP1") then 
{
    _obj setVariable["food",40,true];
};

_obj setpos [getpos _obj select 0,getpos _obj select 1,0];