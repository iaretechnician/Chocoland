

// THANKS to KiloSwiss  scripty by KiloSwiss
private["_reward","_killerMoney","_newMoney"];

_reward = 100 max(count playableunits*33);

 _killerMoney = player getVariable "choco";
 if(servertime >600)then{
titleText [format["you get %1$", _reward], "PLAIN DOWN", 0];
_newMoney = _killerMoney + _reward;
player setVariable ["choco", _newMoney, true];}else{
   titleText [format["you get %1$ BONUS", _reward*2], "PLAIN DOWN", 0];
_newMoney = _killerMoney + (_reward*2);
		player setVariable ["choco", _newMoney, true];};
_y= player getvariable"highscore";
 player setvariable["highscore",[_y select 0,_y select 1,_y select 2,_y select 3,_y select 4,(_y select 5)+_reward,_y select 6, _y select 7],true];
         
         