// THANKS to KiloSwiss  scripty by KiloSwiss
private["_action","_victim","_reward","_punishment","_killerMoney","_newMoney"];

_action = _this select 0;
_victim = _this select 1;
_reward = _this select 2;
_currencyLimit = 1000 * 1000;

switch (_action) do{
	case "punish" :{
		if(alive player)then{
			_punishment = floor((player getVariable "cmoney") / 10);	//Calculate how much money will be left over after punishment
			titleText [format["PUNISHMENT: -%1$ for TEAMKILLING your teammate %2 and 1 minute no Weapon",_punishment, str name _victim], "PLAIN", 0];
			player setVariable["cmoney",_punishment,false];
                        _time =0;
                        while{(_time == 60)} do 
                            {
                            removeAllWeapons player;sleep 1; _time = _time +1;
                            };
                        
		};
	};
	case "reward" :{
		titleText [format["\n+%1$ for killing %2", _reward, str name _victim], "PLAIN DOWN", 0];
		_killerMoney = player getVariable "cmoney";
		_newMoney = _currencyLimit min (_killerMoney + _reward);
		player setVariable ["cmoney", _newMoney, false];
	};
};