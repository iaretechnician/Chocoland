

//	@file Version: 1.1
//	@file Name: pickupMoney.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Date modified: 07/12/2012 05:19
//	@file Args:

// Check if mutex lock is active.
if(mutexScriptInProgress || geldaction) exitWith 
{
	//chocoland globalChat "YOU ARE ALREADY PERFORMING ANOTHER ACTION!";
};
_server =0;
_totalDuration = 1;
_lockDuration = _totalDuration;

mutexScriptInProgress = true;

_moneyObject = (nearestobjects [getpos player, ["EvMoney"],  5] select 0);
if((_moneyObject getVariable "owner") == "world") then
{
   	_moneyObject setVariable ["owner", puid, true];
};

for "_iteration" from 1 to _lockDuration do 
{	
	if((_moneyObject getVariable "owner") != puid) exitWith
	{
		
        mutexScriptInProgress = false;  
	};
    	
	if(vehicle player != player) exitWith 
	{
		chocoland globalChat "You can't pick up money whilst in a car";
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
			deleteVehicle (nearestobjects [getpos player, ["EvMoney"],  5] select 0);
                        _money = 1 max floor(random 20);
                        []call countingbounty;
                     _r = floor (random 1000);
                    _money = (_money *250) + _r;
                    _money = round (_money * (player getvariable"bounty"));
                       chocoland globalChat format["You have picked up %1$",_money];
                        player setVariable["cmoney", (player getVariable "cmoney")+_money,true];
                   mutexScriptInProgress = false;
		   geldaction =false;
		};      
	};     
};
