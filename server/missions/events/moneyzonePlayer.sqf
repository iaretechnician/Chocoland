//	@file Version: 1.0
//	@file Name: noscript.sqf
//	@file Author: [404] Costlyy
//	@file Created: NA
//	@file Args:
_smoke1 = _this select 0;
_timer =0;
while {_timer <=60} do
{     
   
     	_inArea = _smoke1 nearEntities 8;
	{
	if (isPlayer _x) then {
          	 [nil,_x, "loc", rEXECVM, "client\functions\moneyZone.sqf", "reward", _war1, _reward] call RE;};
    } forEach _inArea;
   sleep 1;
   _timer =_timer +1;
};
_moneyplayer;