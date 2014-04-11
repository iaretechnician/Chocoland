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
                        _time =0;
                        while{(_time == 60)} do 
                            {
                            removeAllWeapons player;
                            sleep 1;
                            _time = _time +1;
                            };
                        
		};
	};
	case "reward" :{
           //  _killerbounty = player getvariable"bounty";if(_killerbounty==0)then{_killerbounty==1};
              //      _playerbounty = _victim getVariable"bounty";if(_playerbounty==0)then{_playerbounty==1};
                 //   _reward = _killerbounty * 100 * _playerbounty;
                    titleText [format["\n+ TEST deineScore %1, meine %2 und geld? %3", _playerbounty,_killerbounty, _reward], "PLAIN DOWN", 0];
	sleep 3;
        titleText [format["\n+ %1$ for killingtesttest %2", _reward, name _victim], "PLAIN DOWN", 0];
	_test = player getVariable "cmoney";
        _bount= player getVariable "bounty";
             player setVariable["cmoney", _test + _reward, false];
             player setVariable["bounty", _bount + 1, false];
	};
};