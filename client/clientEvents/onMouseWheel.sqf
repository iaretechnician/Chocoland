terminate playerMenuHandle;
playerMenuHandle = [] spawn {
	waituntil {!isnull player};
	private ["_veh"];
	while {true} do {
		waituntil {vehicle player == player};
                player removeaction saveVehId;
		if (!isnil "_veh") then {_veh removeaction playerMenuId;_veh removeaction saveVehId};
		playerMenuId = player addAction [format ["<t color='#FF6600'>%1</t>", "Player Menu"], "client\systems\playerMenu\init.sqf",[],-10,false,false,"","local player"];
		/// custom
              playerWeaponId =    player addAction[('<t color=''#FF33CC''>' + ('Online Weapon Store') +    '</t>'),'client\systems\gunStore\loadGunStore.sqf'];
               
                waituntil {vehicle player != player};
		player removeaction playerMenuId;
                player removeaction playerWeaponId;
              
		_veh = vehicle player;
		playerMenuId = _veh addAction [format ["<t color='#FF6600'>%1</t>", "Player Menu"], "client\systems\playerMenu\init.sqf",[],-10,false,false,"","local player"];
                saveVehId = _veh addAction [format ["<t color='#FF9900'>%1</t>", "Save Vehicle"], "",[],-10,false,false,"","local player"];
	};
};