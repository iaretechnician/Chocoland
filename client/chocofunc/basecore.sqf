
_count = 0;
_money = 0;
_money2 =0;
_range=0;
_object =0;
_private =[_switch,_money2,_range,_object];
_switch = _this select 3 select 0;

switch (_switch) do
{ 
 case 1:{_money2 = 2;_range=35; _object ="Misc_cargo_cont_tiny"};
 case 2:{_money2 = 10;_range=60; _object ="TK_GUE_WarfareBUAVterminal_EP1"};
 case 3:{_money2 = 20;_range=100; _object ="USMC_WarfareBAircraftFactory"};
};

_currObject = getPos player nearestObject _object; 
if((_currObject getVariable"basecore") == 0 and (player getVariable"basecore") == 0)then
{
player setVariable ["basecore",1, true];
_int =_currObject getvariable["wallet",0];
if (isNil "_int") then {_currObject setVariable ["wallet",0, true];};
//_currObject setVariable ["wallet",0, true];
_currObject setVariable ["basecore",1, true];

    _group = createGroup civilian;
     _dummyUnit = (_group) createUnit ["RU_Pilot", [0,0,0], [], 0, "NONE"]; 
     [_dummyUnit] join _group;
     _nic = [nil, _dummyUnit, "per", rHideobject, true] call RE; 
    _dummyUnit attachTo [_currObject, [0,0,0]];
    _dummyUnit setVariable ["name",name player, true];
hint format["%1 `BaseCore is Online and Marked on the Map", name player];
titleText [format["\n BaseCore Activated"], "PLAIN DOWN", 0];
_pos = getPos _currObject;
if(_money2 < 0)exitwith{chocoland globalChat"basecore error,pls report to our website"};
while {alive _currObject and (_currObject getvariable"basecore" == 1) and (player getVariable"basecore") == 1} do {    
 if (player distance _currObject < _range and player getvariable"basecore"== 1)
        then {
                player setVariable["cmoney",(player getvariable["cmoney",0]) + _money2,true];
                  
   _currObject setVariable["wallet",(_currObject getvariable["wallet",0]) + _money2,true];
   _dummyUnit setvariable["wallet",(_currobject getvariable["wallet",0]),true];
    _pos = getPos _currObject;
  }else{
      titleText [format["\n your BaseCore is too far away"], "PLAIN DOWN", 0];
      _currObject setdamage 0;
       player setvariable["basecore",0,true];
      _currObject setvariable["basecore",0,true];
                    titleText [format["\n BaseCore Deactivated"], "PLAIN DOWN", 0];
 };
 sleep 3;  
 };
player setvariable["basecore",0,true];
_currObject setvariable["basecore",0,true];
deletevehicle _dummyUnit;
}else{
    if((_currObject getVariable"basecore") == 1)then {hint "this Core is allready Activated"};
    
    if((player getVariable"basecore") == 1) then {chocoland globalChat "you have allready activated core"};
    };
