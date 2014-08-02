
//_currObject = nearestObject [player, "Misc_cargo_cont_tiny"];
_count = 0;
_money = 0;
_money2 = 2;
_currObject = getPos player nearestObject "Misc_cargo_cont_tiny"; 
if((_currObject getVariable"basecore") == 0 and (player getVariable"basecore") == 0)then
{
player setVariable ["basecore",1, true];
_currObject setVariable ["wallet",0, true];
_currObject setVariable ["basecore",1, true];
hint format["%1 `BaseCore is Online and Marked on the Map", name player];
titleText [format["\n BaseCore Activated"], "PLAIN DOWN", 0];
_pos = getPos _currObject;
while {alive _currObject and (_currObject getvariable"basecore" == 1) and (player getVariable"basecore") == 1} do {    

    _currObject setdamage 0;
                
        if (player distance _currObject < 60 and player getvariable"basecore"== 1)
        then {
            
                _money = _money2 + (player getVariable"bounty");
                player setVariable["choco",(player getVariable"choco") + _money,true];
 
                _currObject setVariable["wallet",(_currObject getVariable"wallet") + _money2,true];
                _pos = getPos _currObject;
               
            
        
 }else{
      titleText [format["\n your BaseCore is too far away"], "PLAIN DOWN", 0];
      _currObject setdamage 0;
       player setvariable["basecore",0,true];
      _currObject setvariable["basecore",0,true];
                    titleText [format["\n BaseCore Deactivated"], "PLAIN DOWN", 0];
                  
            };
           
            nul = [_currObject,name player,_currObject getVariable"wallet"] execVM "client\functions\createMarkers.sqf";
            sleep 1;  
           
           
            };
            
                                            player setvariable["basecore",0,true];
                                            _currObject setvariable["basecore",0,true];
                                       
}
else{
    if((_currObject getVariable"basecore") == 1)then {hint "this Core is allready Activated"};
    
    if((player getVariable"basecore") == 1) then {player globalchat "you have allready activated core"};
    };
