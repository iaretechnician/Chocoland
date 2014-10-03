//private [_npc,_rweapon,_magazines];

_npc = _this select 0;
//_randomIndex = (random (count _MMarray - 1));
_rweapon = weaponsArray call BIS_fnc_selectRandom; 
_rweapon = _rweapon select 2;
_npc addweapon _rweapon;
_magazines = getArray(configFile >> "cfgWeapons" >> _rweapon>> "magazines");
_magazines = _magazines call BIS_fnc_selectRandom; 
_npc addmagazine _magazines;
_npc addmagazine _magazines;
_npc addmagazine _magazines;
_npc setskill ["aimingAccuracy",random 1];
_npc addEventHandler ["Killed", {[_this] call createLootMoney;}];
