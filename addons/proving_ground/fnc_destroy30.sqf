
_randomPos = getpos player;_baseToDelete = nearestObjects [_randomPos, ["All"], 22];
{ deleteVehicle _x; } forEach _baseToDelete;

