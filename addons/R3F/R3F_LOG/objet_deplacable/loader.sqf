_target = _this select 0;
//hint format ["%1",_target];
_money =(_target getvariable"playerGUID")select 2;
chocoland globalChat" transfering money to player";
chocoland globalChat "success" ;
player setvariable["cmoney",(player getvariable"cmoney")+_money,true];
_target setVariable ["playerGUID", [puid,name player], true];
_target setVariable [puid, nil, true];