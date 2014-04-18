//_currObject = nearestObject [player, "Misc_cargo_cont_tiny"];
_count = 0;
_money = 0;
_money2 = 10;
_currObject = getPos player nearestObject "76n6ClamShell"; 
hint format["%1 `BaseCore2 is Online and Marked on the Map", name player];

if((player getVariable"basecore") == 0)then
{
   _currObject allowDamage false;
player setVariable ["basecore",1, true];
titleText [format["\n+ BaseCore2 Activated"], "PLAIN DOWN", 0];
_pos = getPos _currObject;
//////EINHEIT
_grp = creategroup civilian;
core = _grp createunit ["Pilot_EP1",_pos,[],0,"FORM"];
group _core Move _pos;
core attachTo [_currObject, [0,0,1]];
core setVariable ["wallet",0, true];
core setVariable ["basecore",1, true];
core setVariable ["name",name player, true];
_nic = [nil, core, "per", rHideobject, true] call RE;
//sichtbar// _nic = [nil, _core, "per", rHideobject, false] call RE; 
//// ENDE

while {alive _currObject and alive _core} do { 
    if (player distance _currObject < 60 and player getvariable"basecore"== 1)
        then {
            _money = _money2 + (player getVariable"bounty");
                player setVariable["choco",(player getVariable"choco") + _money,false];
 
                core setVariable["wallet",(core getVariable"wallet") + _money2,true];
                _pos = getPos core;
              
             
 };
            if (player distance _currObject > 60 and player getvariable"basecore"== 1)
        then {
        _random = Round (random 5);
        if ( _random == 5)then 
            {
                titleText [format["\n your BaseCore is too far away"], "PLAIN DOWN", 0];
                _count = _count +1;
                if(_count == 10)then {
                    if(true)exitwith{player setvariable["basecore",0,true];
                                           };
                    };
            };
            };
            sleep 1;  
           
           
            };
                                            player setvariable["basecore",0,true];
                                            core setvariable["basecore",0,true];
                                            deletevehicle _currObject; 
                                               deletevehicle core; 
                                            
};