//	@file Version: 1.0
//	@file Name: serverVars.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [404] Pulse
//	@file Created: 20/11/2012 05:19
//	@file Args:
// --------------------------------------------------------------------------------------------------- \\
// ----------  !DO NOT CHANGE ANYTHING BELOW THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING!	---------- \\
// ----------																				---------- \\
// ----------			404Games are not responsible for anything that may happen 			---------- \\
// ----------			 as a result of unauthorised modifications to this file.			---------- \\
// --------------------------------------------------------------------------------------------------- \\
#include "setup.sqf"
if(!X_Server) exitWith {};

diag_log format["WASTELAND SERVER - Initilizing Server Vars"];

CVG_weapons = [];
CVG_weapons = CVG_rifles;
CVG_weapons = CVG_weapons + CVG_Scoped;
CVG_weapons = CVG_weapons + CVG_Heavy;
CVG_weapons = CVG_weapons + CVG_pistols;
CVG_weapons = CVG_weapons + CVG_Launchers;

/*#ifdef __A2NET__
missionStartTime = 0;
netTime = 0;
#endif*/

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

currentStaticHelis = [];

//Civilian Vehicle List - Random Spawns
civilianVehicles = ["car_hatchback",
                                        "HMMWV_Ambulance",
					"car_sedan",
					"datsun1_civil_2_covered",
					"SkodaGreen",
					"Lada2",
                                       "TT650_Ins",
                                       "hilux1_civil_3_open",
					"V3S_Civ",
					"UralCivil",
					"VWGolf",
					"MMT_Civ",
					"Ikarus_TK_CIV_EP1",
					"Lada1_TK_CIV_EP1",
					"Old_moto_TK_Civ_EP1",
					"S1203_TK_CIV_EP1",
					"UAZ_Unarmed_TK_CIV_EP1",
					"BAF_Offroad_W",
					"S1203_ambulance_EP1"];

//Military Vehicle List - Random Spawns
militaryVehicles = ["UAZ_CDF",
"HMMWV_TOW",
"SUV_PMC",
"MTVR",
"BAF_Offroad_W",
"HMMWV",
"HMMWV_Ambulance",
"S1203_ambulance_EP1",
"GAZ_Vodnik_MedEvac"];

//Armed Military Vehicle List - Random Spawns
armedMilitaryVehicles = ["ArmoredSUV_PMC",
							"Pickup_PK_GUE",
							"UAZ_MG_TK_EP1",
							"LandRover_MG_TK_INS_EP1",
							"HMMWV_M2",
							"HMMWV_Armored",
							"HMMWV_MK19",
							"HMMWV_TOW",
							"GAZ_Vodnik"
                                                        ];

//Item Config
pickupList = ["Satelit",
				"EvMoney",
				"Suitcase",
				"Fuel_can"];

//Object List - Random Spawns.
objectList = ["Land_Barrel_water",
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
				"WarfareBCamp",
                "Hedgehog",
                "Land_ConcreteRamp",
                "Land_CncBlock_Stripes",
                "Land_Campfire_burning",
                "Land_GuardShed",
                "Land_tent_east",
				"Land_ConcreteBlock"];
                                         
//Object List - Random Spawns.
staticWeaponsList = ["M2StaticMG_US_EP1",
				"DSHKM_TK_INS_EP1"];

//Object List - Random Helis.
staticHeliList = [];

vehicleWeapons = ["m240_scoped_EP1",
			        "M14_EP1",
                                "UZI_SD_EP1",
				"BAF_L85A2_RIS_ACOG",
				"bizon",
                                "MG36_camo",
				"bizon_silenced",
				"FN_FAL",
                                "BAF_L110A1_Aim",
				"G36a",
                                "m8_holo_sd",
				"LeeEnfield",
                                "m8_sharpshooter",
                                "M24",
				"M16A2",
                                "M249",
				"m16a4",
                                "RPG7V",
				"M4A1_Aim",
                                "SCAR_L_CQC_CCO_SD",
                                "M4A1_RCO_GL",
                                "G36C_camo",
				"SCAR_L_CQC",
                                "BAF_L85A2_RIS_Holo",
                                "SCAR_H_STD_EGLM_Spect",
                                "M32_EP1"
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
CarrierMarkers = [
[carrier_1, false],
[carrier_2, false],
[carrier_3, false],
[carrier_4, false],
[carrier_5, false],
[carrier_6, false],
[carrier_7, false],
[carrier_8, false]
];