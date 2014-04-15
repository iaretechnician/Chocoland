if(player != leader group player) exitWith {msgbot globalChat format["you are not the leader and can't invite people"];};

#define groupManagementDialog 55510
#define groupManagementPlayerList 55511

disableSerialization;

private["_dialog","_playerListBox","_target","_index","_playerData","_check"];

_dialog = findDisplay groupManagementDialog;
_playerListBox = _dialog displayCtrl groupManagementPlayerList;

_index = lbCurSel _playerListBox;
_playerData = _playerListBox lbData _index;
_check = 0;

//Check selected data is valid   			
{if (str(_x) == _playerData) then {_target = _x;_check = 1;};}forEach playableUnits;

diag_log "Invite to group: Before the checks";

//Checks
if(_check == 0) exitWith{msgbot globalChat "Server: You must select someone to invite first";};
if(_target == player) exitWith {msgbot globalChat "Server: You can't invite yourself";};
if((count units group _target) > 1) exitWith {msgbot globalChat "Server: This player is already in a group"};

diag_log "Invite to group: After the checks";

_command = [1, getPlayerUID player, _target, name player];
[_target, _command] call com_send;
//[3, getPlayerUID player, _target, name player] spawn comm;

msgbot globalChat format["Server: You have invited %1 to join the group",name _target];