
// THANKS to KiloSwiss  scripty by KiloSwiss
private["_action","_victim","_reward","_punishment","_killerMoney","_newMoney"];

_action = _this select 0;
_reward = _this select 2;


switch (_action) do{
	
	case "reward" :{
		_y= player getvariable"highscore"; player setvariable["highscore",[_y select 0,_y select 1,_y select 2,(_y select 3)+1,_y select 4,_y select 5,_y select 6, _y select 7],true];
         
		_killerMoney = player getVariable "choco";
                _bounty = player getVariable "bounty";
                if(_bounty ==0) then{_bounty =1;};
                if(_bounty >=5) then{_bounty =5;};
		_newMoney = (_reward * _bounty)+ _killerMoney;
                _missionreward= _reward * _bounty;
                if(servertime > 600)then{
		player setVariable ["choco", _newMoney, true];
                titleText [format["\n +%1$ for Mission", _missionreward], "PLAIN DOWN", 0]}else{
                player setVariable ["choco", _newMoney*2, true];
                titleText [format["\n +%1$Bonus for Mission", _missionreward*2], "PLAIN DOWN", 0];};
                  _y= player getvariable"highscore"; player setvariable["highscore",[_y select 0,_y select 1,_y select 2,_y select 3,_y select 4,(_y select 5)+_missionreward,_y select 6, _y select 7],true];
         
            
	};
};