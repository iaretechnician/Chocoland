//the OMG CLAN - creedcoder thanks for your help
PDB_ServerID = ""; 

PDB_databaseNameCompiler = {
_return = "";
_name = _this;
_prefix = PDB_ServerID;
_return = format["%1%2", _prefix, _name];
_return;
};

objectsLoaded = false;
execVM "itemSave\oLoad.sqf";
execVM "itemSave\oSave.sqf";
