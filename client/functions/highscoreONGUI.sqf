
private["_v", "_gend"];
_v = _this select 0;
_test = "Money";
_gender = _v select 2;
_gend= "";
_value=[_v select 0] call fnc_number;
if( _gender == 0) then {_gend = "Kills"};
if( _gender == 1) then {_gend = "Streak"};
if( _gender == 2) then {_gend = "Deaths"};
if( _gender == 3) then {_gend = "Payed Money"};
if( _gender == 4) then {_gend = "Earned Money"};
if( _gender == 5) then {_gend = "Cleared Missions"};
if( _gender == 6) then {_gend = "Time played"};
if( _gender == 7) then {_gend = "Total Walked"};
_hint = parseText format ["%1 has the most %2 with %3:%2, Reward: Choco x 4",_v select 1,_gend,_value,_test];
player setvariable ["ongui",_hint,true];
if(name player == (_v select 1)) then {player setvariable["choco", (player getvariable"bounty") * 4,true];};
sleep 5;
player setvariable ["ongui","",true];
