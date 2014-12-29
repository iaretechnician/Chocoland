if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER - capture Started"];
_core = 0;
_sleep =0;
_randomcomp= ["MediumTentCamp_napa","cityBase04","fuelDepot_us","mediumtentcamp3_ru"];
_group = createGroup SideHQ;
_spawn = 0;
_rbase= 0;

while {true} do
{
    _rbase = _randomcomp call BIS_fnc_selectRandom;
  
     _xpos= getmarkerpos"Mission";
     _pos=[_xpos, 200, 5000, 5, 0, 10, 0] call BIS_fnc_findSafePos;
     _spawn = createVehicle ["76n6ClamShell",_pos,[], 0,"CAN_COLLIDE"];
     _spawn setDir 0;_spawn setPos _pos;
    
     _dummyUnit = (_group) createUnit ["RU_Pilot", [0,0,0], [], 0, "NONE"]; 
     [_dummyUnit] join _group;
     _nic = [nil, _dummyUnit, "per", rHideobject, true] call RE; 
    _dummyUnit attachTo [_spawn, [0,0,0]];
_newComp = [(getpos _spawn),(getDir _spawn), _rbase] call (compile (preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf"));
     _dummyunit setvariable["name","Server",true];
      _dummyunit setvariable["wallet","",true];
    _spawn setvariable["capture",1,true];
     _spawn setvariable["basecore",1,true];
       _spawn setvariable["wallet",10000,true];
       capturecore = [0];publicvariable"capturecore";
       servercore2= _spawn;publicvariable"servercore2";
waitUntil{!alive _spawn};
deletevehicle _spawn;
deletevehicle _dummyUnit;
}; 