 process = false;
 _currObject = getPos player nearestObject "76n6ClamShell"; 
 if (player distance _currObject < 30)
 then {
       process = true;
		_totalDuration = 8;
		_unlockDuration = _totalDuration;
		_iteration = 0;
               
_stringEscapePercent = "%";
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		for "_iteration" from 1 to _unlockDuration do {
                    
                    if(player distance _currObject > 30) exitWith {hint"too far away";  process = false;
                          2 cutText ["Object destroy failed, you too far away...", "PLAIN DOWN", 1];
                           process = false;};
			
            if (!(alive player)) exitWith {// If the player dies, revert state.
				2 cutText ["Object unlock failed, you are dead...", "PLAIN DOWN", 1];
                              process = false; };
                               
            if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the unlock.
                player switchMove "AinvPknlMstpSlayWrflDnon_medic";
            };
			_unlockDuration = _unlockDuration - 1;
		    _iterationPercentage = floor (_iteration / _totalDuration * 100);
			2 cutText [format["basecore delete %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
		    sleep 1;
			if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that lock has completed
		        sleep 1;
                
               
                _money = _currObject getVariable "wallet";
                _bounty = player getVariable"bounty";if(_bounty==0)then{_bounty=1;};
                _money = _money * _bounty;
                  player setVariable["cmoney",(player getVariable"cmoney") + _money,false];
                deletevehicle _currObject;
                titleText [format["\n you got %1 $ for Destroy BaseCore", _money], "PLAIN DOWN", 0];
                process = false;
                                                                    }; 
		};
		player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation.     
      
       }else{hint"too far away";};