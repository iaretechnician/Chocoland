//	@file Version: 1.0
//	@file Name: spawnAction.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args: [int(type of spawn)]

_switch = _this select 0;
_button = _this select 1;

switch(_switch) do 
{
	case 0:{execVM "client\functions\spawnRandomFloor.sqf"};
    case 1:{
	    if(showBeacons) then { 	
	    	[_button] execVM "client\functions\spawnOnBeacon.sqf"
	    } else {
	    	[_button] execVM "client\functions\spawnInTown.sqf"
	    }; 
    };
	case 2:{execVM "client\functions\spawnRandomHALO.sqf"};
	};

if(isNil{client_firstSpawn}) then {
	client_firstSpawn = true;
	[] execVM "client\functions\welcomeMessage.sqf";
	
    true spawn {      
        _startTime = floor(time);
        _result = 0;
		waitUntil
		{ 
		    _currTime = floor(time);
		    if(_currTime - _startTime >= 180) then 
		    {
		    	_result = 1;    
		    };
		    (_result == 1)
		};
        
        // Allow the player to drop money again now that 3 minutes have passed.
        player setVariable["canDrop",true,false];
    
		if(playerSide in [west, east]) then {
			_found = false;
			{
				if(_x select 0 == playerUID) then {_found = true;};
			} forEach pvar_teamSwitchList;
			if(!_found) then {
				pvar_teamSwitchList set [count pvar_teamSwitchList, [playerUID, playerSide]];
				publicVariable "pvar_teamSwitchList";
                
                _side = "";
                if(str(playerSide) == "WEST") then {
                    _side = "Blufor";
                };
                
                if(str(playerSide) == "EAST") then {
                    _side = "Opfor";
                };
                
				titleText [format["You have been locked to %1",_side],"PLAIN",0];
			};
		};
	};
	
} else {
	[] spawn {      
        _startTime = floor(time);
        _result = 0;
		waitUntil
		{ 
		    _currTime = floor(time);
		    if(_currTime - _startTime >= 200) then 
		    {
		    	_result = 1;    
		    };
		    (_result == 1)
		};
        
        // Allow the player to drop money again now that 3 minutes have passed.
        player setVariable["canDrop",true,false];
    };	
};

if(isNil{player getVariable "quickrespawn"}) then {
    player setVariable["quickrespawn",-1,false];
};

// Add counter for every quick respawn
if(((time - respawnMoment) < 30) && ((player getVariable "quickrespawn") < 4)) then {
player setVariable["quickrespawn", (player getVariable "quickrespawn")+1,false];
};

//Reset counter if the last respawn is older than 60seconds.
if(((time - respawnMoment) > 60) && ((player getVariable "quickrespawn") > 0)) then {
player setVariable["quickrespawn",0,false];
};

//Warnings
if(((player getvariable "quickrespawn") > 0) and ((player getvariable "quickrespawn") <= 3)) then {
	_qr = (player getVariable "quickrespawn");
	hint format["WASTELAND SERVER \n\n Quick respawning will be punished. \n\n Wait at least 60seconds between respawns. \n\n  Warning %1/3 \n ", _qr] call RE;
};

if((player getvariable "quickrespawn") == 4) then {
    removeAllWeapons player;
    player setVariable["cmoney",0,true];
    player setVariable["canfood",0,true];
    player setVariable["water",0,true];
	player setVariable["medkits",0,true];
	thirstLevel = 30;
	hungerLevel = 30;
	hintsilent"WASTELAND SERVER \n\n Quick respawn punishment: \n\n Your weapon has been removed. \n Hunger and Thirstlevel is at 30 \n Money has been set to 0$ \n\n Good luck!";
};
respawnMoment = time; // Reset time the player spawned