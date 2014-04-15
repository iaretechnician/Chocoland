if(!X_Server) exitWith {};
    _size= Round (random 10);
// what object
for [{_x=0},{_x<=_size},{_x=_x+1}] do
{

_randomObject = randomBuildingrray call BIS_fnc_selectRandom; 
//berechne marker
_mapside = Round(random 2);
 _xCord = Round (random 500);
_yCord = Round (random 500);
_plusminus=Round(random 2);
_plusminus2=Round(random 2);
_pos=[3710,3606,500];
//mapside 1   
if(_mapside == 1)then{
if(_plusminus == 1)then{_xCord = 3283 + _xCord;}else{_xCord = 3283 - _xCord;};
if(_plusminus2 == 1)then{_yCord=4042 +_yCord;}else{_yCord= 4042 -_yCord;};
_pos=[_xCord,_yCord,500];};
//mapside2
if(_mapside == 2)then{
if(_plusminus == 1)then{_xCord = 2800 + _xCord;};
if(_plusminus2 == 1)then{_yCord=4042 +_yCord;}else{_yCord= 4042 -_yCord;};
_pos=[_xCord,_yCord,500];};
//coroutine
_spawn = _randomObject createVehicle _pos;
    _spawn setpos _pos;
				clearMagazineCargoGlobal _spawn;
				clearWeaponCargoGlobal _spawn;
			_spawn setVariable["original",1,true];
			_spawn setVariable["R3F_LOG_disabled", false, true];
	 _Parachute = "ParachuteBigWest_EP1" createVehicle position _spawn;
         
		_Parachute setPos (getPos _spawn);
                _Parachute setvelocity [0,10,0];
		_spawn attachTo [_Parachute,[0,0,-1.5]];
if(_randomObject == "Land_Barrel_water") then 
{
    _spawn setVariable["water",40,true];
};

if(_randomObject == "Land_stand_small_EP1") then 
{
    _spawn setVariable["food",40,true];
};
		waitUntil {(getPos _spawn select 2) < 2};
		deTach _spawn;
		sleep 1;
		deleteVehicle _Parachute;
                 _spawn setDamage (0.00);
                 
};
