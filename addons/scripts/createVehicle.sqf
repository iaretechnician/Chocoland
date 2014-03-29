if(saveVehicle != 0)then {
_dir = getdir player;
		_pos = getPos player;
		_pos = [(_pos select 0)+20*sin(_dir),(_pos select 1)+20*cos(_dir),0];
                
		_vehtype = saveVehicle;
		_veh = createVehicle [_vehtype, _pos, [], 0, "CAN_COLLIDE"];
		_veh setDir _dir;
                clearMagazineCargoGlobal _veh;
				clearWeaponCargoGlobal _veh;
			_veh setVariable["original",1,true];
			_veh setVariable["R3F_LOG_disabled", false, true];
                hintsilent "Vehicle Spawned, Hangar is EMPTY";
                saveVehicle = 0;
                };
                