
//Author: Art Vandelay
//Help from: Tankbuster, F2k Sel, Iceman77 (BI editing and scripting forum)
//Created on: 11/02/2013
//Description: If a unit decides to abandon ship it gets teleported back on deck

private ["_group","_unitsAlive","_unit","_units","_unitHeight","_pos","_preferredHeight"];

_group = _this select 0;
_pos = _this select 1;

_unitsAlive = ({alive _x} count units _group);
_preferredHeight = 15.5; //Height of the LHD deck for units

private ["_group","_unitsAlive","_unit","_units","_unitHeight","_pos","_preferredHeight"]; 

_group = _this select 0; 
_pos = _this select 1; 

_unitsAlive = ({alive _x} count units _group); 
_preferredHeight = 15.5; //Height of the LHD deck for units 


while {_unitsAlive > 0} do 
{ 
    sleep 1; 
    _unitsAlive = ({alive _x} count units _group); 
   { 
     if (!alive _x) then {[_x] joinsilent grpnull}; 
 _unitHeight = getposasl _x select 2; 
   if (_unitHeight < _preferredHeight) then {_x setPosASL [(_pos select 0) - 5, ( _pos select 1), 16.2];}  } foreach units _group; 

};  

