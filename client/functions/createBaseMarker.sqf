//[]execVM"client\functions\createBaseMarker.sqf";
if(basecoreState)then {basecoreState = false;}else{basecoreState = true;};
private ["_marker","_markerText","_temp","_unit","_vehicle","_markerNumber","_show","_injured","_text","_num","_getNextMarker","_getMarkerColor","_showAllSides","_showPlayers","_showAIs","_l"];

_getNextMarker = {
	private ["_marker"]; 
	_markerNumber = _markerNumber + 1;
	_marker = format["um%1",_markerNumber];	
	if(getMarkerType _marker == "") then {
		createMarkerLocal [_marker, _this];
	} else {
		_marker setMarkerPosLocal _this;
	};
	_marker;
};

 if (!basecoreState)then {
    {deleteMarkerLocal _x;}foreach _marker};
while{alive player and basecoreState}do 
    {
        _markerNumber = 0; 
_pPos = getpos player;
_basecore = nearestObjects [_pPos, ["Misc_cargo_cont_tiny","GUE_WarfareBUAVterminal"], 30000]; 
{
    if(_x getvariable"basecore" == 1)then{
        
_pos= getpos _x;
//_marker = createMarker ["_marker", _pos];
_marker = _pos call _getNextMarker;						
_marker setMarkerColorLocal "ColorRed";	 						 				
_marker setMarkerTypeLocal "mil_dot";		  			   
_marker setMarkerSizeLocal [0.8,0];
_marker setMarkerTextLocal "";			
   if(_x getvariable"wallet" >= 10000) then {_marker setMarkerSizeLocal [2,1];};
_nameplayer = _x getvariable"name";
_money = _x getvariable"wallet";
_text = format["%1's %2$", _nameplayer, _money];	
_marker setMarkerTextLocal _text;
};
}foreach _basecore;

sleep 0.001;

_markerNumber = _markerNumber + 1;
	_marker = format["um%1",_markerNumber];	
	while {(getMarkerType _marker) != ""} do {
		deleteMarkerLocal _marker;
		_markerNumber = _markerNumber + 1;
		_marker = format["um%1",_markerNumber];
};
};