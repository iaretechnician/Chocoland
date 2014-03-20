private ["_target","_attacker","_dmg","_totalDmg","_text"];

_target = _this select 0; //person who is hit
_attacker = _this select 3; //attacker
_dmg = _this select 2; //damage recieved
_totalDmg = _dmg; //Total dmg will be outputted at the end

if (isPlayer _target and isPlayer _attacker) then {
	if ((side _target) == (side _attacker) and str(side _attacker) != "GUER" and str(side _target) != "GUER") then {
		if (getPlayerUID _target != getPlayerUID _attacker) then {
			_totalDmg = 0;
			//_text = format ["Player: %1 is attacking team member: %2", name _attacker, name _target];
			_attacker setDamage ((getDammage _attacker)+0.05);
			[nil,nil,rHINT,_text] call RE;
		};
	} else {
		_totalDmg = _dmg;
	};
	
	if(str(side _target) == "GUER" and str(side _attacker) == "GUER") then {
		if((group _target) == (group _attacker)) then {
			if (getPlayerUID _target != getPlayerUID _attacker) then {
				_totalDmg = 0;
				//_text = format ["Player: %1 is attacking group member: %2", name _attacker, name _target];
				_attacker setDamage ((getDammage _attacker)+0.05);
				[nil,nil,rHINT,_text] call RE;
			};
		} else {
			_totalDmg = _dmg;
		};	
	};
};

_totalDmg