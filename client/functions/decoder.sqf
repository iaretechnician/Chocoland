
if((typeof cursortarget) in R3F_LOG_CFG_objets_deplacables and !Dcooldown)then {
    Dcooldown = true;
    _currObject = cursortarget;
    _price = 1000;
    {  if(_x select 2 == typeof _currObject)then {_price =_x select 1;};   
         } foreach BuildStoreArray; 
         _costs=(round (_price));
         _choco= player getVariable"choco";
        if(_costs > _choco)exitWith {// If the player have not enough money 
          titleText [format["\n Object decode failed, you have not enough money (%1 $)",_costs], "PLAIN DOWN", 0];
			 Dcooldown = false; };
                player setvariable["choco",_choco -_costs,true];              
                titleText [format["\n you payed %1 $",_costs], "PLAIN DOWN", 0];

_dist=Round (player distance cursortarget);
hint format  ["your object is %1 meters away",_dist];
_dist = round (_dist /3);
if (_dist < 1)then {_dist=1;};
_totalDuration = _dist;
		_unlockDuration = _totalDuration;
		_iteration = 0;
                _stringEscapePercent = "%";
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		for "_iteration" from 1 to _unlockDuration do {
           
            if (!(alive player)) exitWith {// If the player dies, revert state.
				2 cutText ["Object decode failed, you are dead...", "PLAIN DOWN", 1];
                             Dcooldown = false; };
                               
            if (animationState player != "AinvPknlMstpSlayWrflDnon_medic") then { // Keep the player locked in medic animation for the full duration of the unlock.
                player switchMove "AinvPknlMstpSlayWrflDnon_medic";
            };
			_unlockDuration = _unlockDuration - 1;
		    _iterationPercentage = floor (_iteration / _totalDuration * 100);
			2 cutText [format["decode object %1%2 complete", _iterationPercentage, _stringEscapePercent], "PLAIN DOWN", 1];
		    sleep 1;
		if (_iteration >= _totalDuration) exitWith {Dcooldown = false; // Sleep a little extra to show that lock has completed
		    sleep 0.5;
                    _base = _currObject getvariable"base";
                    if (_base == 1)exitwith {Dcooldown = false;
                        _random = floor (random 100);
                        if(_random > 90)then {hint "your lucky the basebuilder-object is deleted";_costs = round(_costs * 1.5);
          player setvariable["choco",_choco +_costs,true]; 
           titleText [format["\n you get %1 $",_costs], "PLAIN DOWN", 0];
           deletevehicle _currObject;}else{hint"your not lucky the basebuilder-object is still locked";};
                        
                };
                    deletevehicle _currObject;
                    _costs = round(_costs * 1.5);
          player setvariable["choco",_choco +_costs,true]; 
            _y= player getvariable"highscore"; player setvariable["highscore",[_y select 0,_y select 1,_y select 2,_y select 3,_y select 4,(_y select 5)+_costs,_y select 6, _y select 7],true];
         
           titleText [format["\n you get %1 $",_costs], "PLAIN DOWN", 0];
         _random = floor (random 100);
         if (_random > 90)then {player setvariable["bounty",(player getvariable"bounty")+1,true];player globalchat"hey you found 1 chocos";};
         
         
         };
		};
		player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";      
 
}else {hint "you cannot decode this object";};