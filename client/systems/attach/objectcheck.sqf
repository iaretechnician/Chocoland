
_obj =cursortarget;

_switch = _this select 0;
_array = ["Misc_cargo_cont_tiny","TK_GUE_WarfareBUAVterminal_EP1","USMC_WarfareBAircraftFactory"
,"AH6X_EP1", "MV22","An2_1_TK_Civ_EP1","UH60M_MEV_EP1","Mi17_medevac_RU","MH60S","BAF_Merlin_HC3_D","UH1H_TK_EP1", "Pchela1T"
,"Chukar_EP1","UH60M_EP1","CH_47F_EP1", "C130J","AH6J_EP1","AW159_Lynx_BAF","Ka60_PMC","UH1Y","L39_TK_EP1","Mi24_D","AH64D_EP1"
,"BAF_Apache_AH1_D","AH1Z","AV8B","AV8B2","Ka52","Su34","F35B","Su25_CDF","Su39","A10","Old_bike_TK_INS_EP1","ATV_Base_EP1","MMT_USMC","Kamaz"
,"TowingTractor","HMMWV_DES_EP1","Offroad_DSHKM_Gue","SUV_UN_EP1","UAZ_AGS30_TK_EP1","Ikarus_TK_CIV_EP1","HMMWV_Armored","M113Ambul_UN_EP1"
,"M113Ambul_UN_EP1","PBX","SeaFox","Smallboat_1","Smallboat_2","Zodiac","RHIB2Turret","HMMWV_M2","BTR40_MG_TK_INS_EP1","UAZ_SPG9_INS","HMMWV_M1151_M2_CZ_DES_EP1"
,"LandRover_Special_CZ_EP1","ArmoredSUV_PMC","UralRepair_TK_EP1","HMMWV_TOW","BAF_Jackal2_L2A1_D","GAZ_Vodnik","KamazRefuel","HMMWV_Avenger"
,"GAZ_Vodnik_HMG","M113_UN_EP1","BRDM2_ATGM_CDF","Ural_ZU23_CDF","LAV25","M1135_ATGMV_EP1","M1128_MGS_EP1","AAV","BTR90","T34","M6_EP1","M2A3_EP1"
,"T55_TK_GUE_EP1","2S6M_Tunguska","BMP2_CDF","BMP3","T72_RU","M1A1","T90","BAF_FV510_W","M1A2_TUSK_MG","SearchLight_TK_EP1","WarfareBMGNest_PK_TK_EP1"
,"Fort_Nest_M240","DSHkM_Mini_TriPod_TK_EP1","DSHKM_TK_GUE_EP1","KORD_TK_EP1","KORD_high_TK_EP1","BAF_GPMG_Minitripod_D","M2HD_mini_TriPod"
,"M2StaticMG","BAF_L2A1_Minitripod_D","BAF_L2A1_Tripod_D","MK19_TriPod","AGS_TK_EP1","SPG9_TK_GUE_EP1","ZU23_Ins","Igla_AA_pod_TK_EP1","Stinger_Pod_US_EP1"
,"BAF_GMG_Tripod_D", "M252"];

if(isnil "_objl" || !_objl)exitwith{player globalchat"you cannot Attach this object";};
if(isplayer _obj || !(typeof _obj in _array))exitwith{player globalchat"you cannot Attach this object";};
switch (_switch) do
{ 
 case 1:{
     if(player distance _obj <= 20)then{object1 = _obj;player globalchat"Main Object defined."
    }else{player globalchat"you are to far away";};
};
 case 2:{
     if(player distance _obj <= 20)then{object2 = _obj;player globalchat"object 2 defined."
    }else{player globalchat"you are to far away";};
};
};