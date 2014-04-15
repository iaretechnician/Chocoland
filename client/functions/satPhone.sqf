_currObject = getPos player nearestObject "SatPhone"; 

if (player distance _currObject < 4)
 then {
       process = true;
		_totalDuration = 3;
		_unlockDuration = _totalDuration;
		_iteration = 0;
               
_stringEscapePercent = "%";
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		for "_iteration" from 1 to _unlockDuration do {
                    
                    if(player distance _currObject > 3) exitWith {  process = false;
                          2 cutText ["Object redeem failed, you too far away...", "PLAIN DOWN", 1];
                           process = false;};
			
            if (!(alive player)) exitWith {// If the player dies, revert state.
				2 cutText ["Object redeem failed, you are dead...", "PLAIN DOWN", 1];
                              process = false; };
                               
            if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the unlock.
                player switchMove "AinvPknlMstpSlayWrflDnon_medic";
            };
			_unlockDuration = _unlockDuration - 1;
		    _iterationPercentage = floor (_iteration / _totalDuration * 100);
			2 cutText [format["redeeming ChocoKill %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
		    sleep 1;
			if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that lock has completed
		        sleep 1;
                
               
 _bounty= player getVariable"bounty";
_random= Round (random 8);
if(_random!=2) then { titleText [format["\n you got 1 ChocoKill"], "PLAIN DOWN", 0];_ck =1;};    
if(_random==2) then { titleText [format["\n you are lucky you got 2 ChocoKills"], "PLAIN DOWN", 0];_ck = 2;};
                deletevehicle _currObject;
                player setvariable["bounty", _bounty +_ck, false];
            
                process = false;
                                                                    }; 
		};
		player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation.     
      
       } else {hint " your are too far away";};
