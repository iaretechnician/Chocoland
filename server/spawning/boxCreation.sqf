
if(!X_Server) exitWith {};

private ["_selectedBox", "_selectedBoxPos", "_finishedBox", "_currBox"];

_selectedBox = _this select 0;
_selectedBoxPos = _this select 1;

switch(_selectedBox) do {
	case "basicUS": { // Basic US 1 is mainly M16's and standard US Army weaponry
    	_currBox = createVehicle ["USBasicWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
         _currBox addWeaponCargoGlobal ["M9SD",20];
		_currBox addWeaponCargoGlobal ["M16A4_ACG_GL",20];
		_currBox addWeaponCargoGlobal ["M4A1_HWS_GL",20];
		_currBox addWeaponCargoGlobal ["M4A1_AIM_SD_camo",20];
		_currBox addWeaponCargoGlobal ["M4A1_HWS_GL_SD_Camo",20];	
		_currBox addWeaponCargoGlobal ["M4A3_RCO_GL_EP1",20];
		_currBox addWeaponCargoGlobal ["NVgoggles",10];
        
        // Add ammunition
      _currBox addMagazineCargoGlobal ["15Rnd_9x19_M9SD",55];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",150];
		_currBox addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",50];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",50];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",50];
		_currBox addMagazineCargoGlobal ["SmokeShell",50];
		_currBox addMagazineCargoGlobal ["SmokeShellRed",50];
		_currBox addMagazineCargoGlobal ["SmokeShellGreen",50]; 
    };
    case "basicUS2": { // Basic US 2 is a few M4's and some combat shotguns
    	_currBox = createVehicle ["USBasicWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
       _currBox addWeaponCargoGlobal ["SCAR_L_CQC",20];
		_currBox addWeaponCargoGlobal ["SCAR_L_CQC_CCO_SD",20];
		_currBox addWeaponCargoGlobal ["SCAR_L_CQC_EGLM_Holo",30];
		_currBox addWeaponCargoGlobal ["SCAR_L_CQC_Holo",20];
		_currBox addWeaponCargoGlobal ["SCAR_L_STD_EGLM_RCO",20];	
		_currBox addWeaponCargoGlobal ["SCAR_L_STD_Mk4CQT",20];	
		_currBox addWeaponCargoGlobal ["m107_TWS_EP1",20];
		_currBox addWeaponCargoGlobal ["Binocular_Vector",20];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",200];
		_currBox addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",150];
        _currBox addMagazineCargoGlobal ["HandGrenade",30];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",30];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",30];
		_currBox addMagazineCargoGlobal ["10Rnd_127x99_m107",20];
    };
    case "basicRU": { // Basic RU 1 is mainly AK's and better pistols, footsoldier weapons.
    	_currBox = createVehicle ["RUBasicWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["AK_107_kobra",40];
		_currBox addWeaponCargoGlobal ["AK_107_GL_kobra",20];
		_currBox addWeaponCargoGlobal ["AKS_74_U",40];
		_currBox addWeaponCargoGlobal ["MakarovSD",80];	
          _currBox addWeaponCargoGlobal ["SCAR_H_CQC_CCO",20];
		_currBox addWeaponCargoGlobal ["SCAR_H_CQC_CCO_SD",30];
		_currBox addWeaponCargoGlobal ["SCAR_H_STD_EGLM_Spect",30];
		_currBox addWeaponCargoGlobal ["SCAR_H_LNG_Sniper",20];
		_currBox addWeaponCargoGlobal ["M110_NVG_EP1",20];
		_currBox addWeaponCargoGlobal ["M32_EP1",20];	
		_currBox addWeaponCargoGlobal ["Mk13_EP1",20];
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_545x39_AK",500];
        _currBox addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD",240];
        _currBox addMagazineCargoGlobal ["HandGrenade",100];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_GP25",150];
        _currBox addMagazineCargoGlobal ["1Rnd_SMOKE_GP25",150];
          _currBox addMagazineCargoGlobal ["20rnd_762x51_B_SCAR",175];
		_currBox addMagazineCargoGlobal ["20rnd_762x51_SB_SCAR",175];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",150];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",60];
		_currBox addMagazineCargoGlobal ["1Rnd_SmokeRed_M203",20];
		_currBox addMagazineCargoGlobal ["FlareWhite_M203",20];
		_currBox addMagazineCargoGlobal ["FlareRed_M203",20];
        _currBox addMagazineCargoGlobal ["6Rnd_HE_M203",40];
		_currBox addMagazineCargoGlobal ["6Rnd_Smoke_M203",40];
		_currBox addMagazineCargoGlobal ["6Rnd_FlareWhite_M203",20];
		_currBox addMagazineCargoGlobal ["6Rnd_FlareRed_M203",20];
		_currBox addMagazineCargoGlobal ["6Rnd_SmokeRed_M203",20];
    };
    case "basicRU2": { // More Ak's and some shotguns and other crap
    	_currBox = createVehicle ["RUBasicWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["AK_47_M",16];
		_currBox addWeaponCargoGlobal ["AK_74",8];
		_currBox addWeaponCargoGlobal ["Saiga12K",16];
		_currBox addWeaponCargoGlobal ["Makarov",32];
                  _currBox addWeaponCargoGlobal ["M249_TWS_EP1",8];
		_currBox addWeaponCargoGlobal ["SCAR_L_STD_EGLM_TWS",12];
		_currBox addWeaponCargoGlobal ["M110_TWS_EP1",8];
		_currBox addWeaponCargoGlobal ["SCAR_H_STD_TWS_SD",8];
		_currBox addWeaponCargoGlobal ["BAF_AS50_TWS",8];
		_currBox addWeaponCargoGlobal ["Binocular_Vector",8];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_545x39_AK",60];
        _currBox addMagazineCargoGlobal ["30Rnd_762x39_AK47",65];
        _currBox addMagazineCargoGlobal ["8Rnd_9x18_Makarov",64];
        _currBox addMagazineCargoGlobal ["HandGrenade",20];
        _currBox addMagazineCargoGlobal ["8Rnd_B_Saiga12_74Slug",75];
        _currBox addMagazineCargoGlobal ["8Rnd_B_Saiga12_Pellets",75];
          _currBox addMagazineCargoGlobal ["200Rnd_556x45_M249",60];
		_currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",80];
        _currBox addMagazineCargoGlobal ["20rnd_762x51_B_SCAR",60];
        _currBox addMagazineCargoGlobal ["20rnd_762x51_SB_SCAR",40];
		_currBox addMagazineCargoGlobal ["10Rnd_127x99_m107",40];
        _currBox addMagazineCargoGlobal ["5Rnd_127x99_as50",60];
    };
    case "basicGER": { // G36's everywhere...
    	_currBox = createVehicle ["GERBasicWeapons_EP1", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["G36C",20];
		_currBox addWeaponCargoGlobal ["G36_C_SD_eotech",20];
		_currBox addWeaponCargoGlobal ["G36a",20];
		_currBox addWeaponCargoGlobal ["M9",20];	
                  _currBox addWeaponCargoGlobal ["AKS_74_kobra",20];
		_currBox addWeaponCargoGlobal ["AK_107_GL_pso",20];
		_currBox addWeaponCargoGlobal ["Sa58V_RCO_EP1",20];
		_currBox addWeaponCargoGlobal ["AK_74_GL_kobra",20];
		_currBox addWeaponCargoGlobal ["AKS_74_GOSHAWK",20];	
		_currBox addWeaponCargoGlobal ["AKS_74_NSPU",20];
		_currBox addWeaponCargoGlobal ["Sa61_EP1",20];
		_currBox addWeaponCargoGlobal ["MetisLauncher",20];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_G36",80];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_G36SD",80];
        _currBox addMagazineCargoGlobal ["15Rnd_9x19_M9",80];
        _currBox addMagazineCargoGlobal ["HandGrenade",80];
             _currBox addMagazineCargoGlobal ["30Rnd_545x39_AK",300];
        _currBox addMagazineCargoGlobal ["30Rnd_762x39_SA58",50];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_GP25",80];
        _currBox addMagazineCargoGlobal ["1Rnd_SMOKE_GP25",80];
        _currBox addMagazineCargoGlobal ["20Rnd_B_765x17_Ball",80];
		_currBox addMagazineCargoGlobal ["HandGrenade",20];
		_currBox addMagazineCargoGlobal ["AT13",30];
		_currBox addMagazineCargoGlobal ["SmokeShell",20];
		_currBox addMagazineCargoGlobal ["SmokeShellPurple",20];
		_currBox addMagazineCargoGlobal ["SmokeShellGreen",20];
    };
    case "basicPMC": { // Most OP weapons in the game, this will be a saught after crate.
    	_currBox = createVehicle ["Ammobox_PMC", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["M8_carbine",20];
		_currBox addWeaponCargoGlobal ["M8_carbineGL",20];
		_currBox addWeaponCargoGlobal ["AA12_PMC",20];
		_currBox addWeaponCargoGlobal ["M9",20];	
                 _currBox addWeaponCargoGlobal ["RPG7V",20];
		_currBox addWeaponCargoGlobal ["RPK_74",20];
		_currBox addWeaponCargoGlobal ["SVD",20];
		_currBox addWeaponCargoGlobal ["VSS_Vintorez",20];	
		_currBox addWeaponCargoGlobal ["Saiga12K",20];	
		_currBox addWeaponCargoGlobal ["Huntingrifle",20];	
		_currBox addWeaponCargoGlobal ["MakarovSD",20];	
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",100];
        _currBox addMagazineCargoGlobal ["20Rnd_B_AA12_Pellets",50];
        _currBox addMagazineCargoGlobal ["20Rnd_B_AA12_74Slug",50];
        _currBox addMagazineCargoGlobal ["20Rnd_B_AA12_HE",16];
        _currBox addMagazineCargoGlobal ["15Rnd_9x19_M9",50];
        _currBox addMagazineCargoGlobal ["HandGrenade",40];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",40];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",40];
          _currBox addMagazineCargoGlobal ["PG7V",45];
        _currBox addMagazineCargoGlobal ["PG7VR",30];
        _currBox addMagazineCargoGlobal ["PG7VL",30];
        _currBox addMagazineCargoGlobal ["75Rnd_545x39_RPK",60];
        _currBox addMagazineCargoGlobal ["10Rnd_762x54_SVD",60];
        _currBox addMagazineCargoGlobal ["20Rnd_9x39_SP5_VSS",60];
        _currBox addMagazineCargoGlobal ["8Rnd_B_Saiga12_74Slug",60];
		_currBox addMagazineCargoGlobal ["5x_22_LR_17_HMR",60];
        _currBox addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD",100];
    };
    case "basicSpecial": { // Silent weapons
    	_currBox = createVehicle ["SpecialWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["m8_compact_pmc",20];
		_currBox addWeaponCargoGlobal ["M4A1_AIM_SD_camo",20];
        _currBox addWeaponCargoGlobal ["m8_sharpshooter",20];
		_currBox addWeaponCargoGlobal ["M9SD",20];	
                 _currBox addWeaponCargoGlobal ["KSVK",20];
		_currBox addWeaponCargoGlobal ["SVD_CAMO",20];
        _currBox addWeaponCargoGlobal ["SVD_NSPU_EP1",12];
		_currBox addWeaponCargoGlobal ["Pecheneg",8];
		_currBox addWeaponCargoGlobal ["MetisLauncher",8];	
		_currBox addWeaponCargoGlobal ["AKS_GOLD",16];	
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",55];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",55];
        _currBox addMagazineCargoGlobal ["15Rnd_9x19_M9SD",60];
          _currBox addMagazineCargoGlobal ["5Rnd_127x108_KSVK",65];
        _currBox addMagazineCargoGlobal ["10Rnd_762x54_SVD",75];
        _currBox addMagazineCargoGlobal ["100Rnd_762x54_PK",60];
		_currBox addMagazineCargoGlobal ["AT13",40];
		_currBox addMagazineCargoGlobal ["30Rnd_762x39_AK47",100];
		_currBox addMagazineCargoGlobal ["SmokeShell",20];
		_currBox addMagazineCargoGlobal ["SmokeShellOrange",20];
		_currBox addMagazineCargoGlobal ["SmokeShellYellow",20];
    };
    case "basicSpecial2": { // BAF weapons
    	_currBox = createVehicle ["SpecialWeaponsBox", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["BAF_L85A2_RIS_CWS",8];
		_currBox addWeaponCargoGlobal ["BAF_L86A2_ACOG",8];
		_currBox addWeaponCargoGlobal ["BAF_L85A2_UGL_Holo",8];
        _currBox addWeaponCargoGlobal ["BAF_LRR_scoped",4];
		_currBox addWeaponCargoGlobal ["M9",16];	
                 _currBox addWeaponCargoGlobal ["BAF_AS50_scoped",8];
		_currBox addWeaponCargoGlobal ["M4A1_HWS_GL_SD_Camo",8];
		_currBox addWeaponCargoGlobal ["M4A3_RCO_GL_EP1",8];
		_currBox addWeaponCargoGlobal ["M40A3",8];
        _currBox addWeaponCargoGlobal ["SCAR_H_STD_EGLM_Spect",12];
		_currBox addWeaponCargoGlobal ["SCAR_H_LNG_Sniper_SD",12];
		_currBox addWeaponCargoGlobal ["M249_m145_EP1",8];	
		_currBox addWeaponCargoGlobal ["Mk_48",8];
		_currBox addWeaponCargoGlobal ["Binocular_Vector",8];	
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",100];
        _currBox addMagazineCargoGlobal ["5Rnd_86x70_L115A1",16];
        _currBox addMagazineCargoGlobal ["15Rnd_9x19_M9",75];
        _currBox addMagazineCargoGlobal ["BAF_L109A1_HE",30];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",30];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",30];
         _currBox addMagazineCargoGlobal ["5Rnd_127x99_as50",90];
		_currBox addMagazineCargoGlobal ["10Rnd_127x99_m107",60];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",90];
		_currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",90];
        _currBox addMagazineCargoGlobal ["5Rnd_762x51_M24",60];
        _currBox addMagazineCargoGlobal ["20rnd_762x51_B_SCAR",90];
		_currBox addMagazineCargoGlobal ["20rnd_762x51_SB_SCAR",60];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",60];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",60];
		_currBox addMagazineCargoGlobal ["200Rnd_556x45_M249",60];
		_currBox addMagazineCargoGlobal ["100Rnd_762x51_M240",60];
		_currBox addMagazineCargoGlobal ["PipeBomb",30];
    };
    case "basicSpecial3": { // Misc weapons, mostly shit
    	_currBox = createVehicle ["TKBasicWeapons_EP1", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["AK_47_S",9];
		_currBox addWeaponCargoGlobal ["LeeEnfield",9];
		_currBox addWeaponCargoGlobal ["FN_FAL",9];
        _currBox addWeaponCargoGlobal ["VSS_Vintorez",3];
		_currBox addWeaponCargoGlobal ["revolver_EP1",24];	 
        _currBox addWeaponCargoGlobal ["revolver_gold_EP1",8];
          _currBox addWeaponCargoGlobal ["Javelin",8];
		_currBox addWeaponCargoGlobal ["M136",8];
		_currBox addWeaponCargoGlobal ["SMAW",12];
        _currBox addWeaponCargoGlobal ["Stinger",8];
		_currBox addWeaponCargoGlobal ["MAAWS",8];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_762x39_AK47",100];
        _currBox addMagazineCargoGlobal ["6Rnd_45ACP",75];
        _currBox addMagazineCargoGlobal ["HandGrenade",15];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_FNFAL",95];
        _currBox addMagazineCargoGlobal ["10x_303",150];
        _currBox addMagazineCargoGlobal ["10Rnd_9x39_SP5_VSS",30];
           _currBox addMagazineCargoGlobal ["Javelin",30];
        _currBox addMagazineCargoGlobal ["M136",30];
        _currBox addMagazineCargoGlobal ["SMAW_HEAA",30];
        _currBox addMagazineCargoGlobal ["SMAW_HEDP",30];
        _currBox addMagazineCargoGlobal ["Stinger",30];
		_currBox addMagazineCargoGlobal ["MAAWS_HEAT",15];
		_currBox addMagazineCargoGlobal ["MAAWS_HEDP",15];
    };
    case "mission_Mid_BAF": { // Broad selection mid-high tier weapons 
    	_currBox = createVehicle ["BAF_BasicWeapons", _selectedBoxPos,[], 30, "NONE"];
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["M8_SAW",8];
		_currBox addWeaponCargoGlobal ["M8_carbine",12];
		_currBox addWeaponCargoGlobal ["M8_carbineGL",12];
        _currBox addWeaponCargoGlobal ["M8_compact",8];
		_currBox addWeaponCargoGlobal ["M8_sharpshooter",8];	 
        _currBox addWeaponCargoGlobal ["m8_tws",8];
		_currBox addWeaponCargoGlobal ["m8_tws_sd",8];
		_currBox addWeaponCargoGlobal ["NVgoggles",8];
		_currBox addWeaponCargoGlobal ["Binocular_Vector",8];
         _currBox addWeaponCargoGlobal ["MG36",8];
		_currBox addWeaponCargoGlobal ["G36C",12];
		_currBox addWeaponCargoGlobal ["G36K",8];
        _currBox addWeaponCargoGlobal ["MG36_camo",8];
		_currBox addWeaponCargoGlobal ["G36K_camo",8];	 
        _currBox addWeaponCargoGlobal ["G36_C_SD_camo",12];
        // Add ammunition
      _currBox addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",150];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",300];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",150];
		_currBox addMagazineCargoGlobal ["1Rnd_HE_M203",90];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",90];
          _currBox addMagazineCargoGlobal ["100Rnd_556x45_BetaCMag",100];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_G36",175];
        _currBox addMagazineCargoGlobal ["HandGrenade",40];
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_G36SD",90];
		_currBox addMagazineCargoGlobal ["Mine",30];
		_currBox addMagazineCargoGlobal ["SmokeShell",30];
		_currBox addMagazineCargoGlobal ["SmokeShellRed",30];
		_currBox addMagazineCargoGlobal ["SmokeShellGreen",30];
    };
    };
