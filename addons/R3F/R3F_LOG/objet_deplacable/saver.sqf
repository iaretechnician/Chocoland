_target = _this select 0;
//hint format ["%1",_target];
_target setVariable ["playerGUID", [puid,name player,(player getvariable"cmoney")], true];
_target setVariable [puid, 1, true];
player setvariable["cmoney",0,true];
chocoland globalChat" transfering money to this object";
sleep 1;
chocoland globalChat "success" ;
[]call savePlayer;