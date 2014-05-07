
if(!X_Server) exitWith {};

    //GREAT THX to Viba and KiloSwiss =D
      _count = Round(random 1000);
    _count1 = 1000;
if(_count == 1000) then { _count1 = 10000;};
if(_count < 999 AND _count >= 600) then{_rr =Round( random 10);_count1 = _count *_rr;};
if(_count < 599 AND _count >= 300) then{_rr =round( random 7)+3;_count1 = _count *_rr;};
if(_count < 299 AND _count >= 100) then{_rr =round( random 12)+8;_count1 = _count *_rr;};
if(_count < 100 AND _count > 1) then{_rr = round(40)+10;_count1 = _count *_rr;};

_private=["_pos1"];
_pos1=_this;
_pos =[_pos1 select 0,_pos1 select 1,500];

  _spawn = createVehicle ["EvMoney",_pos,[], 0,"CAN_COLLIDE"];
			
                        _spawn setPos _pos;
   _spawn setVariable["cash",_count,true];
   _spawn setVariable["server",1,true];
   _spawn setVariable["owner","world",true]; 
   _Parachute = "ParachuteMediumEast" createVehicle _pos;
          clearMagazineCargoGlobal _spawn;
	clearWeaponCargoGlobal _spawn;
_spawn setVariable["original",1,true];
_spawn setVariable["R3F_LOG_disabled", false, true];
_Parachute setPos (getPos _spawn);
   _Parachute setvelocity [0,10,0];
	_spawn attachTo [_Parachute,[0,0,-1.5]];
		waitUntil {(getPos _spawn select 2) < 1.5 ||!(alive _Parachute)||!(alive _spawn)};
                _test = getpos _spawn;
                _spawn setpos _test;
                _spawn setvelocity[0,0,0];
          _spawn setPos [(getPos _spawn select 0),(getPos _spawn select 1),1];
		deTach _spawn;
		//sleep 1;
		deleteVehicle _Parachute;
                 _spawn setDamage (0.00);
