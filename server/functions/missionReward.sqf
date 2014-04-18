// THANKS to KiloSwiss  scripty by KiloSwiss
private["_action","_victim","_reward","_punishment","_killerMoney","_newMoney"];

_action = _this select 0;
_victim = _this select 1;
_reward = _this select 2;


switch (_action) do{
	
	case "reward" :{
		  titleText [format["\n+%1$ for  Mission %2", _reward, _victim], "PLAIN DOWN", 0];
                player setVariable["choco", (player getVariable "choco")+ _reward, true];
	};
};
 
 
