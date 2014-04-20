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
_currObject setVariable ["wallet",0, true];
_currObject setVariable ["basecore",1, true];
titleText [format["\n+ BaseCore2 Activated"], "PLAIN DOWN", 0];
_pos = getPos _currObject;
 marker = createMarker ["1",_pos];
 marker setMarkerType "mil_objective";
marker setMarkerColor "ColorRed"; 
while {alive player && alive _currObject} do { 
    if (player distance _currObject < 60 and player getvariable"basecore"== 1)
        then {
            _money = 10 + (player getVariable"bounty");
                player setVariable["choco",(player getVariable"choco") + _money,true];
 
                _currObject setVariable["wallet",(_currObject getVariable"wallet") + _money2,true];
                _pos = getPos _currObject;
                _test = _currObject getVariable"wallet";
                marker setMarkerText format ["%1 BC %2 $)", name player,_test];
               marker setMarkerPos _pos;
               
                  marker set [count marker,[name player,_pos,_markerName]];
                  publicVariable "marker";
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
                                            _currObject setvariable["basecore",0,true];}
                    };
            };
            };
            sleep 1;  
           
           
            };
                                            player setvariable["basecore",0,true];
                                            _currObject setvariable["basecore",0,true];
                                            deletemarker marker; 
                                            _currObject allowDamage true;
};