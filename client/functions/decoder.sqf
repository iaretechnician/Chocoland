
 if((damage cursortarget) > 0.95)exitwith{  Dcooldown = false;deletevehicle cursortarget;   player setvariable["cmoney",(player getvariable["cmoney",0]) + 1000,true];     _random = floor (random 100);   chocoland globalChat "Object decoded.";      if (_random > 90)then {player setvariable["bounty",(player getvariable["bounty",1])+1,true];chocoland globalChat"hey you found 1 chocos";};};
if(isnil {cursortarget getvariable["playerGUID",""]})exitwith{Dcooldown = false; hint "you cannot decode this object";};

_i =(cursortarget getvariable["playerGUID",""]);
if((_i select 0) == puid)then {
//AN
Dcooldown = true;
_currObject = cursortarget;
_price = 1000;
_random=0;
{
if(_x select 2 == typeof _currObject)then {_price =_x select 1;};   
} foreach BuildStoreArray; 
_costs=(round (_price));
_choco= player getvariable["cmoney",0];
     
if(_costs > _choco)exitWith {// If the player have not enough money 
     titleText [format["\n Object decode failed, you have not enough money (%1 $)",_costs], "PLAIN DOWN", 0];
     Dcooldown = false; };
player setvariable["cmoney",_choco -_costs,true];              
titleText [format["\n you payed %1 $",_costs], "PLAIN DOWN", 0];
_dist=Round (player distance cursortarget);
hint format  ["your object is %1 meters away",_dist];
_dist = round (_dist /2);
if (_dist < 1)then {_dist=1;};
_totalDuration = _dist;
_unlockDuration = _totalDuration;
_iteration = 0;
_stringEscapePercent = "%";
player switchMove "AinvPknlMstpSlayWrflDnon_medic";
for "_iteration" from 1 to _unlockDuration do {
//SCHLEIFE
    if (!(alive player)) exitWith {// If the player dies, revert state.
    2 cutText ["Object decode failed, you are dead...", "PLAIN DOWN", 1];
    Dcooldown = false; };
                               
    if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { 
    player switchMove "AinvPknlMstpSlayWrflDnon_medic";
    };
_unlockDuration = _unlockDuration - 1;
_iterationPercentage = floor (_iteration / _totalDuration * 100);
2 cutText [format["decode object %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
sleep 0.9;
    if (_iteration >= _totalDuration) exitWith {
    Dcooldown = false; 
    sleep 0.5;
    deletevehicle _currObject;
   
    player setvariable["cmoney",_choco + _costs,true]; 
    _y= player getvariable["highscore",[0,0,0,0,0,0,0,0]];_y set [5,(_y select 5)+_costs]; player setvariable["highscore",_y,false];
    titleText[format["\n you get %1 $",_costs], "PLAIN DOWN", 0];
    
    _random = floor (random 100);
    if (_random > 90)then {[]call countingbounty;chocoland globalChat"hey you found 0.1 Choco";};
         
         
};
};
player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";      
}else {
   
        Dcooldown = false; hint "you cannot decode this object";};
