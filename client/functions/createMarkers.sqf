 setGroupIconsVisible [true,false];
_color_green = [0,1,0,1];
_color_blue = [0,0,1,1];
_color_white = [1, 1, 1, 1];
_color_orange = [1,0.3,0,1];
_color_red = [1,0,0,1];
markers = nearestObjects [player, ["76n6ClamShell", "Misc_cargo_cont_tiny"], 30000];
//You can't check for a group on stuff this returns
//This should work
//markers = playableUnits;
if (isnil "basecoreState") then {basecoreState = 0;}; if (basecoreState == 0) then {basecoreState = 1; hint "BaseCore Markers ON ";} else {basecoreState = 0; hint "BaseCore Markers OFF";};

while {basecoreState == 1} do
{
    
    {
       _active= _x getVariable"basecore";
        if (_active == 1) then 
        {
            clearGroupIcons group _x;
            group _x addGroupIcon ["x_art"];
         _name= _x getVariable"name";
         _wallet= _x getvariable"wallet";
    
         group _x setGroupIconParams [_color_blue, format ["%1 BC %2 $)", _name,_wallet], 0.5, true];
      };
    } forEach markers;
sleep 0.5;
///AUS
};
{clearGroupIcons group _x;} forEach markers;

 markers = nearestObjects [player, ["76n6ClamShell", "Misc_cargo_cont_tiny"], 20000];
			
                            _active= _x getVariable"basecore";
				if(_active == 1)then{
                                    _uid= _x getvariable"uid";
					_name= _x getVariable"name";
                                        _wallet= _x getvariable"wallet";
                                        _side= _x getvariable"side";
                                        _pos= getpos _x;
			_pMarker setMarkerTextlocal format ["%1 BC %2 $)", _name,_wallet];};
