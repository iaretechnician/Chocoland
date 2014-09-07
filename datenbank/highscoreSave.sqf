
while {true} do {
	PersistentDB_ObjCount = 0;
	{
		
		if(isplayer _x) then {
		//highscore  [kills,streak,deaths,moneypayed,money,time,moved]
//_y= player getvariable"highscore"; setvariable["highscore",[_y select 0,_y select 1,_y select 2,_y select 3,_y select 4],true];
                        _highscore = _x getvariable"highscore";
   
			//_objSaveName = format["obj%1", PersistentDB_ObjCount];
_objSaveName =  name player;
			["highscore" call PDB_databaseNameCompiler, _objSaveName, "highscore", _highscore] call iniDB_write;
			
			PersistentDB_ObjCount = PersistentDB_ObjCount + 1;
		};
	} forEach playableunits;
	["highscore" call PDB_databaseNameCompiler, "Count", "Count", PersistentDB_ObjCount] call iniDB_write;
	sleep 600;
};