private ["_objs","_randomHeli","_randomSupportVehicle"];

//Create the random helicopter and random support vehicle
_randomHeli = ["UH1Y","AH6J_EP1","AW159_Lynx_BAF","BAF_Apache_AH1_D"] call BIS_fnc_selectRandom;
_randomSupportVehicle = ["MtvrReammo","MtvrRefuel","MtvrRepair"] call BIS_fnc_selectRandom;

_objs =
[

["Land_CamoNet_NATO",[-13.8381,0.698364,15.88],90.0381,1,0,{}],
["Land_fort_bagfence_round",[-16.6677,0.486206,15.88],270.07,1,0,{}],
["BAF_L2A1_Tripod_D",[-15.7815,0.818115,16.88],270.066,1,0,{}],
["Land_ladderEP1",[-18.165,3.12378,2.5],90,1,0,{}],
["Land_ladder_half",[-18.165,3.12378,0.755],90,1,0,{}],
["Land_ladderEP1",[-18.1853,-3.44531,6],90,1,0,{}],
["Land_ladderEP1",[-18.1853,-3.44531,0.25],90,1,0,{}],
["USVehicleBox",[6.65747,-24.2267,16],359.936,1,0,"[this, 'carrierCache'] call fn_refillbox"],
["Land_CamoNetB_NATO",[2.16528,25.463,16],90.0439,1,0,{}],
["Land_ladderEP1",[18.7977,-26.5137,6.2],270,1,0,{}],
["Land_ladderEP1",[18.7977,-26.5137,0.45],270,1,0,{}],
["Land_HBarrier_large",[-16.9617,29.271,15.8],89.9954,1,0,{}],
["Land_HBarrier_large",[-17.6669,-29.0428,16],90.2976,1,0,{}],
["Land_CamoNet_NATO",[-9.80139,-34.8636,15.88],359.726,1,0,{}],
["KORD_high",[-8.4458,-36.0344,17],179.736,1,0,{}],
["Land_fort_bagfence_round",[-8.28699,-37.3901,15.88],179.736,1,0,{}],
["Land_HBarrier_large",[-17.63,-37.5393,16],90.3453,1,0,{}],
["Land_CamoNetB_NATO",[2.18762,41.5305,16],90.0854,1,0,{}],
["Land_HBarrier_large",[-16.9406,37.9352,15.8],270.009,1,0,{}],
["Land_Misc_Cargo2E",[-1.88599,-42.8499,15.95],90.2629,1,0,{}],
["Land_Misc_Cargo2E",[-16.1588,-42.8856,15.95],270.318,1,0,{}],
["Land_Misc_Cargo2E",[9.07861,45.8145,15.95],359.888,1,0,{}],
["Land_HBarrier_large",[-16.9469,46.3357,15.8],90.0275,1,0,{}],
["Land_Misc_Cargo2E",[-0.986572,50.1346,15.8],270.092,1,0,{}],
["Land_Misc_Cargo2E",[5.23401,50.0702,15.95],90.0925,1,0,{}],
["Fort_Nest_M240",[-5.61267,50.1255,16.4],359.915,1,0,{}],
["Fort_Nest_M240",[-14.2939,50.2889,16.4],359.948,1,0,{}]

];

_objs