//	@file Version: 1.0
//	@file Name: playerSelect.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define playerMenuDialog 55500
#define playerMenuPlayerList 55505
#define playerMenuSpectateButton 55506
#define playerMenuWarnMessage 55509

disableSerialization;
_uid = getPlayerUID player;
private ["_dialog","_playerListBox","_spectateButton","_switch","_index","_modSelect","_playerData","_target","_check","_spectating","_camadm","_rnum","_warnText","_targetUID","_playerName"];
_uid = getPlayerUID player;
if ((_uid in moderators) OR (_uid in administrators) OR (_uid in serveradministrators)) then {
	_dialog = findDisplay playerMenuDialog;
	_playerListBox = _dialog displayCtrl playerMenuPlayerList;
	_spectateButton = _dialog displayCtrl playerMenuSpectateButton;
	_warnMessage = _dialog displayCtrl playerMenuWarnMessage;
	
	_switch = _this select 0;
	_index = lbCurSel _playerListBox;
	_playerData = _playerListBox lbData _index;
	
	{  
		if (str(_x) == _playerData) then {
			_target = _x;
			_check = 1;
		};
	}forEach playableUnits;
	
	if (_check == 0) then {exit;};
	
	switch (_switch) do
	{
	    case 0: //Spectate
		{
		[1,_target] execVM "addons\proving_ground\fnc_spectate.sqf";
              if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *spectate* for player %1",name _target];
                publicvariableserver "diag_log_server";};
		};
		case 1: //Warn
		{
		_warnText = ctrlText _warnMessage;
	        _playerName = name player;
		_target setVehicleInit format["if (name player == ""%2"") then {titleText [""Admin %3: %1"", ""plain""]; titleFadeOut 10;};",_warnText,name _target,_playerName];
	        processInitCommands;
	        clearVehicleInit _target;
                 if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *warning* for player %1",name _target];
                publicvariableserver "diag_log_server";};
		};
	    case 2: //Slay
	    {
			_target setVehicleInit format["if (name player == ""%1"") then {player setdamage 1;deletevehicle player;};",name _target];
			processInitCommands;
			clearVehicleInit _target;
                         if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *slay* for player %1",name _target];
                publicvariableserver "diag_log_server";};
	    };
	    case 3: //Unlock Team Switcher
	    {      
			_targetUID = getPlayerUID _target;
	        {
			    if(_x select 0 == _targetUID) then
			    {
			    	pvar_teamSwitchList set [_forEachIndex, "REMOVETHISCRAP"];
				pvar_teamSwitchList = pvar_teamSwitchList - ["REMOVETHISCRAP"];
			        publicVariableServer "pvar_teamSwitchList";
	                
	                _target setVehicleInit format["if (name player == ""%1"") then {client_firstSpawn = nil;};",name _target];
			        processInitCommands;
			        clearVehicleInit _target;
	                
	                player setVehicleInit format["if isServer then {publicVariable 'pvar_teamSwitchList';};"];
			        processInitCommands;
			        clearVehicleInit player;  
                                if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *teamswitch* for player %1",name _target];
                publicvariableserver "diag_log_server";};       
			    };
			}forEach pvar_teamSwitchList;		
                       
	    };
		case 15: //Unlock Team Killer
	   {      
			_targetUID = getPlayerUID _target;
	        {
			    if(_x select 0 == _targetUID) then
			    {
			    	pvar_teamKillList set [_forEachIndex, "REMOVETHISCRAP"];
					pvar_teamKillList = pvar_teamKillList - ["REMOVETHISCRAP"];
			       publicVariableServer "pvar_teamKillList"; 
	                
	                player setVehicleInit format["if isServer then {publicVariable 'pvar_teamKillList';};"];
			        processInitCommands;
			       clearVehicleInit player;       
			    };
			}forEach pvar_teamKillList;       		
	    };
            case 4: //Remove All Money
	    {      
			_targetUID = getPlayerUID _target;
	        {
			    if(getPlayerUID _x == _targetUID) then
			    {
  					_x setVariable["bounty",0,true];
                                        if (_uid in administrators) then {diag_log_server = parsetext format["patrick used  *remove choco* for player %1",name _target];
                publicvariableserver "diag_log_server";};    
			    };
			}forEach playableUnits;    
                     
	    };
        case 5: //Remove All Money
	    {      
			_targetUID = getPlayerUID _target;
	        {
			    if(getPlayerUID _x == _targetUID) then
			    {
  					_x setVariable["choco",0,true];
                                        if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *remove money* for player %1",name _target];
                publicvariableserver "diag_log_server";};                        
			    };
			}forEach playableUnits;      
 
	    };
        case 6: //Remove All Weapons
	    {      
			_targetUID = getPlayerUID _target;
	        {
			    if(getPlayerUID _x == _targetUID) then
			    {
					if(!(local _x)) then {
						[nil, _x, "loc", rSPAWN, [_x], { removeAllWeapons (_this select 0) }] call RE;
					} else {
						removeAllWeapons _x;
					};  
                                        if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *remove Weapon* for player %1",name _target];
                publicvariableserver "diag_log_server";};
			    };
			}forEach playableUnits;       
                       
	    };
        case 7: //Check Player Gear
	    {      
			_targetUID = getPlayerUID _target;
	        {
			    if(getPlayerUID _x == _targetUID) then
			    {
  					createGearDialog [_x, "RscDisplayGear"];
                                        if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *check gear* for player %1",name _target];
                publicvariableserver "diag_log_server";};    
			    };
			}forEach playableUnits;   
                     
	    };
             case 8: //add 25k Money
	    {      
			_targetUID = getPlayerUID _target;
	        {
			    if(getPlayerUID _x == _targetUID) then
			    {
                                _killerMoney = _x getVariable "choco";
                                _newMoney = _killerMoney +25000;
                                _x setVariable ["choco", _newMoney, true];
                                if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *25k money* for player %1",name _target];
                publicvariableserver "diag_log_server";};      
  			   };
			}forEach playableUnits;    
                   
	    };
             case 9: //teletoplayer
	    {      
			_targetUID = getPlayerUID _target;
	        {
			    if(getPlayerUID _x == _targetUID) then
			    {
                             _playerName = name player;
                            _target setVehicleInit format["if (name player == ""%1"") then {titleText [""Admin %2 is approaching you"", ""plain""]; titleFadeOut 5;};",name _target,_playerName];
                              processInitCommands;
                             clearVehicleInit _target;
                            _pos1 = getPosATL _x;
                             player setPosATL _pos1;
                             if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *teleport* for player %1",name _target];
                publicvariableserver "diag_log_server";};  
  			   };
			}forEach playableUnits;      
                       
	    };
             case 10: //teleplayer to admin
	    {      
			_targetUID = getPlayerUID _target;
	        {
			    if(getPlayerUID _x == _targetUID) then
			    {
                             _playerName = name player;
                           clearVehicleInit _target;
                            _pos1 = getPosATL player;
                             _x setPosATL _pos1;  
                             if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *teleport to admin* for player %1",name _target];
                publicvariableserver "diag_log_server";};
  			   };
			}forEach playableUnits;       	
                      
	    };
             case 11: //chocos -1
	    {      
			_targetUID = getPlayerUID _target;
	        {
			  if(getPlayerUID _x == _targetUID) then
			    {
                                _bounty = _x getVariable "bounty";
                                _bount = _bounty -1;
                                _x setVariable ["bounty", _bount, true];
                                if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *-1choco* for player %1",name _target];
                publicvariableserver "diag_log_server";};      
  			   };
			}forEach playableUnits;   
                   
	    };
            case 12: //chocos +1
	    {      
			_targetUID = getPlayerUID _target;
	        {
			  if(getPlayerUID _x == _targetUID) then
			    {
                                _bounty = _x getVariable "bounty";
                                _bount = _bounty +1;
                                _x setVariable ["bounty", _bount, true];
                                if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *+1 choco* for player %1",name _target];
                publicvariableserver "diag_log_server";};                        
  			   };
			}forEach playableUnits;   
 
	    };
            case 13: //chocos +5
	    {      
			_targetUID = getPlayerUID _target;
	        {
			  if(getPlayerUID _x == _targetUID) then
			    {
                                _bounty = _x getVariable "bounty";
                                _bount = _bounty +5;
                                _x setVariable ["bounty", _bount, true];
                                if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *+5 chocos* for player %1",name _target];
                publicvariableserver "diag_log_server";};     
  			   };
			}forEach playableUnits;  
                    
	    };
            case 14: //donator
	    {      
			_targetUID = getPlayerUID _target;
	        {
			  if(getPlayerUID _x == _targetUID) then
			    {
                                _bounty = _x getVariable "donator";
                                if(_bounty == 1)then{
                                _x setVariable ["donator", 0, true];}else{
                                _x setVariable ["donator", 1, true];};
                                if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *+Donator* %2 for player %1",name _target,_bounty];
                publicvariableserver "diag_log_server";};  
  			   };
			}forEach playableUnits;  
                       
	    };
             case 15: //basebuilder
	    {      
			_targetUID = getPlayerUID _target;
	        {
			  if(getPlayerUID _x == _targetUID) then
			    {
                                _bounty = _x getVariable "basebuilder";
                                if(_bounty == 1)then{
                                _x setVariable ["basebuilder", 0, true];}else{
                                _x setVariable ["basebuilder", 1, true];};
                                if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *basebuilder* %2 for player %1",name _target,_bounty];
                publicvariableserver "diag_log_server";};  
  			   };
			}forEach playableUnits;     
                             
	    };
            case 16: //decoder
	    {      
			_targetUID = getPlayerUID _target;
	        {
			  if(getPlayerUID _x == _targetUID) then
			    {
                                _bounty = _x getVariable "decoder";
                                if(_bounty == 1)then{
                                _x setVariable ["decoder", 0, true];}else{
                                _x setVariable ["decoder", 1, true];};
                                if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *decoder* %2 for player %1",name _target,_bounty];
                publicvariableserver "diag_log_server";}; 
  			   };
			}forEach playableUnits;  
                              
	    };
             case 17: //attach
	    {      
			_targetUID = getPlayerUID _target;
	        {
			  if(getPlayerUID _x == _targetUID) then
			    {
                                _bounty = _x getVariable "attach";
                                if(_bounty == 1)then{
                                _x setVariable ["attach", 0, true];}else{
                                _x setVariable ["attach", 1, true];};
                                if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *+Donator* %2 for player %1",name _target,_bounty];
                publicvariableserver "diag_log_server";};       
  			   };
			}forEach playableUnits;
                        
	    };
             case 18: //upgrades
	    {      
			_targetUID = getPlayerUID _target;
	        {
			  if(getPlayerUID _x == _targetUID) then
			    {
                                _bounty = _x getVariable "upgrades";
                                if(_bounty == 1)then{
                                _x setVariable ["upgrades", 0, true];}else{
                                _x setVariable ["upgrades", 1, true];};
                                if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *upgrades* %2 for player %1",name _target,_bounty];
                publicvariableserver "diag_log_server";};   
  			   };
			}forEach playableUnits;   
                            
	    };
              case 19: //add 100k Money
	    {      
			_targetUID = getPlayerUID _target;
	        {
			    if(getPlayerUID _x == _targetUID) then
			    {
                                _killerMoney = _x getVariable "choco";
                                _newMoney = _killerMoney +100000;
                                _x setVariable ["choco", _newMoney, true]; 
                                if (_uid in administrators) then {diag_log_server = parsetext format["patrick used *+100k money* for player %1",name _target,_bounty];
                publicvariableserver "diag_log_server";};  
  			   };
			}forEach playableUnits;       
                          
	    };
	};
} else {
  exit;  
};