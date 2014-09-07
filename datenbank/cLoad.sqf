sleep 1;
PDB_isDead = false;
PersistentDBLCStuff = {
	_playerUID = getPlayerUID player;
	_var = _this;
	call compile format["
waitUntil {!isNil ""PersistentDBLoad%1%2""};
if(typeName PersistentDBLoad%1%2 == ""STRING"") then {
PersistentDBLoad%2 = ""PersistentDBLoad%1%2"";
}
else
{
PersistentDBLoad%2 = PersistentDBLoad%1%2;
};
", _playerUID, _var];
};

PersistentDBLCConvert = 
{
	_var = _this;
	call compile format["
if(!isNil ""PersistentDBLoad%1"") then {
if(typeName PersistentDBLoad%1 == ""STRING"") then {
""PersistentDBLoad%1 select1"";
}
else
{
PersistentDBLoad%1 select 1;
};
}
else
{
nil;
};
", _var]
};
//Backup measure if OnPlayerConnected did not respond.
_profileFound = call compile format["
while {isNil ""ProfileFound%1""} do {
PDB_LR = ""%1"";
publicVariableServer ""PDB_LR"";
sleep 0.1;
};
ProfileFound%1;
",getPlayerUID player];

"weapons" call PersistentDBLCStuff;		
"magazines" call PersistentDBLCStuff;		
"pos" call PersistentDBLCStuff;		
"dammage" call PersistentDBLCStuff;		
"cmoney" call PersistentDBLCStuff;
"bounty" call PersistentDBLCStuff;	
"donator" call PersistentDBLCStuff;
"mothership" call PersistentDBLCStuff;
"decoder" call PersistentDBLCStuff;
"highscore" call PersistentDBLCStuff;
"chocoload" call PersistentDBLCStuff;
"basebuilder" call PersistentDBLCStuff;
"attach" call PersistentDBLCStuff;
"chocopack"call PersistentDBLCStuff;
"saveVehicle"call PersistentDBLCStuff;
waitUntil{!isNil "respawnDialogActive"};

waitUntil{respawnDialogActive};

waitUntil{!respawnDialogActive};

PDB_saveLoop = {
	while {true} do
	{
		//player setVariable["hungerLevel", hungerLevel, true];
		//player setVariable["thirstLevel", thirstLevel, true];
		{
			player setVariable[_x, (player getVariable _x), true];
		}foreach _varArr;
		sleep 180;
		waitUntil{!respawnDialogActive && (alive player) && !PDB_isDead};
		PDB_saveReq = getPlayerUID player;
		publicVariableServer "PDB_saveReq";
	};
};

[] spawn PDB_saveLoop;

_PDB_checkDeadLoop = {
	while {true} do
	{
		call compile format["
		waitUntil {(!alive player)};
		PDB_saveReqDead = [""%1"",""%2""];
		publicVariableServer ""PDB_saveReqDead"";
		", getPlayerUID player, side player];
		PDB_isDead = true;
		waitUntil{respawnDialogActive};
		waitUntil{!respawnDialogActive && (alive player)};
		PDB_isDead = false;
	};
};

[] spawn _PDB_checkDeadLoop;

if (!_profileFound) exitWith{hint "Persistent DB: No profile found";call infointro;};
_curVal = "weapons" call persistentDBLCConvert;//Test if got values
if(isnil "_curVal") exitWith {hint "PersistentDB: No profile on this team.";};
hint "Persistent DB: Profile found";
_curVal = ("dammage" call PersistentDBLCConvert);
if(!isNil "_curVal") then
{
	if(_curVal == 1) exitWith {hint "PersistentDB: You were dead when you quit.";};
};

_curVal = ("weapons" call persistentDBLCConvert);
if (!isNil "_curVal") then 
{
	removeAllWeapons player;
	{
		player addWeapon _x;
                 player selectWeapon _x;
	}foreach _curVal;
};
_curVal = ("magazines" call PersistentDBLCConvert);
if (!isNil "_curVal") then 
{
	{
		player addMagazine _x;
	}foreach _curVal;
};
	player setDir 1;
_curVal = ("pos" call PersistentDBLCConvert);
if (!isNil "_curVal") then 
{
	player setPosASL _curVal;
};
_curVal = ("dammage" call PersistentDBLCConvert);
if(!isNil "_curVal") then
{
	player setDammage _curVal;
};
player setVariable ["choco",nil,true];
player setVariable["chocopack",nil,true];
_varArr = [
"cmoney",
"bounty",
"donator",
"saveVehicle",
"chocopack",
"basebuilder",
"decoder",
"attach",
"mothership",
"highscore",
"chocoload"
];
{
	_curVal = (_x call PersistentDBLCConvert);
	if(!isNil "_curVal") then
	{
		player setVariable [_x,_curVal,true];
                if(_x == "cmoney") then
	{
            player setVariable ["choco",0,true];
            player setVariable ["choco",_curVal,true];
		player setVariable [_x,nil,true];
	};
	};
}foreach _varArr;
//thirstLevel = 100;
//hungerLevel = 100;
spawnHalo = true;