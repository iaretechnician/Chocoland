 _rvehicle = randomVehicleArray select (random (count randomVehicleArray - 1));
hint "1 Random Vehlice";
 _dir = getdir player;
   _pos = getPos player;
     _pos = [(_pos select 0)+5*sin(_dir),(_pos select 1)+5*cos(_dir),50];
_spawn = createVehicle [_rvehicle,_pos,[], 0,"CAN_COLLIDE"];
			_spawn setDir _dir;
                        _spawn allowdamage false;
			clearMagazineCargoGlobal _spawn;
			clearWeaponCargoGlobal _spawn;
                 
			_spawn setVariable["original",1,true];
			_spawn setVariable["R3F_LOG_disabled", false, true];           
              _Parachute = "ParachuteBigWest_EP1" createVehicle position _spawn;
		_Parachute setPos (getPos _spawn);
                _Parachute setVelocity [0, 3, 1];
                _random = Round (random 5);
                _spawn attachTo [_Parachute,[0,0,-1.5]];
		 if (_random == 5) then {
		_smoke = "smokeShellblue" createVehicle position _spawn;
		_smoke setPos (getPos _spawn);
		_smoke attachTo [_Parachute,[0,0,-1.5]];
                };
                waitUntil {(getPos _spawn select 2) < 2};
		deTach _spawn;
		sleep 15;
		deleteVehicle _Parachute;
                 _spawn setDamage (0.00);
                 _spawn allowdamage true;