
// THANKS to KiloSwiss  scripty by KiloSwiss
private["_action","_victim","_reward","_punishment","_killerMoney","_newMoney"];

_action = _this select 0;
_victim = _this select 1;
_reward = _this select 2;
_distance = _this select 3;
switch (_action) do{
	case "punish" :{
		if(alive player)then{
			_punishment = floor((player getVariable "choco") / 10);	//Calculate how much money will be left over after punishment
			titleText [format["PUNISHMENT: -%1$ for TEAMKILLING your teammate %2 and 1 minute no Weapon",_punishment, str name _victim], "PLAIN", 0];
			 player setVariable["choco", (player getVariable "choco")- _punishment, true];
                         _killerb = player getvariable"bounty";if(_killerb==0)then{_killerb=0;};if(isnil "_killerb")then{_killerb=0;};
                         if(_killerb > 0)then{ player setVariable["bounty", _killerb -1, true];
                         };
                     
                        _time =0;
                        while{_time <= 60} do 
                            {
                            removeAllWeapons player;
                            sleep 1;
                            _time = _time +1;
                            };
                        		};
	};
	case "reward" :{
           player setvariable["multikill",(player getVariable "multikill")+1,true];
           _multikill = (player getVariable "multikill");
           []execVM "client\functions\multikillTimer.sqf";
            _money = player getVariable "choco";
        _killerb = player getvariable"bounty";if(_killerb==0)then{_killerb=1;};if(isnil "_killerb")then{_killerb=1;};
        _reward = _reward * _killerb;
         if(_multikill >= 2)then {_reward = _reward * _multikill;};
        titleText [format["\n+ %1$ for killing %2", _reward, name _victim], "PLAIN DOWN", 0];
	
      player setVariable["choco", _money + _reward, true];
     _killerb = player getvariable"bounty";if(_killerb==0)then{_killerb=0;};if(isnil "_killerb")then{_killerb=0;};
     player setVariable["bounty", _killerb + 1, true];
     _random= 0;
     
	if(str(playerSide) in ["EAST"]|| str(playerSide) in ["WEST"])then {_random =Round (random 2);if(_random ==2)then { player setVariable["bounty", _killerb + 1, true];};};
        if(_multikill >=2)then{
            {if(alive _x) then{
            [nil, _x, "loc", rEXECVM, "client\functions\multikill.sqf",_multikill,name player] call RE;};
            }forEach playableUnits;};
        };
};