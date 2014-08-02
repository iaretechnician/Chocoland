if(!isServer) exitWith {};


#include "setup.sqf"
diag_log format["WASTELAND SERVER - Started spawning State"];

_pos =[3632,3611,0];
while {true} do
{ 

//waiting
 _countppl= 3600; //900 need
 _rand= 0;
_countppl = count playableunits;
_countppl = _countppl *45;
_countppl = 3600 - _countppl;
   if(_countppl < 1800)then {_countppl =1800;};
    
  sleep _countppl;


   _objects = nearestObjects [_pos, ["Air", "LandVehicle"], 30000]; //Get all units, vehicles and air vehicles in the map
        {
            if ((damage _x) >=0.3 and (!isPlayer _x)) then { deleteVehicle vehicle _x; deleteVehicle _x; };
            if((damage _x) <0.3) then {
            _x setdamage 0;
            _x setfuel 1;
            _x setVehicleAmmo 1;
            clearMagazineCargoGlobal _x;
            clearWeaponCargoGlobal _x;
            [_x] call randomWeapons;
            };
          } forEach _objects; 
       //delete spawnzone
       _randomPos = [2103.3293,4300.7207,0];
       _baseToDelete = nearestObjects[_randomPos,["All"],250]; { if(typeof _x !="ProtectionZone_Ep1")then{deleteVehicle _x;}; } forEach _baseToDelete;
       _moneysetplayer = nearestObjects [_randomPos,["EvMoney"],20000];
       _player =1 max floor(count playableunits/5);if(_player > 1)then{
       {if(_x getvariable"multi" != 1 && (_x getvariable"cash") < 15000)then{ _x setvariable["cash",Round((_x getvariable"cash")* _player),true];
       _rand = Round(random 4);if(_rand !=3)then{ _x setvariable["multi",1,true];};
       };
       }forEach _moneysetplayer;};
       
     //delete useless weapons etc
     _baseToDelete = nearestObjects [_randomPos,["WeaponHolder"],20000];{deletevehicle _x; }forEach _baseToDelete;
    _repair = nearestObjects [_pos, ["Building"], 20000];  {_x setDammage 0;} forEach _repair;
  _hint = parseText format ["<t align='center' color='#17FF41' shadow='2' size='1.75'>ChocoSupply</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='#FFFFFF' size='1'>watch the sky</t><br/>"];
[nil,nil,rHINT,_hint] call RE;
    {
	if (alive _x) then
		{
                
                  _range = [1, 1000] call BIS_fnc_randomNum;
                 _direction = [1, 359] call BIS_fnc_randomNum;
                 _bubblepos = [_x,_range,_direction] call BIS_fnc_relPos;
                 _bubblepos=[_bubblepos, 1,100, 10, 0, 30, 0] call BIS_fnc_findSafePos;
		 _bubblepos execVM "server\spawning\spawningObjects.sqf";
                 _bubblepos execVM "server\spawning\spawningVehicles.sqf";
                 _bubblepos execVM "server\spawning\spawningAnimals.sqf";
                 _bubblepos execVM "server\spawning\spawningchocokills.sqf";
                 _bubblepos execVM "server\spawning\spawningMoney.sqf";	
		};
	} forEach playableUnits; 
   
 };
   
