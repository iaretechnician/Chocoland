#include "setup.sqf"
if(!X_Server) exitWith {};

diag_log format["WASTELAND SERVER - Initilizing Server Vars"];

CVG_weapons = [];
CVG_weapons = CVG_rifles;
CVG_weapons = CVG_weapons + CVG_Scoped;
CVG_weapons = CVG_weapons + CVG_Heavy;
CVG_weapons = CVG_weapons + CVG_pistols;
CVG_weapons = CVG_weapons + CVG_Launchers;

#ifdef __A2NET__
missionStartTime = 0;
netTime = 0;
#endif

sideMissionPos = "";
mainMissionPos = "";

currentVehicles = [];
publicVariable "currentVehicles";
pvar_teamSwitchList = [];
publicVariable "pvar_teamSwitchList";
pvar_teamKillList = [];
publicVariable "pvar_teamKillList";
pvar_beaconListBlu = []; 
publicVariable "pvar_beaconListBlu";
pvar_beaconListRed = []; 
publicVariable "pvar_beaconListRed";
clientMissionMarkers = [];
publicVariable "clientMissionMarkers";
clientRadarMarkers = [];
publicVariable "clientRadarMarkers";
currentDate = [];
publicVariable "currentDate";
currentInvites = [];
publicVariable "currentInvites";
                  
"PlayerCDeath" addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerDied};

currentStaticHelis = []; // Storage for the heli marker numbers so that we don't spawn wrecks on top of live helis

//Civilian Vehicle List - Random Spawns
civilianVehicles = ["HMMWV",                                   
                    "UAZ_CDF",
					"UAZ_RU",
					"LandRover_TK_CIV_EP1",
					"UAZ_Unarmed_TK_CIV_EP1",
                    "Ural_INS",
                    "SUV_TK_EP1",
                    "V3S_Open_TK_EP1",								
					"LandRover_CZ_EP1",
					"V3S_TK_GUE_EP1",
					"UralOpen_CDF",									
					"LandRover_Special_CZ_EP1",
					"Old_moto_TK_Civ_EP1",
					"ATV_CZ_EP1",								
					"M1030_US_DES_EP1",	
					"Lada2_TK_CIV_EP1",
					"SUV_PMC",								
					"S1203_TK_CIV_EP1", 
					"TT650_TK_CIV_EP1",
					"Volha_1_TK_CIV_EP1", 
					"Lada1",
					"Skoda",  
					"TT650_Gue", 
					"car_hatchback", 
					"datsun1_civil_1_open", 
					"datsun1_civil_2_covered", 
					"hilux1_civil_2_covered",
					"hilux1_civil_1_open",	
                    "Pickup_PK_GUE",
					"UralCivil",
					"SkodaGreen",
					"VWGolf",
					"BAF_Offroad_W",
					"MtvrReammo",
					"MtvrRefuel",
					"MtvrRepair"];

//Military Vehicle List - Random Spawns
militaryVehicles = [ "BTR40_MG_TK_INS_EP1",
					"BAF_Jackal2_GMG_W",
					"BAF_Jackal2_L2A1_D",
					"BAF_Jackal2_GMG_W",
					"BAF_Jackal2_L2A1_D",
					"ArmoredSUV_PMC",
					"Offroad_DSHKM_Ins",
					"UAZ_MG_INS",
					"Pickup_PK_TK_GUE_EP1",
					"UAZ_SPG9_INS",
					"UAZ_AGS30_RU",
					"Offroad_SPG9_TK_GUE_EP1",
					"LandRover_MG_TK_INS_EP1",
					"LandRover_SPG9_TK_EP1",
					"HMMWV_MK19",
					"HMMWV_M2",
					"HMMWV_Armored",
					"HMMWV_TOW",
					"HMMWV_Ambulance",
					"HMMWV_M998A2_SOV_DES_EP1",
					"MtvrReammo",
					"MtvrRefuel",
					"MtvrRepair"];

//Armed Military Vehicle List - Random Spawns
armedMilitaryVehicles = ["GAZ_Vodnik", "UAZ_MG_TK_EP1","LandRover_MG_TK_INS_EP1"
];

//Item Config
pickupList = ["Satelit",
				"EvMoney",
				"Suitcase",
				"Fuel_can"];

