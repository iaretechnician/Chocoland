// THANKS to KiloSwiss  scripty by KiloSwiss
private["_action","_victim","_reward","_punishment","_killerMoney","_newMoney"];

_action = _this select 0;
_victim = _this select 1;
_reward = _this select 2;


switch (_action) do{
	case "punish" :{
		if(alive player)then{
			_punishment = floor((player getVariable "cmoney") / 10);	//Calculate how much money will be left over after punishment
			titleText [format["PUNISHMENT: -%1$ for TEAMKILLING your teammate %2 and 1 minute no Weapon",_punishment, str name _victim], "PLAIN", 0];
			 player setVariable["cmoney", (player getVariable "cmoney")- _punishment, false];
                         _killerb = player getvariable"bounty";if(_killerb==0)then{_killerb=0;};if(isnil "_killerb")then{_killerb=0;};
                         if(_killerb > 0)then{ player setVariable["bounty", _killerb -1, false];
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
           
            _money = player getVariable "cmoney";
        _killerb = player getvariable"bounty";if(_killerb==0)then{_killerb=1;};if(isnil "_killerb")then{_killerb=1;};
        _reward = _reward * _killerb;
         
        titleText [format["\n+ %1$ for killing %2", _reward, name _victim], "PLAIN DOWN", 0];
	
             player setVariable["cmoney", _money + _reward, false];
             _killerb = player getvariable"bounty";if(_killerb==0)then{_killerb=0;};if(isnil "_killerb")then{_killerb=0;};
             player setVariable["bounty", _killerb + 1, false];
	};
};