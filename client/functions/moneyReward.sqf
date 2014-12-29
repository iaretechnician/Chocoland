// THANKS to KiloSwiss  scripty by KiloSwiss
private["_action","_victim","_reward","_punishment","_killerMoney","_newMoney","_killerb"];
_multikill = player getvariable["multikill",0];

_action = _this select 0;
_victim = _this select 1;
//_reward = _this select 2;
  _killerb = player getvariable["bounty",1];
switch (_action) do{
	case "punish" :{
            _i = 0; waitUntil { _i = _i + 1; punishplayer == 1 ||_i >= 10 };
		if(alive player and punishplayer == 1)then{
			
			titleText [format["PUNISHMENT: TEAMKILLING your teammate %1 and 1 minute no Weapon",str _victim], "PLAIN", 0];
			 player setVariable["bounty",1,true];
                         }; _time =0;while{_time <= 60} do  { removeAllWeapons player; sleep 1; _time = _time +1; };
                         punishplayer =0;publicvariable"punishplayer";};
                         
                         
	case "reward" :{
_y= player getvariable["highscore",[0,0,0,0,0,0,0,0]];_y set [0,(_y select 0)+1]; player setvariable["highscore",_y,false];
player setvariable["multikill",_multikill+1,true];
[]Spawn {sleep 5;player setVariable ["multikill",0]};
_killermoney = player getvariable["cmoney",500];
if(_multikill >= 2)then {[]spawn{_victim = _victim * _multikill;
{if(alive _x) then{[nil, _x, "loc", rEXECVM, "client\chocofunc\multikill.sqf",_multikill,name player] call RE;};}forEach playableUnits;};};
[]call countingbounty;
_victim = round (_victim *  _killerb);
  	player setVariable["cmoney", _killermoney + _victim, true];
      _y= player getvariable"highscore";_y set [5,(_y select 5)+_victim]; player setvariable["highscore",_y,false];
     _y= player getvariable"highscore";if(_killerb > (_y select 1))then{_y set [1, _killerb]; player setvariable["highscore",_y,false];};
   };
};