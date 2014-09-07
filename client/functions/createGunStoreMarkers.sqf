player setVariable["lastPos",[],true];
sleep 60;
_y= player getvariable"highscore";
if((_y select 7)>=999999)then {player setvariable["highscore",[_y select 0,_y select 1,_y select 2,_y select 3,_y select 4,_y select 5,_y select 6, 0],true];};

while {walked}do {
    waituntil {vehicle player == player};
_charPos = getPos player;
private["_debug","_distance"];

_distance = [0,0,0] distance _charPos;

if (_distance > 10000) exitWith { };
_lastPos =player getVariable"lastPos";
_distanceFoot = round(_charPos distance _lastPos);
if (_distanceFoot > 1000) exitWith {};
_y= player getvariable"highscore"; player setvariable["highscore",[_y select 0,_y select 1,_y select 2,_y select 3,_y select 4,_y select 5,_y select 6, (_y select 7)+_distanceFoot],true];
player setVariable["lastPos",_charPos,true];
sleep 10;}; 