//Object List - Random Spawns.
objectList = [	"EvMoney","Land_Barrel_water",
				"Land_prebehlavka",
				"Land_leseni2x",
                "Fort_Crate_wood",
                "Land_CamoNet_NATO",
				"Land_Barrel_water",
				"Land_stand_small_EP1",
                "Land_stand_small_EP1",
				"Base_WarfareBBarrier10xTall",
				"Base_WarfareBBarrier10x",
				"Base_WarfareBBarrier5x",
                "Base_WarfareBBarrier10xTall",
                "Base_WarfareBBarrier10x",
                "Base_WarfareBBarrier5x",
				"Land_Misc_deerstand",
				"Fort_Barricade",
				"Concrete_Wall_EP1",
                "Concrete_Wall_EP1",
                "Land_fort_bagfence_long",
                "Land_fort_bagfence_long",
                "Land_fort_bagfence_round",
                "Land_fort_bagfence_corner",
                "Land_BagFenceLong",
                "Land_BagFenceLong",
                "Land_fort_artillery_nest",
				"Land_fortified_nest_small_EP1",
				"Land_Misc_deerstand",
                "Land_fort_rampart",
                "Land_fort_rampart_EP1",
				"Land_HBarrier_large",
                "Land_HBarrier_large",
				"Land_Misc_Scaffolding",
				"Land_Fort_Watchtower_EP1",
                "Land_Fort_Watchtower",
				"Land_fortified_nest_big",
				"RampConcrete",
				"WarfareBDepot",
				"WarfareBCamp",
                "Hedgehog",
                "Land_ConcreteRamp",
                "Land_CncBlock_Stripes",
                "Land_Campfire_burning",
                "Land_GuardShed",
                "Land_tent_east",
				"Land_ConcreteBlock",
                            "TOW_TriPod_US_EP1",
                            "MASH",
                            "Land_CamoNet_NATO",
                            "Land_tent_east"];
                                         
//Object List - Random Spawns.
staticWeaponsList = ["M2StaticMG_US_EP1",
				"DSHKM_TK_INS_EP1",
                "BAF_L2A1_Tripod_D",
				"MK19_TriPod",
				"KORD_high"];

//Object List - Random Helis.
staticHeliList = [];

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons = ["AK_107_GL_kobra",
				"AK_107_kobra",
				"M4SPR",
				"FN_FAL_ANPVS4",
				"SMAW",
				"Strela",
				"M110_NVG_EP1",
				"BAF_L110A1_Aim",
				"BAF_L7A2_GPMG",
				"BAF_L85A2_RIS_ACOG",
				"M32_EP1",
				"MP5SD",
				"G36_C_SD_camo",
				"M4A3_RCO_GL_EP1",
				"SCAR_L_STD_Mk4CQT",
				"Saiga12K",
				"M8_SAW",
				"M8_compact",
				"DMR",
				"M8_sharpshooter",
				
				"M24_des_EP1",
				
				"UZI_SD_EP1",
				"Huntingrifle",
				"M40A3",
				"M4A1_HWS_GL_camo",
				"BAF_LRR_scoped_W",
				"G36_C_SD_eotech",
				
				"MakarovSD",
				"M4A1_HWS_GL_SD_Camo",
				"M14_EP1",
				"SCAR_H_LNG_Sniper_SD",
				"M4A3_RCO_GL_EP1",
				"M240",
				"M249",
				"M4A1_RCO_GL",
				"M4A1_HWS_GL",
				"M4A3_CCO_EP1",
				"M60A4_EP1",
				"m8_carbine",
				"MG36",
				"Mk_48",
				"SCAR_L_STD_EGLM_RCO",
				"M249_TWS_EP1",
				"SCAR_L_CQC_EGLM_Holo",
				"SCAR_H_STD_EGLM_Spect",
				"SCAR_H_CQC_CCO",
				"bizon_silenced"
                                
                              ];
                
MissionSpawnMarkers = [
            ["Mission_1",false],
            ["Mission_2",false],
            ["Mission_3",false],
            ["Mission_4",false],
            ["Mission_5",false],
            ["Mission_6",false],
            ["Mission_7",false],
            ["Mission_8",false],
            ["Mission_9",false],
            ["Mission_10",false],
            ["Mission_11",false],
            ["Mission_12",false],
            ["Mission_13",false],
            ["Mission_14",false],
            ["Mission_15",false],
            ["Mission_16",false],
            ["Mission_17",false],
            ["Mission_18",false],
            ["Mission_19",false],
            ["Mission_20",false]
  
];