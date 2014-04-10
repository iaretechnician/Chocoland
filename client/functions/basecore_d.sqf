
 _currObject = nearestObject [player, "Misc_cargo_cont_tiny"];
 if (player distance (nearestobjects [player, ["Misc_cargo_cont_tiny"],  20] select 0) < 5)
 then {
       process = true;
		_totalDuration = 8;
		_unlockDuration = _totalDuration;
		_iteration = 0;
               
_stringEscapePercent = "%";
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		for "_iteration" from 1 to _unlockDuration do {
                    if ((_currObject getVariable "basecore") == 1) exitWith{
                          2 cutText ["You Cannot Unlock this Object, you are not the Owner of this Object", "PLAIN DOWN", 1];
                           process = false;};
                    if(player distance _currObject > 7) exitWith {  process = false;
                          2 cutText ["Object unlock failed, you too far away...", "PLAIN DOWN", 1];
                           process = false;};
			
            if (!(alive player)) exitWith {// If the player dies, revert state.
				2 cutText ["Object unlock failed, you too far away...", "PLAIN DOWN", 1];
                              process = false; };
                               
            if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the unlock.
                player switchMove "AinvPknlMstpSlayWrflDnon_medic";
            };
			_unlockDuration = _unlockDuration - 1;
		    _iterationPercentage = floor (_iteration / _totalDuration * 100);
			2 cutText [format["Object unlock %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
		    sleep 1;
			if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that lock has completed
		        sleep 1;
                _currObject setVariable ["basecore",0, true];
                _currObject setDamage 1;
                2 cutText ["", "PLAIN DOWN", 1];
                process = false;
                                                                    }; 
		};
		player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation.     
      if !(process) then {
        process = false;
                                        };
       };