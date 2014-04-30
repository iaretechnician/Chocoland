//	@file Version: 1.0
//	@file Name: worldMissionController.sqf
//	@file Author: [404] Costlyy
//	@file Created: 30th May 2013
//	@file Args:

if(!isServer) exitWith {};


#include "setup.sqf"
diag_log format["WASTELAND SERVER - Started spawning State"];

_pos =[3632,3611,0];
while {true} do
{ 

sleep 2400;
_hint = parseText format ["<t align='center' color='#17FF41' shadow='2' size='1.75'>ChocoSupply</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='#FFFFFF' size='1'>watch the sky</t><br/>"];
[nil,nil,rHINT,_hint] call RE;
    {
	if (alive _x) then
		{
                 setWind [0, 0, true];
		 []execVM "server\spawning\spawningObjects.sqf";
                []execVM "server\spawning\spawningVehicles.sqf";
                 []execVM "server\spawning\spawningAnimals.sqf";
                []execVM "server\spawning\spawningchocokills.sqf";
                []execVM "server\spawning\spawningMoney.sqf";	
		};
	} forEach playableUnits; 
        
      _objects = nearestObjects [_pos, ["Air", "LandVehicle"], 20000]; //Get all units, vehicles and air vehicles in the map
        {
            if ((damage _x) >=0.7) then { deleteVehicle vehicle _x; deleteVehicle _x; };
            if((damage _x) <0.7) then {
            _x setdamage 0;
            _x setfuel 1;
            _x setVehicleAmmo 1;
            clearMagazineCargoGlobal _x;
            clearWeaponCargoGlobal _x;
            [_x] call randomWeapons;};
          } forEach _objects; 
       //delete spawnzone
       _randomPos = [2103.3293,4300.7207,0];_baseToDelete = nearestObjects[_randomPos,["All"],150]; { if(typeof _x !="ProtectionZone_Ep1")then{deleteVehicle _x;}; } forEach _baseToDelete;
     //delete useless weapons etc
     _baseToDelete = nearestObjects [_randomPos,["WeaponHolder"],50000];{deletevehicle _x; }forEach _baseToDelete;
   
 };
   
