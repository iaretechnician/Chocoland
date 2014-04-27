// THANKS to KiloSwiss  scripty by KiloSwiss
private["_action","_victim","_reward","_punishment","_killerMoney","_newMoney"];

_action = _this select 0;
_victim = _this select 1;
_reward = _this select 2;


switch (_action) do{
	
	case "reward" :{
		
		_killerMoney = player getVariable "choco";
                _bounty = player getVariable "bounty";
                if(_bounty ==0) then{_bounty =1;};
                if(_bounty >=10) then{_bounty =10;};
		_newMoney = (_reward * _bounty)+ _killerMoney;
                _missionreward= _reward * _bounty;
		player setVariable ["choco", _newMoney, true];
                titleText [format["\n+%1$ * Your chocos for Mission %2", _missionreward,_victim], "PLAIN DOWN", 0];
            
	};
};