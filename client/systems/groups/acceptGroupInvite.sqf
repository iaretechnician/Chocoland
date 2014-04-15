private["_inviterUID","_inviter"];

//Get the inviters UID
_groupExists = false;
_inviterUID = Invite select 0;
Invite = [];

//Get the inviter with their UID
{
	if(getPlayerUID _x == _inviterUID) then
    {
    	_inviter = _x;
        _groupExists = true;	    
    };   
}forEach playableUnits;

if(_groupExists) then
{
	[player] join (group _inviter);
    msgbot globalChat format["Server: You have accepted the invite"];
} else {
	msgbot globalChat format["Server: The group no longer exists"];    
}; 