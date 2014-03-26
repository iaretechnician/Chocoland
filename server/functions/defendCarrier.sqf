/*
 =======================================================================================================================
Script: BIN_taskDefend.sqf v1.3a
Author(s): Binesi
Partly based on original code by BIS

Description:
Group will man all nearby static defenses and vehicle turrets and guard/patrol the position and surrounding area.

Parameter(s):
_this select 0: group (Group)
_this select 1: defense position (Array)
    
Returns:
Boolean - success flag

Example(s):
null = [group this,(getPos this)] execVM "BIN_taskDefend.sqf"

-----------------------------------------------------------------------------------------------------------------------
Notes:

To prevent this script from manning vehicle turrets find and replace "LandVehicle" with "StaticWeapon".

The "DISMISS" waypoint is nice but bugged in a few ways. The odd hacks in this code are used to force the desired behavior.
The ideal method would be to write a new FSM and I may attempt that in a future project if no one else does. 

=======================================================================================================================
*/

private ["_grp", "_pos"];
_grp = _this select 0;
_pos = _this select 1;

_grp setBehaviour "SAFE";

private ["_list", "_units","_staticWeapons"];
_list = _pos nearObjects ["StaticWeapon", 120];
_units = (units _grp); 
_staticWeapons = [];

// Find all nearby static defenses or vehicles without a gunner
{
    if ((_x emptyPositions "gunner") > 0) then 
    {
        _staticWeapons = _staticWeapons + [_x];    
    };
} forEach _list;

// Have the group man empty static defenses and vehicle turrets
{
    // Are there still units available?
    if ((count _units) > 0) then 
    {
        private ["_unit"];
        _unit = (_units select ((count _units) - 1));
    
        _unit assignAsGunner _x;
        [_unit] orderGetIn true;
        sleep 1; // Give gunner time to get in, otherwise force.
        _unit moveInGunner _x;
            
        _units resize ((count _units) - 1);
    };
} forEach _staticWeapons;
