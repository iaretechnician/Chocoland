//	@file Author: [404] Costlyy
//	@file Version: 1.0
//  @file Date:	21/11/2012	
//	@file Description: Locks an object until the player disconnects.
//	@file Args: [object,player,int,lockState(lock = 0 / unlock = 1)]

// Check if mutex lock is active.
if(R3F_LOG_mutex_local_verrou) exitWith {
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
};

private["_locking", "_currObject", "_lockState", "_lockDuration", "_stringEscapePercent", "_interation", "_unlockDuration", "_totalDuration"];

_currObject = _this select 0;
_lockState = _this select 3;

_totalDuration = 0;
_stringEscapePercent = "%";

switch (_lockState) do {
    case 0:{ // LOCK
  
    	R3F_LOG_mutex_local_verrou = true;
		_totalDuration = 4;
                if ((player getvariable"basebuilder")==1) exitwith {
                    _currObject setVariable ["objectLocked", true, true];_currObject setVariable ["base",1,true];_currObject setVariable ["playerGUID", (name player), true];R3F_LOG_mutex_local_verrou = false;2 cutText ["Object locked complete", "PLAIN DOWN", 1];};
		_lockDuration = _totalDuration;
		_iteration = 0;
	
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		
		for "_iteration" from 1 to _lockDuration do {
		   
            if(player distance _currObject > 9) exitWith { // If the player dies, revert state.
		        2 cutText ["Object is to far away ...", "PLAIN DOWN", 1];
                R3F_LOG_mutex_local_verrou = false;
			};
            
            if (!(alive player)) exitWith {// If the player dies, revert state.
				2 cutText ["Object is to far away...", "PLAIN DOWN", 1];
                R3F_LOG_mutex_local_verrou = false;
			};
            
            if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the unlock.
                player switchMove "AinvPknlMstpSlayWrflDnon_medic";
            };
            
			_lockDuration = _lockDuration - 1;
		    _iterationPercentage = floor (_iteration / _totalDuration * 100);
		    
			2 cutText [format["Object lock %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
		    sleep 1;
		    
			if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that lock has completed.
		        sleep 1;
                _currObject setVariable ["objectLocked", true, true];
                _uid = name player;
                _currObject setVariable ["playerGUID", _uid, true];
             if(player getvariable"basebuilder" == 1)then{_currObject setVariable ["base",1,true];};
                2 cutText ["", "PLAIN DOWN", 1];
                R3F_LOG_mutex_local_verrou = false;
		    }; 
		};
 		player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation.       
    };
     case 1:{ // UNLOCK
         
        R3F_LOG_mutex_local_verrou = true;
		_totalDuration = 8;
               if ((player getvariable"basebuilder")==1) exitwith 
               
                  {
                   if ((_currObject getVariable"playerGUID")!=(name player))exitwith {
                   
                    2 cutText [format["You Cannot Unlock this Object, %1 is the Owner of this Object",_currobject getvariable"playerGUID"], "PLAIN DOWN", 1];
                    R3F_LOG_mutex_local_verrou = false;};
                   _currObject setVariable ["objectLocked", false, true];_currObject setVariable ["playerGUID", nil, true];
                   R3F_LOG_mutex_local_verrou = false;2 cutText ["Object unlocked complete", "PLAIN DOWN", 1];
                   };
		_unlockDuration = _totalDuration;
		_iteration = 0;
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		for "_iteration" from 1 to _unlockDuration do {
                    if ((_currObject getVariable"playerGUID")!=(name player)) exitWith{
                        2 cutText [format["You Cannot Unlock this Object, %1 is the Owner of this Object",_currobject getvariable"playerGUID"], "PLAIN DOWN", 1];
                    R3F_LOG_mutex_local_verrou = false;};
                           
                    if(player distance _currObject > 7) exitWith {  R3F_LOG_mutex_local_verrou = false;
                          2 cutText ["Object unlock failed, you too far away...", "PLAIN DOWN", 1];
                           R3F_LOG_mutex_local_verrou = false;};
			
            if (!(alive player)) exitWith {// If the player dies, revert state.
				2 cutText ["Object unlock failed, you too far away...", "PLAIN DOWN", 1];
                              R3F_LOG_mutex_local_verrou = false;};
                               
            if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the unlock.
                player switchMove "AinvPknlMstpSlayWrflDnon_medic";
            };
			_unlockDuration = _unlockDuration - 1;
		    _iterationPercentage = floor (_iteration / _totalDuration * 100);
			2 cutText [format["Object unlock %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
		    sleep 1;
			if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that lock has completed
		        sleep 1;
                _currObject setVariable ["objectLocked", false, true];
                _currObject setVariable ["base", nil, true];
                 _currObject setVariable ["playerGUID", nil, true];
                2 cutText ["", "PLAIN DOWN", 1];
                R3F_LOG_mutex_local_verrou = false;
                                                                    }; 
		};
		player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation.     
      if !(R3F_LOG_mutex_local_verrou) then {
        R3F_LOG_mutex_local_verrou = false;
        diag_log format["WASTELAND DEBUG: An error has occured in LockStateMachine.sqf. Mutex lock was not reset. Mutex lock state actual: %1", R3F_LOG_mutex_local_verrou];
                                            };
       // };
     };
};