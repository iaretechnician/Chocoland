
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
              
		};
		case 1: //Warn
		 {      
			_targetUID = getPlayerUID _target;
			_warnText = ctrlText _warnMessage;
	      		  _numberString = _warnText; _number = call compile (_numberString);
              
	        {
			    if(getPlayerUID _x == _targetUID) then
			    {
                                _x setVariable ["choco", _number, true];
                                 
  			   };
			}forEach playableUnits;    
                   
	    };
		
	    case 2: //Slay
	    {
			_target setVehicleInit format["if (name player == ""%1"") then {player setdamage 1;deletevehicle player;};",name _target];
			processInitCommands;
			clearVehicleInit _target;
                      
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
                                    
			    };
			}forEach pvar_teamSwitchList;		
                       
	    };
		case 4: //Unlock Team Killer
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
            case 20: //Remove All Money
	    {      
			_targetUID = getPlayerUID _target;
	        {
			    if(getPlayerUID _x == _targetUID) then
			    {
  					_x setVariable["bounty",0,true];
                                         
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
                             
  			   };
			}forEach playableUnits;  
                       
	    };
             case 15: //basebuilder
	    {    	_targetUID = getPlayerUID _target;
	        {
			  if(getPlayerUID _x == _targetUID) then
			    {
                                _bounty = _x getVariable "basebuilder";
                                if(_bounty == 1)then{
                                _x setVariable ["basebuilder", 0, true];}else{
                                _x setVariable ["basebuilder", 1, true];};
                             
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
                               
  			   };
			}forEach playableUnits;       
                          
	    };
                case 21: //reset all stats
	    {      
			_targetUID = getPlayerUID _target;
	        {
			    if(getPlayerUID _x == _targetUID) then
			    {
                                _x setDamage 0;
_x setVariable["dot",0,true];
_x setVariable["animal",false,true];
_x setVariable["bounty",0,true];
_x setVariable["donator",0,true];
_x setVariable["decoder",0,true];
_x setVariable["basebuilder",0,true];
_x setVariable["choco",500,true];
_x setVariable["attach",0,true];
_x setVariable["upgrades",0,true];
_x setVariable["canfood",2,true];
_x setVariable["chocopack",nil,true];
_x setVariable["chocoload",[],true];

_x setVariable["highscore",[0,0,0,0,0],true];
_x setVariable["saveVehicle",0,true];
_x setVariable["medkits",0,true];
_x setVariable["water",2,true];
_x setVariable["fuel",0,true];
_x setVariable["repairkits",0,true];
_x setVariable["fuelFull", 1,true];
_x setVariable["fuelEmpty",0,true];
_x setVariable["bombs",false,true];
_x setVariable["spawnBeacon",0,true];
_x setVariable["camonet",0,true];
_x setVariable["canDrop",false,true]; 
                               
  			   };
			}forEach playableUnits;       
                          
	    };
	};
} else {
  exit;  
};