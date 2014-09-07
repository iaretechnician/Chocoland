

//	@file Version: 1.1
//	@file Name: pickupMoney.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Date modified: 07/12/2012 05:19
//	@file Args:

// Check if mutex lock is active.
if(mutexScriptInProgress || geldaction) exitWith 
{
	//player globalChat "YOU ARE ALREADY PERFORMING ANOTHER ACTION!";
};
_server =0;
_totalDuration = 1;
_lockDuration = _totalDuration;

mutexScriptInProgress = true;

_moneyObject = (nearestobjects [getpos player, ["EvMoney"],  5] select 0);
if((_moneyObject getVariable "owner") == "world") then
{
   	_moneyObject setVariable ["owner", getPlayerUID player, true];
};

for "_iteration" from 1 to _lockDuration do 
{	
	if((_moneyObject getVariable "owner") != getPlayerUID player) exitWith
	{
		
        mutexScriptInProgress = false;  
	};
    	
	if(vehicle player != player) exitWith 
	{
		player globalChat "You can't pick up money whilst in a car";
	//	player action ["eject", vehicle player];
	//	sleep 1;
		mutexScriptInProgress = false;
        
        _moneyObject setVariable ["owner", "world", true];
	};   
		    
	
		    
	_lockDuration = _lockDuration - 1;
	sleep 1;
    		    
	if(player distance (nearestobjects [player, ["EvMoney"],  5] select 0) > 5) exitWith 
	{
		mutexScriptInProgress = false;
        _moneyObject setVariable ["owner", "world", true];
	};
				    
	if (_iteration >= _totalDuration) exitWith 
	{
		
		_currMoneyTemp = (nearestObjects [getpos player, ["EvMoney"],  5]);
                    
		if(count _currMoneyTemp == 0) then 
		{
			
			mutexScriptInProgress = false;
            _moneyObject setVariable ["owner", "world", true];
		} else {
		geldaction = true;
			_money = ((nearestobjects [getpos player, ["EvMoney"],  5] select 0) getVariable "cash");
                        _server = ((nearestobjects [getpos player, ["EvMoney"],  5] select 0) getVariable "server");
			deleteVehicle (nearestobjects [getpos player, ["EvMoney"],  5] select 0);
                        if(_server == 1) then {_money = _money max floor(_money * (player getVariable "bounty"))};
                     
                       player globalChat format["You have picked up $%1",_money];
                        player setVariable["choco", (player getVariable "choco")+_money,true];
                         _y= player getvariable"highscore"; player setvariable["highscore",[_y select 0,_y select 1,_y select 2,_y select 3,_y select 4,(_y select 5)+_money,_y select 6, _y select 7],true];
         
			
			mutexScriptInProgress = false;
		        PDB_saveReq = getPlayerUID player;
                        publicVariableServer "PDB_saveReq";
                        geldaction =false;
		};      
	};     
};
