_npc = _this select 0;
if(isnil "_npc")exitwith{};
_rweapon = randomweaponarray call BIS_fnc_selectRandom; 
_npc addweapon _rweapon;
_magazines = getArray(configFile >> "cfgWeapons" >> _rweapon>> "magazines");
_magazines = _magazines select 0; 
_npc addmagazine _magazines;
_npc setskill ["aimingAccuracy",0.7];
