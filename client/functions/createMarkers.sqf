_unit = _this select 0;
_marker = _this select 1;
_test = _this select 2;


_hm = createMarker ["_marker", position _unit];
"_marker" setmarkershape "ICON";
"_marker" setMarkerType "mil_dot";
"_marker" setmarkercolor "ColorRed";
"_marker" setmarkerText format ["%1 BC %2 $)",_marker,_test];


sleep 1;
deleteMarker "_marker";
