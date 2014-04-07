//	@file Version: 1.0
//	@file Name: releaseVIP.sqf
//	@file Author: [404] Costlyy
//	@file Created: 30th May 13
//	@file Args:

_unitVIP = nearestObjects [player, ["Land_LHD_1"],  5] select 0;
_positionVIP = getPosATL _unitVIP;

player setPos _positionVip;


