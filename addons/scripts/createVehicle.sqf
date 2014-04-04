if(!isNull vehicleSave)then 

{player playmove "AinvPknlMstpSlayWrflDnon";
closeDialog 0;
sleep 3;
_dir = getdir player;
_pos = getPos player;
_pos = [(_pos select 0)+20*sin(_dir),(_pos select 1)+20*cos(_dir),50];
_veh = vehicleSave;
_veh setpos _pos;
_veh setVelocity [0, 0.1, 0];
vehicleSave hideObject false;
player playmove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";
_veh allowdamage false;
 hint format ["%1 spawned in the Sky", vehicleSave1]; 
vehicleSave = objNull; 
vehicleSave1  = objNull;
_Parachute = createVehicle ["ParachuteBigWest_EP1",_pos,[], 0,"FLY"];
_Parachute setPos _pos;
_Parachute setVelocity [0, 1, 0];
_veh attachTo [_Parachute,[0,0,-1.5]];
waitUntil {(getPos _veh select 2) < 2};
deTach _veh;
sleep 5;
deleteVehicle _Parachute;
_veh allowdamage true;
player globalChat "Hangar is Empty"; 
   
} else { player globalChat "Hangar is Empty, you cannot Spawn your Vehicle"; };

