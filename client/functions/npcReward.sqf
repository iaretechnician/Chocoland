// THANKS to KiloSwiss  scripty by KiloSwiss
private["_action","_victim","_reward","_punishment","_killerMoney","_newMoney"];

_action = _this select 0;
_victim = _this select 1;
_reward = _this select 2;


switch (_action) do{
		
	case "reward" :{
		player setVariable["bounty", (player getVariable "bounty")+ 1, false];
                titleText [format["\n+1 ChocoKill for killing %2", _reward, name _victim], "PLAIN DOWN", 0];
	};
};