// THANKS to KiloSwiss  scripty by KiloSwiss
private["_action","_victim","_reward","_punishment","_killerMoney","_newMoney"];

_action = _this select 0;
_victim = _this select 1;
_reward = _this select 2;


switch (_action) do{
	
	case "reward" :{
		titleText [format["\n+%1$ * Your ChocoKills for Mission %2", _reward,_victim], "PLAIN DOWN", 0];
		_killerMoney = player getVariable "cmoney";
                _bounty = player getVariable "bounty";
		_newMoney = (_reward * _bounty)+ _killerMoney;
		player setVariable ["cmoney", _newMoney, false];
            
	};
};