
#include "setup.sqf"
if(!X_Server) exitWith {};

"diag_log_server" addPublicVariableEventHandler {diag_log (_this select 1)};
[] execVM "server\admins.sqf";
[] execVM "server\functions\serverVars.sqf";
_serverCompiledScripts = [] execVM "server\functions\serverCompile.sqf";
[] execVM "server\functions\broadcaster.sqf";
[] execVM "server\functions\relations.sqf";

waitUntil{scriptDone _serverCompiledScripts};

diag_log format["WASTELAND SERVER - Server Complie Finished"];
diag_log format["WASTELAND SERVER - Initilizing Server Spawning"];
	_vehSpawn = [] ExecVM "server\functions\vehicleSpawning.sqf";
	waitUntil{sleep 0.1; scriptDone _vehSpawn};
    _objSpawn = [] ExecVM "server\functions\objectsSpawning.sqf";
	waitUntil{sleep 0.1; scriptDone _objSpawn};
    _gunSpawn = [] ExecVM "server\functions\staticGunSpawning.sqf";
	waitUntil{sleep 0.1; scriptDone _gunSpawn};
    _heliSpawn = [] ExecVM "server\functions\staticHeliSpawning.sqf";
    waitUntil{sleep 0.1; scriptDone _heliSpawn};
    _markerClean = [] ExecVM "server\functions\cleanMarkers.sqf";
    waitUntil{sleep 0.1; scriptDone _markerClean};
//Execute Server Missions. 
[] execVM "server\spawnController.sqf";
[] execVM "server\moneyzone.sqf";
//[] execVM "server\randomMission.sqf";
if (isDedicated) then {
	_id = [] execFSM "server\WastelandServClean.fsm";
};
while {true} do
{
   //waiting 
    _countppl= 120;
    {
	if (alive _x) then
		{
                _countppl= _countppl -4;	
		};
	} forEach playableUnits; 
       if(_countppl < 0)then {_countppl =0;}; 
      

	_missionRunning = [] execVM "server\randomMission.sqf";
    diag_log format["WASTELAND SERVER - Execute New Main Mission"];

waitUntil{sleep 1; scriptDone _missionRunning};
  sleep _countppl;
};