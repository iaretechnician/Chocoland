_currObject = nearestObject [player, "Misc_cargo_cont_tiny"];
while {alive player && alive _currObject} do {
    _currObject setVariable ["basecore",1, true];
                _currObject setDamage 1;
        if (player distance (nearestobjects [player, ["Misc_cargo_cont_tiny"],  20] select 0) < 30)
        then {
            if(_currObject getVariable "basecore" == 1) then{
                _money = 2 * (player getVariable"bounty");
                player setVariable["cmoney",(player getVariable"cmoney") + _money,false];
                _pos = getPos _currObject;
              _marker = createMarker["", position _currObject];
                   _marker setMarkerText format ["%1`BaseCore", name player];
                sleep 1;
              deletemarker _marker;
        };
        
            };
};