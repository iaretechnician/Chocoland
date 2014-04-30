if(typeof cursortarget in R3F_LOG_CFG_objets_deplacables and (cursortarget getvariable"base") != 1)then {
    _currObject = cursortarget;
    _price = 2500;
    {  if(_x select 2 == typeof _currObject)then {_price =_x select 1;};   
         } foreach BuildStoreArray; 
         _costs=round (_price /10);
         _choco= player getVariable"choco";
         if(_costs > _choco)exitWith {// If the player have not enough money 
          titleText [format["\n Object decode failed, you have not enough money (%1 $)",_costs], "PLAIN DOWN", 0];
			  process = false; };
                player setvariable["choco",_choco -_costs,true];              
                titleText [format["\n you pay %1 $",_costs], "PLAIN DOWN", 0];

_dist=Round (player distance cursortarget);
hint format  ["your object is %1 meter away it need some time",_dist];
_dist = round (_dist /10);



       process = true;
		_totalDuration = _dist;
		_unlockDuration = _totalDuration;
		_iteration = 0;
               
_stringEscapePercent = "%";
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		for "_iteration" from 1 to _unlockDuration do {
           
            if (!(alive player)) exitWith {// If the player dies, revert state.
				2 cutText ["Object decode failed, you are dead...", "PLAIN DOWN", 1];
                              process = false; };
                               
            if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the unlock.
                player switchMove "AinvPknlMstpSlayWrflDnon_medic";
            };
			_unlockDuration = _unlockDuration - 1;
		    _iterationPercentage = floor (_iteration / _totalDuration * 100);
			2 cutText [format["decode object %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
		    sleep 1;
		if (_iteration >= _totalDuration) exitWith { // Sleep a little extra to show that lock has completed
		    sleep 1;
                    deletevehicle _currObject;
         process = false;
         _random = Round (random 5);
         if (_random == 1)then {_random2 = Round (random 2);if(_random2 == 1)then {player setvariable["bounty",(player getvariable"bounty")+1,true];player globalchat"hey you found 1 chocos";};};
         if (_random == 2)then {_random2 = Round (random 4);if(_random2 == 2)then {player setvariable["bounty",(player getvariable"bounty")+2,true];player globalchat"hey you found 2 chocos";};};
         if (_random == 3)then {_random2 = Round (random 10);if(_random2 == 5)then {player setvariable["bounty",(player getvariable"bounty")+5,true];player globalchat"hey you found 5 chocos";};};
         if (_random == 4)then {_random2 = Round (random 50);if(_random2 == 25)then {player setvariable["bounty",(player getvariable"bounty")+10,true];player globalchat"hey you found 10 chocos";};};
         }; 
		};
		player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation.     
 
}else {hint "you cannot decode this object"};