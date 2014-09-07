_uid = _this select 0;
PersistentDBLoadStuff = {
	private ["_playerUID", "_playerSide", "_var", "_val"];
	_playerUID = _this select 0;
	_playerSide = 1;
	_var = _this select 2;
	_id = _this select 3;
	_type = _this select 4;
	_val = [_playerUID call PDB_databaseNameCompiler, _playerSide, _var, _type] call iniDB_read;
	if(typeName _val == "STRING") then
	{
		call compile format["
			PersistentDBLoad%1%2 = [true,""%3""];
			%4 publicVariableClient ""PersistentDBLoad%1%2"";
			sleep 1;
			PersistentDBLoad%1%2 = nil;
		",_playerUID, _var, _val, _id];
		exit;
	}
	else
	{
		call compile format["
			PersistentDBLoad%1%2 = [true,%3];
			%4 publicVariableClient ""PersistentDBLoad%1%2"";
			sleep 1;
			PersistentDBLoad%1%2 = nil;
		",_playerUID, _var, _val, _id];
		exit;
	};
	call compile format["
			PersistentDBLoad%1%2 = [true,nil];
			%4 publicVariableClient ""PersistentDBLoad%1%2"";
			sleep 1;
			PersistentDBLoad%1%2 = nil;
		",_playerUID, _var, _val, _id];
};

PersistentDBProfileFound = {
if(_this select 0) then 
{
call compile format["
ProfileFound%1 = true;
%2 publicVariableClient ""ProfileFound%1"";
sleep 1;
ProfileFound%1 = nil;
", _this select 2, _this select 1];
}
else
{
call compile format["
ProfileFound%1 = false;
%2 publicVariableClient ""ProfileFound%1"";
sleep 1;
ProfileFound%1 = nil;
", _this select 2, _this select 1];
}
};

{
	if(isPlayer (_x) && getPlayerUID _x == _uid) then 
	{
		_playerSide = 1;
		
		_id = owner _x;
		_check = ("highscore" call PDB_databaseNameCompiler) call iniDB_exists;
		if (!_check) then {
		[false, _id, _uid] call PersistentDBProfileFound;	
		}
		else 
		{
		[true, _id, _uid] call PersistentDBProfileFound;	
		};		
		
		["highscore", name player, "highscore", _id, "ARRAY"] spawn PersistentDBLoadStuff;

	
		exit;
	};
}foreach playableUnits;