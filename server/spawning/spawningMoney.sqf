
if(!X_Server) exitWith {};

    //GREAT THX to Viba and KiloSwiss =D
    _count = Round (random 250)+200;
    if(_count == 450) then
        {
         _random = Round (random 6);
         _count = 10000;
         if(_random == 2) then{_random = 20000;};
        };
     if(_count < 450 AND _count > 150) then 
        {
            _random = Round (random 10);
     if(_random == 2) then{_count = _count *2;};
     if(_random == 3) then{_count = _count *3;};
  if(_random == 4) then{_count = _count *4;};
        };
    if(_count < 100 AND _count > 1) then 
        {
          _count = 600;
          _random= Round (random 3);
          if(_random == 2) then{_count = 2000;};
          if(_random == 3) then{_count = 1000;};
        };
  //berechne marker
_mapside = Round(random 2);
 _xCord = Round (random 500);
_yCord = Round (random 500);
_plusminus=Round(random 2);
_plusminus2=Round(random 2);
_pos=[3710,3606,500];
//mapside 1   
if(_mapside == 1)then{
if(_plusminus == 1)then{_xCord = 3283 + _xCord;}else{_xCord = 3283 - _xCord;};
if(_plusminus2 == 1)then{_yCord=4042 +_yCord;}else{_yCord= 4042 -_yCord;};
_pos=[_xCord,_yCord,500];};


//mapside2
if(_mapside == 2)then{
if(_plusminus == 1)then{_xCord = 2800 + _xCord;};
if(_plusminus2 == 1)then{_yCord=4042 +_yCord;}else{_yCord= 4042 -_yCord;};
_pos=[_xCord,_yCord,500];};



  _spawn = createVehicle ["EvMoney",_pos,[], 0,"CAN_COLLIDE"];
			
                        _spawn setPos _pos;
   _spawn setVariable["money",_count,true];
   _spawn setVariable["server",1,true];
   _spawn setVariable["owner","world",true]; 
   _Parachute = "ParachuteMediumEast" createVehicle _pos;
          clearMagazineCargoGlobal _spawn;
	clearWeaponCargoGlobal _spawn;
_spawn setVariable["original",1,true];
_spawn setVariable["R3F_LOG_disabled", false, true];
_Parachute setPos (getPos _spawn);
   _Parachute setvelocity [0,10,0];
	_spawn attachTo [_Parachute,[0,0,-1.5]];
		waitUntil {(getPos _spawn select 2) < 1.5};
                _test = getpos _spawn;
                _spawn setpos _test;
                _spawn setvelocity[0,0,0];
          _spawn setPos [(getPos _spawn select 0),(getPos _spawn select 1),1];
		deTach _spawn;
		//sleep 1;
		deleteVehicle _Parachute;
                 _spawn setDamage (0.00);
