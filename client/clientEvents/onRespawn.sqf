

//	@file Version: 1.0
//	@file Name: onRespawn.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//	@file Args:

private["_player","_corpse","_town","_spawn","_temp"];
playerSetupComplete = false;

_player = (_this select 0) select 0;
_corpse = (_this select 0) select 1;
//_player setPos [2101.75,4314.7,0.00130653];
_corpse removeAction playerMenuId;
_corpse removeAction playerWeaponId;
_corpse removeAction saveVehId;
_corpse removeAction bombId;
_corpse removeAction playerflyId;
_corpse removeaction playerflyoff;
_corpse removeaction playersatId;

{
	_corpse removeAction _x;
} forEach aActionsIDs;
if(player getvariable"donator" == 1)then
{deletevehicle _corpse;};
if(player getvariable"decoder" == 1)then
{_corpse removeaction decoderId;};

player call playerSetup;
waitUntil {playerSetupComplete};

[] execVM "client\clientEvents\onMouseWheel.sqf";

true spawn playerSpawn;

[] spawn {
	waitUntil{respawnDialogActive};
	waitUntil{sleep 0.1; !respawnDialogActive};

	if(!isNull pvar_PlayerTeamKiller) then {
		pDialogTeamkiller = pvar_PlayerTeamKiller;
		pvar_PlayerTeamKiller = objNull;

		[] execVM "client\functions\createTeamKillDialog.sqf";
	};
};
