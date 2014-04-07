//	@file Version: 1.0
//	@file Name: staticHeliCreation.sqf
//	@file Author: [404] Costlyy
//	@file Created: 20/12/2012 21:00
//	@file Description: Random static helis
//	@file Args: [int (0 = not wreck | 1 = wreck), array (position)]

if(!X_Server) exitWith {};
//sleep 600;
while {true} do {
// what object
_randomArray = Round (random 3);
if(_randomArray == 1) then {_randomObject = randomVehicleArray select (random (count randomVehicleArray - 1));};
if(_randomArray == 2) then {_randomObject = randomBuildingrray select (random (count randomBuildingrray - 1));};
if(_randomArray == 3) then 
{_randomObject = "EvMoney";
_count = Round (random 400)+100;
    if(_count == 500) then
        {
         _count= Round (random 4);
         if(_count == 2) then{_count = 25000;} else {_count = 10000;};
        };
     if(_count < 500 AND _count > 150) then 
        {
            _random = Round (random 4);
           if(_random == 1) then{_count = _count *1;};
        if(_random == 2) then{_count = _count *2;};
     if(_random == 3) then{_count = _count *3;};
  if(_random == 4) then{_count = _count *4;};
        };
    if(_count < 150 AND _count > 1) then 
        {
           _count= Round (random 3);
          if(_count == 2) then{_count = 5000;} else {_count = 1000;};
        };
        };
        _count= Round (random 9999);
_mapside = Round (random 2);
     if(_mapside == 1) then 
     {
          _xCord = Round (random 1700) + 2896.75;
          _yCord = Round (random 2040) + 3515.77;
          _pos = [_xCord, _yCord,0.0014];
     };
     if(_mapside == 2) then  
     {
         _xCord = Round (random 1650)+3671.96;
         _yCord = Round (random 1980)+ 2915;
         _pos = [_xCord,_yCord,0.0014];
     };
	_pos = [3445.93,200,3665.25];
//coroutine

_spawn = _randomObject createVehicle _pos;
    _spawn setpos _pos;
//_spawn = createVehicle[_randomObject,_pos,[], 0,"CAN_COLLIDE"];
//			_spawn setPos (getPos _spawn);
				clearMagazineCargoGlobal _spawn;
				clearWeaponCargoGlobal _spawn;
			_spawn setVariable["original",1,true];
			_spawn setVariable["R3F_LOG_disabled", false, true];
	 _Parachute = "ParachuteBigWest_EP1" createVehicle position _spawn;
		_Parachute setPos (getPos _spawn);
		_smoke = "smokeShellpurple" createVehicle position _spawn;
		_smoke setPos (getPos _spawn);
		_spawn attachTo [_Parachute,[0,0,-1.5]];
		_smoke attachTo [_Parachute,[0,0,-1.5]];
                
if(_randomObject == "Land_Barrel_water") then 
{
    _spawn setVariable["water",40,true];
};

if(_randomObject == "Land_stand_small_EP1") then 
{
    _spawn setVariable["food",40,true];
};
if(_randomObject == "EvMoney") then 
{
    _spawn setVariable["money",_count,true];
   _spawn setVariable["owner","world",true]; 
   
};
		waitUntil {(getPos _spawn select 2) < 2};
		deTach _spawn;
		//sleep 3;
                //_spawn setPos [(getPos _spawn select 0),(getPos _spawn select 1),0.001];
 
// Delete parachute
		sleep 15;
		
		deleteVehicle _Parachute;
                
                 _spawn setDamage (0.00);

sleep 10;
};