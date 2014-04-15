//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat
//	@file Created: 22/1/2012 00:00
//	@file Args: [ OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]
if (!isServer) exitWith {};
private ["_selectedBox", "_selectedBoxPos", "_finishedBox", "_currBox"];

_box = _this select 0;
_selectedBox = _this select 1;

switch(_selectedBox) do {
    case "mission_Mid_BAF": { // Broad selection of mid-high tier weapons 
    	_currBox = _box;
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
        _currBox addWeaponCargoGlobal ["BAF_LRR_scoped",1];
        _currBox addWeaponCargoGlobal ["SVD_CAMO",20];
		_currBox addWeaponCargoGlobal ["M14_EP1",20];			
		_currBox addWeaponCargoGlobal ["BAF_L7A2_GPMG",20];
        _currBox addWeaponCargoGlobal ["BAF_L110A1_Aim",20];
		_currBox addWeaponCargoGlobal ["BAF_L85A2_RIS_CWS",1];
        _currBox addWeaponCargoGlobal ["BAF_L85A2_RIS_Holo",20];
        _currBox addWeaponCargoGlobal ["BAF_L85A2_UGL_Holo",20];		
		_currBox addWeaponCargoGlobal ["FN_FAL_ANPVS4",20];
		_currBox addWeaponCargoGlobal ["M9",20];	 
        _currBox addWeaponCargoGlobal ["M9SD",20];
        
        // Add ammunition
        _currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",100];
        _currBox addMagazineCargoGlobal ["5Rnd_86x70_L115A1",50];
        _currBox addMagazineCargoGlobal ["15Rnd_9x19_M9",50];
		_currBox addMagazineCargoGlobal ["15Rnd_9x19_M9SD",100];
        _currBox addMagazineCargoGlobal ["100Rnd_762x51_M240",50];
        _currBox addMagazineCargoGlobal ["1Rnd_HE_M203",50];
        _currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",50];
        _currBox addMagazineCargoGlobal ["6Rnd_45ACP",50];
        _currBox addMagazineCargoGlobal ["HandGrenade",40];
		_currBox addMagazineCargoGlobal ["200Rnd_556x45_L110A1",80];
        _currBox addMagazineCargoGlobal ["5Rnd_86x70_L115A1",50];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_DMR",100];
        _currBox addMagazineCargoGlobal ["20Rnd_762x51_FNFAL",150];
		_currBox addMagazineCargoGlobal ["10Rnd_762x54_SVD",80]; 		
    };
    case "mission_Side_USLaunchers": { // Used in the airwreck side mission
    	_currBox = _box;

        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;

		// Add new weapons before ammunition
		_currBox addWeaponCargoGlobal ["RPG7V",20];
		_currBox addWeaponCargoGlobal ["M32_EP1",20];
                _currBox addWeaponCargoGlobal ["M9SD",20];
		_currBox addWeaponCargoGlobal ["MakarovSD",20];
                _currBox addWeaponCargoGlobal ["Binocular_Vector",10];
		_currBox addWeaponCargoGlobal ["NVGoggles",5];
		_currBox addWeaponCargoGlobal ["Binocular",5];
		// Add ammunition
                _currBox addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD",100];
                _currBox addMagazineCargoGlobal ["15Rnd_9x19_M9SD",100];
		_currBox addMagazineCargoGlobal ["6Rnd_HE_M203",50];
		_currBox addMagazineCargoGlobal ["PG7VR",30];
        _currBox addMagazineCargoGlobal ["PG7V",30];
		_currBox addMagazineCargoGlobal ["SMAW_HEDP",30];
       		_currBox addMagazineCargoGlobal ["HandGrenade",100];
		_currBox addMagazineCargoGlobal ["Mine",50];
    };
    case "mission_Side_USSpecial": { // Used in the airwreck side mission
    	_currBox = _box;
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
		_currBox addWeaponCargoGlobal ["M4A1_AIM_SD_CAMO",20];
		_currBox addWeaponCargoGlobal ["M4A1_HWS_GL_CAMO",20];
		_currBox addWeaponCargoGlobal ["DMR",20];
		_currBox addWeaponCargoGlobal ["M24",20];
		_currBox addWeaponCargoGlobal ["M9",20];
		_currBox addWeaponCargoGlobal ["M9SD",20];
		_currBox addWeaponCargoGlobal ["MakarovSD",20];

		_currBox addWeaponCargoGlobal ["Binocular_Vector",10];
		_currBox addWeaponCargoGlobal ["NVGoggles",5];
		_currBox addWeaponCargoGlobal ["Binocular",5];

		_currBox addMagazineCargoGlobal ["15Rnd_9x19_M9",100];
		_currBox addMagazineCargoGlobal ["15Rnd_9x19_M9SD",100];
		_currBox addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD",100];
		_currBox addMagazineCargoGlobal ["1Rnd_HE_M203",50];
		_currBox addMagazineCargoGlobal ["FlareRed_M203",50];
		_currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",50];
		_currBox addMagazineCargoGlobal ["FlareGreen_M203",50];
		_currBox addMagazineCargoGlobal ["HandGrenade",50];
		_currBox addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",100];
		_currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",100];
		_currBox addMagazineCargoGlobal ["20Rnd_762x51_DMR",50];
		_currBox addMagazineCargoGlobal ["5Rnd_762x51_M24",50];			
    };
};