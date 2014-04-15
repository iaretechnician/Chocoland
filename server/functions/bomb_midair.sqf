_private=["_player"];
_player = _this select 0;
_pos = getpos _player;
_obj="Bomb" createVehicle [0,0,0];
_Anade="Sh_120_SABOT" createVehicle [0,0,0];
_obj setpos [(_pos select 0),(_pos select 1) ,(_pos select 2) -0.1];
_Anade setpos [(_pos select 0),(_pos select 1) ,(_pos select 2) +0.1];