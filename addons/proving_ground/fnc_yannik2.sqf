hint "yanniks  Mv22 + flares";
_pos = getpos player;
_Parachute = "MV22" createVehicle _pos;
_Parachute setPos _pos;_pos= [(_pos select 0)+30,(_pos select 1), (_pos select 2)];
player moveindriver _Parachute;  player assignAsDriver _Parachute;
sleep 1;
vehicle player addWeapon "Gau12";vehicle player addMagazine "300Rnd_25mm_GAU12";
vehicle player addWeapon "Bomblauncher";vehicle player addMagazine "6Rnd_GBu12_AV8B";
vehicle player addWeapon "CMFlareLauncher";vehicle player addMagazine "120Rnd_CMFlare_Chaff_Magazine";
