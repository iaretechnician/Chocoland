

terminate playerMenuHandle;
playerMenuHandle = [] spawn {
	waituntil {!isnull player};
        x1 = player;
	private ["_veh"];
	while {true} do {
		waituntil {vehicle player == player};
                player removeaction saveVehId;
		if (!isnil "_veh") then {_veh removeaction playerMenuId;_veh removeaction saveVehId};
		playerMenuId = player addAction [format ["<t color='#FF6600'>%1</t>", "Player Menu"], "client\systems\playerMenu\init.sqf",[],-10,false,false,"","local player"];
		/// custom
                playerWeaponId = player addAction [format ["<t color='#219eff'>%1</t>", "ParaStore"], "client\systems\menu\loadmenu.sqf",[],-9,false,false,"","local player"];

                waituntil {vehicle player != player};
		player removeaction playerMenuId;
                player removeaction playerWeaponId;
               _veh = vehicle player;
if(typeof vehicle player == "Old_moto_TK_Civ_EP1")then {saveVehId = _veh addAction [format ["<t color='#FF9900'>%1</t>", "hey cow <3"], "addons\scripts\cow.sqf",[],10,false,false,"","local player"];};
		saveVehId = _veh addAction [format ["<t color='#FF9900'>%1</t>", "Save Vehicle"], "addons\scripts\saveVehicle.sqf",[],-10,false,false,"","local player"];
			  if(rainbow==1) then {player removeAction playerbaseObject; playerbaseObject = _veh addAction[('<t color=''#17FF41''>' + ('give me Rainbow Power') +  '</t>'),'client\systems\FunStore\adds\rainbow.sqf'];};
        };
};