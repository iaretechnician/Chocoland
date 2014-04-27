
 _currObject = getPos player nearestObject "Misc_cargo_cont_tiny"; 
 if (player distance _currObject < 3)
 then {
       process = true;
       _currObject setVariable ["basecore",0, true];
		_totalDuration = 8;
		_unlockDuration = _totalDuration;
		_iteration = 0;
               
_stringEscapePercent = "%";
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		for "_iteration" from 1 to _unlockDuration do {
                    
                    if(player distance _currObject > 3) exitWith {  process = false;
                          2 cutText ["Object destroy failed, you too far away...", "PLAIN DOWN", 1];
                           _currObject setVariable ["basecore",1, true];};
			
            if (!(alive player)) exitWith {// If the player dies, revert state.
				2 cutText ["Object unlock failed, you are dead...", "PLAIN DOWN", 1];
                              _currObject setVariable ["basecore",1, true]; };
                               
            if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the unlock.
                player switchMove "AinvPknlMstpSlayWrflDnon_medic";
            };
			_unlockDuration = _unlockDuration - 1;
		    _iterationPercentage = floor (_iteration / _totalDuration * 100);
			2 cutText [format["basecore delete %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
		    sleep 1;
			if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that lock has completed
		        sleep 1;
                _currObject setVariable ["basecore",0, true];
               
                _money = _currObject getVariable "wallet";
                _bounty = player getVariable"bounty";if(_bounty==0)then{_bounty=1;};
                _money = _money * _bounty;
                  player setVariable["choco",(player getVariable"choco") + _money,true];
                deletevehicle _currObject;
                titleText [format["\n+ you got %1 $ for Destroy BaseCore", _money], "PLAIN DOWN", 0];
                process = false;
                                                                    }; 
		};
		player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation.     
      
       };