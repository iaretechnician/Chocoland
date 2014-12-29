
if(!X_Server) exitWith {};

private ["_count","_pos","_mapside","_xCord","_yCord","_obj","_moneyCount", "_smoke"];

_moneyCount = Round (random 200) + 250;
for "_i" from 1 to _moneyCount do
    {
    //GREAT THX to Viba and KiloSwiss =D
    _count = floor (random 4000)+1000;
    if(_count == 450) then
        {
         _random = Round (random 6);
         _count = 10000;
         if(_random == 2) then{_random = 20000;};
        };
     if(_count < 450 AND _count > 150) then 
        {
            _random = Round (random 10);
     if(_random == 2) then{_count = _count *2;};
     if(_random == 3) then{_count = _count *3;};
  if(_random == 4) then{_count = _count *4;};
        };
    if(_count < 100 AND _count > 1) then 
        {
          _count = 600;
          _random= Round (random 3);
          if(_random == 2) then{_count = 2000;};
          if(_random == 3) then{_count = 1000;};
        };
     _mapside = Round (random 2);
     if(_mapside == 1) then 
     {
          _xCord = Round (random 2000) + 2436.33;
          _yCord = Round (random 1140) + 3501.65;
          _pos = [_xCord, _yCord,0.0014];
     }
     else 
     {
         _xCord = Round (random 1550)+3197.88;
         _yCord = Round (random 1375)+ 2857;
         _pos = [_xCord,_yCord, 0.0014];
     };

    //Now create Object
    _obj = "EvMoney" createVehicle _pos;
    _obj setpos (getpos _obj);
    _obj setVariable["cash",_count,true];
    _obj setVariable["server",1,true];
    _obj setVariable["owner","world",true]; 
   
 
 //////////////////////////
};
diag_log format["WASTELAND SERVER - %1 Money Spawned",_moneyCount];