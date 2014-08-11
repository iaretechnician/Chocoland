

// THANKS to KiloSwiss  scripty by KiloSwiss
private["_action","_victim","_reward","_punishment","_killerMoney","_newMoney"];

_action = _this select 0;
_victim = _this select 1;
_reward = _this select 2;


switch (_action) do{
	
	case "reward" :{
		titleText [format["you get %1$", _reward], "PLAIN DOWN", 0];
		_killerMoney = player getVariable "choco";
		_newMoney = _killerMoney + _reward;
		player setVariable ["choco", _newMoney, true];
            
	};
};