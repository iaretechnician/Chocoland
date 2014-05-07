
//	@file Version: 1.0
//	@file Name: Script Name
//	@file Author: [404] Deadbeat
//	@file Created: DD/MM/YYYY HH:MM
//	@file Args:

if(!X_Server) exitWith {};

_objPos = _this select 0;


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
if(_Objtype == "C130J_wreck_EP1")then 
{_te= round (random 4);if (_te ==3)then{deletevehicle _obj;
   };};
if(_Objtype == "MediumTentCamp_napa")then 
{_te= round (random 4);if (_te ==3)then{deletevehicle _obj;
    _newComp = [_objPos, Round(random 360), "MediumTentCamp_napa"] call (compile (preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf"));
};};
if(_Objtype == "cityBase04")then 
{_te= round (random 4);if (_te ==3)then{deletevehicle _obj;
    _newComp = [_objPos, Round(random 360), "cityBase04"] call (compile (preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf"));
};};
if(_Objtype == "fuelDepot_us")then 
{_te= round (random 4);if (_te ==3)then{deletevehicle _obj;
    _newComp = [_objPos, Round(random 360), "fuelDepot_us"] call (compile (preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf"));
};};

_obj setpos [getpos _obj select 0,getpos _obj select 1,0];
