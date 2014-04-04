_cursortarget = cursorTarget;
deleteVehicle cursorTarget;
hint format ["you destroyed %1  Object", _cursortarget];
player removeaction playerdeleteObject;
sleep;
hint format ["%1 deleted from Server", _cursortarget];