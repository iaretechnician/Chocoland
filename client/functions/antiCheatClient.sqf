//	@file Version: 1.0
//	@file Name: antiCheatClient.sqf
//	@file Author: [404] Costlyy
//	@file Created: 03/05/13
//	@file Args:

_datehour= 0;
_dateMin = 0;
_min = 0;
chocomin = 0;
_bannedWeapons = [
    "2A14","2A38M","2A42","2A46M","2A46MRocket","2A70","2A70Rocket","2A72","2B14","57mmLauncher","57mmLauncher_128","57mmLauncher_64",
    "80mmLauncher","9M311Laucher","AALauncher_twice","AGS17","AGS30_heli","AirBombLauncher","AT10LauncherSingle","AT11LauncherSingle","AT13LauncherSingle","AT5Launcher","AT5LauncherSingle",
    "AT6Launcher","AT9Launcher","AZP85","BAF_GMG","BombLauncher","Ch29Launcher","CRV7_FAT","CRV7_HEPD",
    "CRV7_PG","CTWS","D10","D30","D81","DT_veh","FFARLauncher","FFARLauncher_14","GRAD","GSh23L",
    "GSh23L_L39","GSh301","GSh302","HeliBombLauncher","HellfireLauncher","HellfireLauncher_AH6","Igla_twice","KPVT","M119","M120","M134",
    "M134_2","M168","M197","M230","M242","M242BC","M252","M256","M2BC","M32_heli","M3P","M621",
    "M68","MaverickLauncher","MissileLauncher","Mk82BombLauncher","Mk82BombLauncher_6","MLRS","R73Launcher","R73Launcher_2","RocketPods","S8Launcher",
    "SmokeLauncher","SPG9","StingerLaucher_4x","StingerLauncher_twice","TOWLauncherSingle","TwinM134","TwinVickers","VikhrLauncher",
    "ZiS_S_53"];
    
// TODO: Make mission vehicles sit in public arrays, then extrapolate the vehicles out of the cfgVehicles in full
//  and just compare to make sure the selected vehicle is not in any of the mission arrays.
_bannedVehicles = [
	"CruiseMissile1","CruiseMissile2","RM70_ACR","T810_Des_ACR","T810_ACR","T810Reammo_ACR",
    "Ka52Black","Su25_Ins","F35","Su25_TK_EP1","Mi24_D_TK_EP1","T810Reammo_Des_ACR","M1114_AGS_ACR","T810Refuel_ACR","T810Refuel_Des_ACR",
    "L159_ACR","L39_ACR", "L39_2_ACR","T810A_Des_MG_ACR",
    "BRDM2_Gue","BRDM2_HQ_Gue","BRDM2_INS","GRAD_CDF","T810A_MG_ACR",
	"GRAD_RU","GRAD_CDF","KamazOpen","RM70_ACR",
	"LAV25_HQ","MMT_USMC","BMP2_Ambul_CDF","BMP2_Gue",
	"BMP2_HQ_CDF","BMP2_HQ_INS","BMP2_INS","MLRS","T72_CDF","T72_Gue","ZSU_CDF","ZSU_INS","AH64D_Sidewinders",
    "Ka52Black","Mi17_CDF","Mi17_Ins", "Pandur2_ACR", "BVP1_TK_ACR", "BVP1_TK_GUE_ACR", "BRDM2_Desert_ACR", "BRDM2_ACR", "BMP2_ACR",
	"Mi17_rockets_RU","Mi24_V","Mi17_TK_EP1","Mi17_UN_CDF_EP1","Mi171Sh_CZ_EP1", "BMP2_Des_ACR",
    "T810_Open_ACR","T810_Open_Des_ACR","T810Repair_ACR","T810Repair_Des_ACR","Dingo_GL_DST_ACR","Dingo_GL_Wdl_ACR","Dingo_WDL_ACR","Dingo_DST_ACR",
    "LandRover_ACR","LandRover_Ambulance_ACR","LandRover_Ambulance_Des_ACR","Octavia_ACR","UAZ_Unarmed_ACR",
    "Mi171Sh_rockets_CZ_EP1""AH6J_EP1","Mi24_D_CZ_ACR","M1114_AGS_ACR","M1114_DSK_ACR"];
    
    
_currencyLimit = 99000000; // 10k money limit for initial config.

_instantKick = true; // Kick the bastards immediately or taunght them a little?
_moneyKick = true; // Kick players who greatly exceed the money limit? Note: THIS MAY LEAD TO FALSE-POSITIVES! YOU HAVE BEEN WARNED...

func_tauntHacker = {                
	// Black their screen out and taunt them with silly messages! Mwahahahaha!
	titleText ["", "BLACK IN", 0];
	titleText ["ERROR: User performed an illegal operation. \n\n If the problem persists, contact your system administrator or stop using hacked items.","black"]; 
	diag_log format["player:%1 uses hacks!",name player];
        sleep 10; titleFadeOut 10; 
};
while {true} do {
   
//_currObject = getPos player nearestObject "EvMoney";
_nObject = nearestObject [player, "EvMoney"];
//if(player distance (nearestobjects [player, ["EvMoney"],  2] select 0) < 2)then { []execVM "client\actions\pickupMoney.sqf";};
if(player distance _nObject < 2 && moneypick == 1)then { []execVM "client\actions\pickupMoney.sqf";};
//_nObject = nearestObject [player, "PipeBomb"];
//[] execVM "client\functions\antiCheatClient.sqf";

     _uid = getPlayerUID player;
    if ((_uid in serverAdministrators)) then {
thirstLevel = 100;
hungerLevel = 100;
    	_targetUID = getPlayerUID player;
	        {
			    if(_x select 0 == _targetUID) then
			    {
			    	pvar_teamSwitchList set [_forEachIndex, "REMOVETHISCRAP"];
					pvar_teamSwitchList = pvar_teamSwitchList - ["REMOVETHISCRAP"];
			        publicVariableServer "pvar_teamSwitchList";
	                
	                player setVehicleInit format["if (name player == ""%1"") then {client_firstSpawn = nil;};",name player];
			        processInitCommands;
			        clearVehicleInit player;
	                
	                player setVehicleInit format["if isServer then {publicVariable 'pvar_teamSwitchList';};"];
			        processInitCommands;
			        clearVehicleInit player;         
			    };
			}forEach pvar_teamSwitchList;
        };
     //	player enableSimulation true;
   //    disableUserInput false;
	        
	   { // Check for illegal weapons. 
    	if (currentWeapon player == _x) exitWith {
        	// Firstly MITIGATE the damage by removing the infringing weaponry.
    		removeAllWeapons player;
            if (!_instantKick) then { [] call func_tauntHacker; }; 
            endMission "LOSER";
        };
    }forEach _bannedWeapons;
    
    { // Check for illegal vehicles. 
    	if ((typeOf (vehicle player)) == _x) then {
        	deleteVehicle (vehicle player);
            playSound "IncomingChallenge";
        	[] call func_tauntHacker;
        };
    }forEach _bannedVehicles;
              	
	// Loop speed not much of an issue clientside.
	sleep 2; 
};

