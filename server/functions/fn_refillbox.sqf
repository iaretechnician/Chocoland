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
    case "mission_Side_USLaunchers": { // Used in the airwreck side mission
    	_currBox = _box;

        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;

		// Add new weapons before ammunition
		_currBox addWeaponCargoGlobal ["RPG7V",2];
		_currBox addWeaponCargoGlobal ["SMAW",2];
		_currBox addWeaponCargoGlobal ["M79_EP1",3];
		// Add ammunition
		_currBox addMagazineCargoGlobal ["1Rnd_HE_M203",25];
		_currBox addMagazineCargoGlobal ["PG7V",10];
		_currBox addMagazineCargoGlobal ["SMAW_HEAA",10];
		_currBox addMagazineCargoGlobal ["HandGrenade",10];
		_currBox addMagazineCargoGlobal ["Mine",4];
    };
    case "mission_Side_USSpecial": { // Used in the airwreck side mission
    	_currBox = _box;
        
        // Clear prexisting weapons first
        clearMagazineCargoGlobal _currBox;
		clearWeaponCargoGlobal _currBox;
        
        // Add new weapons before ammunition
		_currBox addWeaponCargoGlobal ["M4A1_AIM_SD_CAMO",2];
		_currBox addWeaponCargoGlobal ["M4A1_HWS_GL_CAMO",2];
		_currBox addWeaponCargoGlobal ["DMR",2];
		_currBox addWeaponCargoGlobal ["M24",2];
		_currBox addWeaponCargoGlobal ["M9",2];
		_currBox addWeaponCargoGlobal ["M9SD",2];
		_currBox addWeaponCargoGlobal ["MakarovSD",2];

		_currBox addWeaponCargoGlobal ["Binocular_Vector",1];
		_currBox addWeaponCargoGlobal ["NVGoggles",5];
		_currBox addWeaponCargoGlobal ["Binocular",5];

		_currBox addMagazineCargoGlobal ["15Rnd_9x19_M9",10];
		_currBox addMagazineCargoGlobal ["15Rnd_9x19_M9SD",10];
		_currBox addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD",10];
		_currBox addMagazineCargoGlobal ["1Rnd_HE_M203",20];
		_currBox addMagazineCargoGlobal ["FlareRed_M203",20];
		_currBox addMagazineCargoGlobal ["1Rnd_Smoke_M203",20];
		_currBox addMagazineCargoGlobal ["FlareGreen_M203",20];
		_currBox addMagazineCargoGlobal ["HandGrenade",15];
		_currBox addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",20];
		_currBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",50];
		_currBox addMagazineCargoGlobal ["20Rnd_762x51_DMR",15];
		_currBox addMagazineCargoGlobal ["5Rnd_762x51_M24",15];			
    };
};