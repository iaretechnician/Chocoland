_select = _this select 3 select 0;


hint format ["%1",_select];
	if(_select == 1) then {
		vehicle player setVehicleLock "LOCKED";
player globalchat "vehicle locked.";
		vehicle player setVariable ["R3F_LOG_disabled",true,true];
locking= true;
	};
if (_select ==2)then {
		vehicle player setVehicleLock "UNLOCKED";
		vehicle player setVariable ["R3F_LOG_disabled",false,true];
player globalchat "vehicle unlocked.";
locking= false;
	};
