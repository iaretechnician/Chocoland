
// THANKS to KiloSwiss  scripty by KiloSwiss
private["_action","_victim","_reward","_punishment","_killerMoney","_newMoney"];

_action = _this select 0;
_victim = _this select 1;
_reward = _this select 2;


switch (_action) do{
		
	case "reward" :{
            _random = Round(random 4)+1;
            if(_random == 4) then {
		player setVariable["bounty", (player getVariable "bounty")+ 1, true];
                titleText [format["\n+1 choco for killing %2", _reward, name _victim], "PLAIN DOWN", 0];}else 
                { titleText [format["\n you killed %2", _reward, name _victim], "PLAIN DOWN", 0];};
	};
};