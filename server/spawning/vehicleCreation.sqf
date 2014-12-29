
//	@file Version: 1.0
//	@file Name: vehicleCreation.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

if(!X_Server) exitWith {};

private ["_marker","_cartype","_car","_num","_tipped","_carpos","_type","_townpos"];
_type = _this select 1;
_pos = _this select 0;

//Create Civilian Vehicle
if (_type == 0) then {
	//Car Initilization, Pick Car Type.
    _cartype = civilianVehicles select (random (count civilianVehicles - 1));
    _car = createVehicle [_cartype,_pos,[], 20,"None"];
    _car setpos [getpos _car select 0,getpos _car select 1,0];
_car setVariable["R3F_LOG_disabled", false, true];
	//Clear Cars Inventory
    clearMagazineCargoGlobal _car;
    clearWeaponCargoGlobal _car;

	//Set Cars Attributes
    _car setFuel (0.50);
    _car setDamage (random 0.50);
    _car setDir (random 360);
	_car setVelocity [0,0,1];
    [_car] call randomWeapons;
[_car] call randomWeapons;
[_car] call randomWeapons;
	//Set original posistion then add to vehicle array
	
};

//Create Military Vehicle
if (_type == 1) then {
	//Car Initilization, Pick Car Type.
    _cartype = militaryVehicles select (random (count militaryVehicles - 1));
    _car = createVehicle [_cartype,_pos, [], 30, "None"];
    _car setpos [getpos _car select 0,getpos _car select 1,0];
	_car setVariable["R3F_LOG_disabled", false, true];
    
	//Clear Cars Inventory
    clearMagazineCargoGlobal _car;
    clearWeaponCargoGlobal _car;

	//Set Cars Attributes
    _car setFuel (0.50);
    _car setDamage (random 0.50);
    _car setDir (random 360);
	_car setVelocity [0,0,1];
    [_car] call randomWeapons;
[_car] call randomWeapons;
[_car] call randomWeapons;
	//Set authenticity
	
};

//Create Armed Military Vehicle
if (_type == 2) then {
	//Car Initilization, Pick Car Type.
    _cartype = armedMilitaryVehicles select (random (count armedMilitaryVehicles - 1));
    _car = createVehicle [_cartype,_pos, [], 30, "None"];
    _car setpos [getpos _car select 0,getpos _car select 1,0];
   _car setVariable["R3F_LOG_disabled", false, true];

	//Clear Cars Inventory
    clearMagazineCargoGlobal _car;
    clearWeaponCargoGlobal _car;

	//Set Cars Attributes
    _car setFuel (0.50);
    _car setDamage (random 0.50);
    _car setDir (random 360);
    _car setVehicleAmmo (random 0.90);
	_car setVelocity [0,0,1];
    [_car] call randomWeapons;
[_car] call randomWeapons;
[_car] call randomWeapons;
	
	
};
