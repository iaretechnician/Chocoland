//	@file Version: 1.0
//	@file Name: staticHeliCreation.sqf
//	@file Author: [404] Costlyy
//	@file Created: 20/12/2012 21:00
//	@file Description: Random static helis
//	@file Args: [int (0 = not wreck | 1 = wreck), array (position)]

if(!X_Server) exitWith {};
//sleep 600;

_size= Round (random 10);
// what object
for [{_x=0},{_x<=_size},{_x=_x+1}] do
{

_randomObject = randomVehicleArray select (random (count randomVehicleArray - 1));

        _count= Round (random 9999);
_mapside = Round (random 2);
     if(_mapside == 1) then 
     {
          _xCord = Round (random 1700) + 2896.75;
          _yCord = Round (random 2040) + 3515.77;
          _zCord = Round (random 500)+ 500;
          _pos = [_xCord, _yCord,_zCord];
     };
     if(_mapside == 2) then  
     {
         _xCord = Round (random 1650)+3671.96;
         _yCord = Round (random 1980)+ 2915;
         _zCord = Round (random 500)+ 500;
         _pos = [_xCord,_yCord,_zCord];
     };
	_pos = [3445.93,200,3665.25];
//coroutine

_spawn = createVehicle[_randomObject,_pos,[], 0,"CAN_COLLIDE"];
			_spawn setDir dir+270;
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
   
		waitUntil {(getPos _spawn select 2) < 2};
		deTach _spawn;
		//sleep 3;
                //_spawn setPos [(getPos _spawn select 0),(getPos _spawn select 1),0.001];
 
// Delete parachute
		sleep 15;
		
		deleteVehicle _Parachute;
                
                 _spawn setDamage (0.00);


};
