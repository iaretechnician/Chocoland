#define groupManagementDialog 55510
#define groupManagementPlayerList 55511
#define groupManagementGroupList 55512
#define groupManagementInviteButton 55514
#define groupManagementKickButton 55515
#define groupManagementDisbandButton 55516
#define groupManagementLeaveButton 55517
#define groupManagementAcceptButton 55518
#define groupManagementDeclineButton 55519
#define groupManagementInviteText 55520
#define groupManagementLeaderButton 55521
            
disableSerialization;
				
private ["_start","_dialog","_myGroup","_display","_playerListBox","_groupListBox","_uid","_namestr","_index","_groupCreate","_groupPromote","_groupInvite","_groupKick","_groupDisband","_groupLeaveButton","_groupAcceptInvite","_groupDeclineInvite",
"_groupInviteText","_inGroup","_isLeader","_name","_hasInvite","_invite"];

closeDialog 0;
_start = createDialog "GroupManagement";			
_dialog = findDisplay groupManagementDialog;
_dialog displayAddEventHandler ["KeyDown", "_return = false; if(groupManagmentActive && (_this select 1) == 1) then {_return = true;}; _return"];
groupManagmentActive = true;
_playerListBox = _dialog displayCtrl groupManagementPlayerList;
_groupListBox = _dialog displayCtrl groupManagementGroupList;
_groupInvite = _dialog displayCtrl groupManagementInviteButton;
_groupKick = _dialog displayCtrl groupManagementKickButton;
_groupDisband = _dialog displayCtrl groupManagementDisbandButton;
_groupLeaveButton = _dialog displayCtrl groupManagementLeaveButton;
_groupAcceptInvite = _dialog displayCtrl groupManagementAcceptButton;
_groupDeclineInvite = _dialog displayCtrl groupManagementDeclineButton;
_groupInviteText = _dialog displayCtrl groupManagementInviteText;
_groupLeader = _dialog displayCtrl groupManagementLeaderButton;

_groupInvite ctrlShow false;
_groupKick ctrlShow false;
_groupDisband ctrlShow false;
_groupLeader ctrlShow false;
_groupLeaveButton ctrlShow false;
_groupDeclineInvite ctrlShow false;
_groupAcceptInvite ctrlShow false;
_hasInvite = false;
_uid = getPlayerUID player;
while{groupManagmentActive} do
{
    //Check if player has invite.
    if((Invite select 1) == player) then {_hasInvite = true; _name = (Invite select 2);};
    
    //Member Controls
    if(count units group player > 1) then 
    {
        if(player == leader group player) then
        {
			_groupDisband ctrlShow true;
            _groupKick ctrlShow true;
			_groupLeaveButton ctrlShow true;
			_groupLeader ctrlShow true;			
        } else {
			_groupLeaveButton ctrlShow true;    
        };
    } else {
    	_groupKick ctrlShow false;
		_groupDisband ctrlShow false;
		_groupLeaveButton ctrlShow false;
		_groupLeader ctrlShow false;		
    };
    
    //Sort Invite Controls
    if(_hasInvite) then
    {
        _groupInviteText ctrlShow true;
        _groupAcceptInvite ctrlShow true;
        _groupDeclineInvite ctrlShow true; 
        	  	
        //Get Invite Text and Set it.
        _groupInviteText ctrlSetStructuredText parseText (format ["Group Invite from:<br/>%1",_name]);
        
    } else {
    	_groupAcceptInvite ctrlShow false;
        _groupDeclineInvite ctrlShow false;
        _groupInviteText ctrlShow false;  	    
    };
    
    //Update player list  
	{
		if(str(side _x) == str(playerSide)) then
	    {
	        if(_x != player) then
	        {
			    //Add to list
			    _namestr = name(_x);             
				_index = _playerListBox lbAdd _namestr;
				_playerListBox lbSetData [_index, str(_x)];  
	        };
	    };	    
	}forEach playableUnits;
    
    //Update group player list
    {
    	_namestr = name(_x);             
		_index = _groupListBox lbAdd _namestr;
		_groupListBox lbSetData [_index, str(_x)];	    
    }forEach units group player;
     
	sleep 0.5;
    _hasInvite = false;
    lbClear _playerListBox;
    lbClear _groupListBox;
};