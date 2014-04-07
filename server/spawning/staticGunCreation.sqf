//	@file Version: 1.0
//	@file Name: Script Name
//	@file Author: [404] Deadbeat
//	@file Created: DD/MM/YYYY HH:MM
//	@file Args:

if(X_Server) exitWith {};
/*
private ["_count","_pos","_mapside","_xCord","_yCord","_obj","_moneyCount", "_smoke"];

_moneyCount = Round (random 200) + 250;
for "_i" from 1 to _moneyCount do
    {
    //GREAT THX to Viba and KiloSwiss =D
    _count = Round (random 400)+100;
    if(_count == 600) then
        {
         _count= Round (random 4);
         if(_count == 2) then{_count = 50000;} else {_count = 10000;};
        };
     if(_count < 500 AND _count > 150) then 
        {
            _random = Round (random 4);
           if(_random == 1) then{_count = _count *1;};
        if(_random == 2) then{_count = _count *2;};
     if(_random == 3) then{_count = _count *3;};
  if(_random == 4) then{_count = _count *4;};
        };
    if(_count < 150 AND _count > 1) then 
        {
          _count = 1000;
          _count= Round (random 3);
          if(_count == 2) then{_count = 5000;} else {_count = 1000;};
        };
        if(_count == 1) then{_count = 1;};
     _mapside = Round (random 2);
     if(_mapside == 1) then 
     {
          _xCord = Round (random 2000) + 2436.33;
          _yCord = Round (random 1140) + 3501.65;
          _pos = [_xCord,  _yCord,0.00143];
     }
     else 
     {
         _xCord = Round (random 1550)+3197.88;
         _yCord = Round (random 1375)+ 2857;
         _pos = [_xCord, _yCord, 0.00143];
     };
_rand = Round (random 3);
if (_rand == 1)then{_obj = "Rabbit" createVehicle _pos;
    _obj setpos (getpos _obj);};
if (_rand == 2)then{_obj = "Goat" createVehicle _pos;
    _obj setpos (getpos _obj);};
if (_rand == 3)then{_obj = "Cow4" createVehicle _pos;
    _obj setpos (getpos _obj);};
  
    };*/