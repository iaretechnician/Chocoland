if(!isServer) exitWith {};
#include "setup.sqf"
_pos =[3632,3611,0];
while {true} do
{ 
 _countppl= 1500; //900 need
 _range= 0;
_countppl = count playableunits;
_countppl = _countppl *60;
_countppl = 2000 - _countppl;
 if(_countppl < 900)then {_countppl =900;};
sleep _countppl;
setdate[2020,10,10,14,10];
   _objects = nearestObjects [_pos, ["Air", "LandVehicle"], 30000];
            {   if ((damage _x) >=0.7 and (!isPlayer _x)) then { deleteVehicle vehicle _x; deleteVehicle _x; };
            if((damage _x) <0.7) then {_x setdamage 0;_x setfuel 1;_x setVehicleAmmo 1; [_x] call randomWeapons;      }; } forEach _objects; 
       //delete spawnzone
       _randomPos = [2103.3293,4300.7207,0];
       _baseToDelete = nearestObjects[_randomPos,["All"],250]; { if(typeof _x !="ProtectionZone_Ep1")then{deleteVehicle _x;}; } forEach _baseToDelete;
        
     //delete useless weapons etc
     _baseToDelete = nearestObjects [_randomPos,["WeaponHolder"],20000];
         {deletevehicle _x; }forEach _baseToDelete;
    _repair = nearestObjects [_pos, ["Building"], 20000];
    {_x setDammage 0;} forEach _repair;
  _hint = parseText format ["<t align='center' color='#17FF41' shadow='2' size='1.75'>ChocoSupply</t><br/><t align='center' color='%4'>------------------------------</t><br/><t align='center' color='#FFFFFF' size='1'>watch the sky</t><br/>"];
[nil,nil,rHINT,_hint] call RE;
    {
       	if (alive _x) then
		{ _bubblepos = [_x,[1, 500] call BIS_fnc_randomNum,[1, 359] call BIS_fnc_randomNum] call BIS_fnc_relPos;
		_bubblepos spawn compile preprocessfilelinenumbers"server\spawning\spawningObjects.sqf";
                 _bubblepos spawn compile preprocessfilelinenumbers "server\spawning\spawningVehicles.sqf";
                 _bubblepos spawn compile preprocessfilelinenumbers"server\spawning\spawningAnimals.sqf";
                 _bubblepos spawn compile preprocessfilelinenumbers"server\spawning\spawningchocokills.sqf";
                 _bubblepos spawn compile preprocessfilelinenumbers"server\spawning\spawningMoney.sqf";	
		
};
	} forEach playableUnits; 

 };
   
