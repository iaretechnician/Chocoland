

_private =[_switch,_money2,_range,_object];
_switch = _this select 3 select 0;
_object =0;
hint format["%1",_switch];
switch (_switch) do
{ 
 case 1:{ _object ="Misc_cargo_cont_tiny"};
 case 2:{ _object ="TK_GUE_WarfareBUAVterminal_EP1"};
 case 3:{ _object ="USMC_WarfareBAircraftFactory"};
};

 _currObject = getPos player nearestObject _object; 
 if (player distance _currObject < 10)
 then {process = true;mutexScriptInProgress =true;
       _currObject setVariable ["basecore",0, true];
		_totalDuration = 8;
		_unlockDuration = _totalDuration;
		_iteration = 0;
                _stringEscapePercent = "%";
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		for "_iteration" from 1 to _unlockDuration do {
                   if(!mutexScriptInProgress)exitwith{hint "chanceled";process = false;mutexScriptInProgress =false ;};
                    if(player distance _currObject > 10) exitWith {  process = false;mutexScriptInProgress =false ;
                          2 cutText ["Object destroy failed, you too far away...", "PLAIN DOWN", 1];
                           _currObject setVariable ["basecore",1, true];};
            if (!(alive player)) exitWith {// If the player dies, revert state.
				2 cutText ["Object unlock failed, you are dead...", "PLAIN DOWN", 1];
                              _currObject setVariable ["basecore",1, true];mutexScriptInProgress =false ; };
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
                                player setVariable["cmoney",(player getvariable["cmoney",0]) + _money,true];
                    
                deletevehicle _currObject;
                _currObject = getPos player nearestObject "RU_Pilot"; 
                _currObject;
                titleText [format["\n+ you got %1 $ for Destroy BaseCore", _money], "PLAIN DOWN", 0];
                process = false;mutexScriptInProgress =false ;
                                                                    }; 
		};
		player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation.     
      
       };