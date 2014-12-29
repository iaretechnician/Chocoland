if (isServer) then {_id = PlayerCDeath spawn serverPlayerDied;};
_player = (_this select 0) select 0;
_killer = (_this select 0) select 1;
_distance = _player distance _killer;
//_playername = name _player;
//_killername = name _killer;
_kbounty= _killer getvariable ["bounty",1];
_pbounty= _player getvariable ["bounty",1];
if(gunner (vehicle _killer) == _killer)then{
_kbounty= (gunner (vehicle _killer)) getVariable ["bounty",1];};
_reward = 1000 max floor(_kbounty *_pbounty *1000);
if(_player getvariable["donator",0] == 1)then {Donatorweapon = weapons _player;};
PlayerCDeath = [_player];publicVariable "PlayerCDeath";
_y= _player getvariable"highscore";_y set [2,(_y select 2)+1]; _player setvariable["highscore",_y,false];
_player setVariable["basecore",0,false];
if (isPlayer _killer && _Player != _Killer) then {
_string =format["%1 killed %2 (+%3$,+%5 %4 meters)",name _killer,name _player,_reward,floor _distance]; 
_string =format["chocoland globalchat ""%1"";",_string];chocostring=_string;publicvariable"chocostring";call compile _string;
_sidePlayer = side (group _player);
_sideKiller = side (group _killer);
_killerUID = getPlayerUID _killer;
_groupMemberUIDs = [];
if(count units group player > 1) then {	{_groupMemberUIDs set [count _groupMemberUIDs, getPlayerUID _x];}forEach units player;};
if ((_sidePlayer == _sideKiller) && ((_sidePlayer in [west,east]) || (_killerUID in _groupMemberUIDs))) then {
[nil,_killer, "loc", rEXECVM, "client\functions\moneyReward.sqf", "punish", _player] call RE;
}else{
[nil,_killer, "loc", rEXECVM, "client\functions\moneyReward.sqf", "reward", _reward] call RE;};
        
};
if((_player != _killer) && (vehicle _player != vehicle _killer) && (playerSide == side _killer) && (str(playerSide) in ["WEST", "EAST"])) then {
	pvar_PlayerTeamKiller = objNull;
	if(_killer isKindOf "CAManBase") then {
		pvar_PlayerTeamKiller = _killer;
	} else {
		_veh = (_killer);
		_trts = configFile >> "CfgVehicles" >> typeof _veh >> "turrets";
		_paths = [[-1]];
		if (count _trts > 0) then {
			for "_i" from 0 to (count _trts - 1) do {
				_trt = _trts select _i;
				_trts2 = _trt >> "turrets";
				_paths = _paths + [[_i]];
				for "_j" from 0 to (count _trts2 - 1) do {
					_trt2 = _trts2 select _j;
					_paths = _paths + [[_i, _j]];
				};
			};
		};
		_ignore = ["SmokeLauncher", "FlareLauncher", "CMFlareLauncher", "CarHorn", "BikeHorn", "TruckHorn", "TruckHorn2", "SportCarHorn", "MiniCarHorn", "Laserdesignator_mounted"];
		_suspects = [];
		{
			_weps = (_veh weaponsTurret _x) - _ignore;
			if(count _weps > 0) then {
				_unt = objNull;
				if(_x select 0 == -1) then {_unt = driver _veh;}
				else {_unt = _veh turretUnit _x;};
				if(!isNull _unt) then {
					_suspects = _suspects + [_unt];
				};
			};
		} forEach _paths;

		if(count _suspects == 1) then {
			pvar_PlayerTeamKiller = _suspects select 0;
		};
	};
};

if(!isNull(pvar_PlayerTeamKiller)) then {
	publicVar_teamkillMessage = pvar_PlayerTeamKiller;
	publicVariable "publicVar_teamkillMessage";
};

private["_a","_b","_c","_d","_e","_f","_m","_player","_killer", "_to_delete"];

_to_delete = [];
_to_delete_quick = [];


if((_player getVariable "medkits") > 0) then {
	for "_a" from 1 to (_player getVariable "medkits") do {	
		_m = "CZ_VestPouch_EP1" createVehicle (position _player);
		_to_delete = _to_delete + [_m];
	};
};

if((_player getVariable "repairkits") > 0) then {
	for "_b" from 1 to (_player getVariable "repairkits") do {	
		_m = "Suitcase" createVehicle (position _player);
		_to_delete = _to_delete + [_m];
	};
};

true spawn {
	waitUntil {playerRespawnTime < 2};
	titleRsc["introImage", "PLAIN",8];
};