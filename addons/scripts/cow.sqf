player say "cow";
_randomPos=getposasl player;
_missionRewardRadius= 20;
_inArea = _randomPos nearEntities _missionRewardRadius;
	{
	if (isPlayer _x) then {
           [nil, _x, "loc", rEXECVM, "addons\scripts\cow1.sqf",name player] call RE;
          
	};
	} forEach _inArea;
        
       