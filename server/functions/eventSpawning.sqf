private ["_count","_pos","_mapside","_xCord","_yCord","_obj","_moneyCount"];
    _count = Round (random 400)+100;
    if(_count == 600) then
        {
         _count= Round (random 4);
         if(_count == 2) then{_count = 12000;} else {_count = 7000;};
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
     _mapside = Round (random 2);
     if(_mapside == 1) then 
     {
          _xCord = Round (random 2000) + 2436.33;
          _yCord = Round (random 1140) + 3501.65;
          _pos = [_xCord,_yCord,500];
               }
     else 
     {
         _xCord = Round (random 1550)+3197.88;
         _yCord = Round (random 1375)+ 2857;
         _pos = [_xCord,_yCord, 500];
      
     };
      _obj = "EvMoney" createVehicle _pos;
    _obj setPos _pos;
    _obj setVariable["money",_count,true];
    _obj setVariable["owner","world",true];
_Parachute = "ParachuteC" createVehicle _pos;
_Parachute setPos _pos;  _obj attachTo [_Parachute,[0,0,-1.5]];
_Parachute setVelocity[0, 20, 0];
waitUntil {(getPos _obj select 2) < 2};
deTach _obj;
sleep 5;
deleteVehicle _Parachute;
