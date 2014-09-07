

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
 then {process = true;
       _currObject setVariable ["basecore",0, true];
		_totalDuration = 8;
		_unlockDuration = _totalDuration;
		_iteration = 0;
                _stringEscapePercent = "%";
		player switchMove "AinvPknlMstpSlayWrflDnon_medic";
		for "_iteration" from 1 to _unlockDuration do {
                   
                    if(player distance _currObject > 10) exitWith {  process = false;
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
                    _y= player getvariable"highscore"; player setvariable["highscore",[_y select 0,_y select 1,_y select 2,_y select 3,_y select 4,(_y select 5)+_money,_y select 6, _y select 7],true];
         
                    player setVariable["bounty",0,true];
                deletevehicle _currObject;
                titleText [format["\n+ you got %1 $ for Destroy BaseCore", _money], "PLAIN DOWN", 0];
                process = false;
                                                                    }; 
		};
		player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon"; // Redundant reset of animation state to avoid getting locked in animation.     
      
       };