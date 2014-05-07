
if(!X_Server) exitWith {};

private ["_count","_pos","_mapside","_xCord","_yCord","_obj","_moneyCount", "_smoke"];

_moneyCount = Round (random 200) + 250;
for "_i" from 1 to _moneyCount do
    {
    //GREAT THX to Viba and KiloSwiss =D
    _count = Round(random 1000);
    _count1 = 1000;
if(_count == 1000) then { _count1 = 10000;};
if(_count < 999 AND _count >= 600) then{_rr =Round( random 10);_count1 = _count *_rr;};
if(_count < 599 AND _count >= 300) then{_rr =round( random 7)+3;_count1 = _count *_rr;};
if(_count < 299 AND _count >= 100) then{_rr =round( random 12)+8;_count1 = _count *_rr;};
if(_count < 100 AND _count > 1) then{_rr = round(40)+10;_count1 = _count *_rr;};

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
    _obj setVariable["cash",_count1,true];
    _obj setVariable["server",1,true];
    _obj setVariable["owner","world",true]; 
   
 
 //////////////////////////
};
diag_log format["WASTELAND SERVER - %1 Money Spawned",_moneyCount];