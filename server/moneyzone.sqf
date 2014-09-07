if(!isServer) exitwith {};
diag_log format["WASTELAND SERVER - Mission Started"];
_pos =[3632,3611,0];
while {true} do
{ _random = round (random 100);
    if(_random >90 && count playableunits >8)then{_objects = nearestObjects [_pos, ["Air", "LandVehicle"], 30000]; {  [_x] call randomWeapons;} forEach _objects;};
     _xCord1 = Round (random 1500) + 2757.01;
    _yCord1 = Round (random 1200) + 3108.21;
    _pos1 = [_xCord1, _yCord1,-14];
 _smoke1 = createVehicle ["Sign_circle",_pos1,[], 0,"CAN_COLLIDE"];
 _smoke1 setpos _pos1;
_reward = 999;
_pos1 = [_xCord1, _yCord1,0.0014];
[_smoke1]execVM "server\events\moneyzoneEffect.sqf";
 _timer=0;
 _reward = 100 max(count playableunits*33);
 _war1 = "you get $";
 while {_timer <=60} do
{     
   _timer =_timer +1;
  _inArea = _smoke1 nearEntities 9;
  {
   if (isPlayer _x) then {sleep 1;
  [nil,_x, "loc", rEXECVM, "client\functions\moneyZone.sqf", "reward", _war1, _reward] call RE;};
  } forEach _inArea;
   
};
waitUntil{sleep 1; _timer >= 60};
 deleteVehicle _smoke1;
_sleep = ((count playableunits) * 2)+60;
sleep _sleep;
};