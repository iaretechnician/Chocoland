//	@file Version: 1.0
//	@file Name: noscript.sqf
//	@file Author: [404] Costlyy
//	@file Created: NA
//	@file Args:
_smoke1 = _this select 0;
while {alive _smoke1} do
{
_smoke1 setdir (getDir _smoke1 + 13);
sleep 0.1;

};