// THANKS to KiloSwiss  scripty by KiloSwiss
private["_action","_victim","_reward","_punishment","_killerMoney","_newMoney"];
_action = _this select 0;
_reward = _this select 2;
switch (_action) do{
		case "reward" :{
		_y= player getvariable["highscore",[0,0,0,0,0,0,0,0]];_y set [3,(_y select 3)+1];
player setvariable["highscore",_y,false];
		_killerMoney = count playableunits * 1000;
                []call countingbounty;  []call countingbounty;
_xr= (player getvariable["cmoney",0]);
player setVariable ["cmoney", _killerMoney + _xr, true];
titleText [format["\n +%1$for Mission", _killermoney], "PLAIN DOWN", 0]};};