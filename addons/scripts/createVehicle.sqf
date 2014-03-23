_dir = getdir player;
		_pos = getPos player;
		_pos = [(_pos select 0)+20*sin(_dir),(_pos select 1)+20*cos(_dir),0];
		_vehtype = saveVehicle;
		_veh = createVehicle [_vehtype, _pos, [], 0, "CAN_COLLIDE"];
		_veh setDir _dir;
                hintsilent "Vehicle Spawned, SAVE is EMPTY";