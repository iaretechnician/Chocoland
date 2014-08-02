if(!isServer) exitWith {};


#include "setup.sqf"
diag_log format["WASTELAND SERVER - Started event State"];

//Main Mission Array
_MMarray1 = ["night"];
eventRunning = false;
_pos =[3632,3611,0];
_random =0;
while {true} do
{ //waiting
    _countppl= 3600; //900 need
    {
	if (alive _x) then
		{
                _countppl= _countppl -90;	
		};
	}forEach playableUnits; 
       if(_countppl < 900)then {_countppl =900;};
        sleep _countppl;
 if(count playableunits >10)then{_objects = nearestObjects [_pos, ["Air", "LandVehicle"], 30000]; {  [_x] call randomWeapons;} forEach _objects;};
    if(!eventRunning) then
    {
        _random = round (random 10);
        if(_random = 5)then{
         _mission = _MMarray1 call BIS_fnc_selectRandom; 
         execVM format ["server\missions\events\%1.sqf",_mission];
         eventRunning = true;
         diag_log format["WASTELAND SERVER - Execute New event"];
	};
    };
   
};