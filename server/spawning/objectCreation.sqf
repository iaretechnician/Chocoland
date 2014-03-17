
//	@file Version: 1.0
//	@file Name: Script Name
//	@file Author: [404] Deadbeat
//	@file Created: DD/MM/YYYY HH:MM
//	@file Args:

if(!X_Server) exitWith {};

_objPos = _this select 0;
_Objtype = objectList select (random (count objectList - 1));
/////////////////////////////
if(_Objtype == "EvMoney") exitWith{
      _count = Round (Random 200);
      _obj setpos [3687.9087,19,3607.6348];
_obj = "Evmoney" createVehicle (_objPos); _count setPos _objPos;
_obj setVariable["money",_count,true];
_obj setVariable["owner","world",true];

                                };
                                //////////////////////////
_obj = createVehicle [_Objtype,_objPos,[], 50,"None"]; 
_obj setDamage 0.9;

if(_Objtype == "Land_Barrel_water") then 
{
    _obj setVariable["water",20,true];
};

if(_Objtype == "Land_stand_small_EP1") then 
{
    _obj setVariable["food",20,true];
};
///custommm
/*if(_Objtype == "EvMoney") then
{
    _count = Round (Random 200);
  	_obj setVariable["money", _count, true];
	_obj setVariable ["owner", "world", true];  
};*/
_obj setpos [getpos _obj select 0,getpos _obj select 1,0];