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
pvar_beaconListInd = [];
publicVariable "pvar_beaconListInd";
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
civilianVehicles = ["car_hatchback","HMMWV_Ambulance","car_sedan","datsun1_civil_2_covered","SkodaGreen","Lada2","TT650_Ins",
"hilux1_civil_3_open","V3S_Civ","UralCivil","VWGolf","MMT_Civ","Ikarus_TK_CIV_EP1","Lada1_TK_CIV_EP1","Old_moto_TK_Civ_EP1",
"S1203_TK_CIV_EP1","UAZ_Unarmed_TK_CIV_EP1","BAF_Offroad_W","S1203_ambulance_EP1"];

//Military Vehicle List - Random Spawns
militaryVehicles = ["UAZ_CDF","HMMWV_TOW","SUV_PMC","MTVR","BAF_Offroad_W","HMMWV","HMMWV_Ambulance","S1203_ambulance_EP1",
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
objectList = ["Land_Misc_deerstand",
	"Land_fort_artillery_nest",
	"Land_fortified_nest_small_EP1",
	"Land_Misc_deerstand",
         "Land_HBarrier_large",
	"Land_Fort_Watchtower_EP1",
        "Land_Fort_Watchtower",
	"Land_fortified_nest_big",
	"WarfareBCamp",
        "Land_tent_east",
        "CDF_WarfareBFieldhHospital",
        "Fort_RazorWire",
        //repeat
        "Land_fort_artillery_nest",
	"Land_fortified_nest_small_EP1",
	"Land_Misc_deerstand",
         "Land_HBarrier_large",
	"Land_Fort_Watchtower_EP1",
        "Land_Fort_Watchtower",
	"Land_fortified_nest_big",
	"WarfareBCamp",
        "Land_tent_east",
        "CDF_WarfareBFieldhHospital",
        "Fort_RazorWire",
        //erepeat
        "UH1Wreck",
        "T72Wreck",
        "Mi8Wreck",
        "BRDMWreck",
        "TK_GUE_WarfareBFieldhHospital_Base_EP1",
        "Fort_EnvelopeSmall_EP1",
        "ACamp_EP1",
        "Dirtmount_EP1",
        "Land_transport_cart_EP1",
        "Land_transport_crates_EP1",
        "C130J_wreck_EP1",
        "UH60_wreck_EP1",
        "AGS_TK_GUE_EP1",
        "Haystack_small",
        "Fort_Crate_wood",
        "Land_fort_bagfence_round",
        "Fort_Nest_M240",
        "Land_Ind_IlluminantTower",
        "Land_Misc_Cargo1Ao",
        "Land_seno_balik",
        "Land_Market_stalls_02_EP1",
        /// fortified
        "Fort_Barracks_USMC",
        "MediumTentCamp_napa",
        "cityBase04",
        "fuelDepot_us",
        "Land_Fort_Watchtower_EP1",
        "Land_Fort_Watchtower",
	"Land_fortified_nest_big",
			"CDF_WarfareBLightFactory",
                        "BMP2_HQ_CDF_unfolded"];
                                         
//Object List - Random Spawns.
staticWeaponsList = ["M2StaticMG_US_EP1",
"SearchLight_US_EP1",
				"DSHKM_TK_INS_EP1",
                                "Stinger_Pod_US_EP1",
                               "AGS_TK_EP1",
                                "DSHKM_TK_GUE_EP1",
                                "DSHkM_Mini_TriPod_TK_INS_EP1",
                                "Igla_AA_pod_TK_EP1",
                                "KORD_high_UN_EP1",
                                "KORD_TK_EP1",
                                "BAF_L2A1_Tripod_W",
                                "M252_US_EP1",
                                "Metis_TK_EP1",
                                "SPG9_CDF",
                                "TOW_TriPod",
                                "ZU23_TK_INS_EP1",
                                "SearchLight_US_EP1"
                                ];

//Object List - Random Helis.
staticHeliList = [];

vehicleWeapons = [];
                
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