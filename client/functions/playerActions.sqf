aActionsIDs = [];
aActionsIDs = aActionsIDs + [player addAction["Take Jerry Can", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Fuel_can"],  5] select 0); player setVariable["fuelFull",1,true]; hint "You have taken a fuel can."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["Fuel_can"],  5] select 0) < 4 AND ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 0) AND ((nearestObjects[player, ["Fuel_can"], 3] select 0) getVariable "fuel")']];
aActionsIDs = aActionsIDs + [player addAction["Take Empty Jerry Can", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Fuel_can"],  5] select 0); player setVariable["fuelEmpty",1,true]; hint "You have taken a empty fuel can."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["Fuel_can"],  5] select 0) < 4 AND ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 0) AND !((nearestObjects[player, ["Fuel_can"], 3] select 0) getVariable ["fuel", false])']];
aActionsIDs = aActionsIDs + [player addAction["Refuel Jerry Can", "client\actions\refuelFuelCan.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Land_A_FuelStation_Feed", "BarrelBase", "Land_Ind_FuelStation_Feed_Ep1"],  3] select 0) < 3 AND ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 1)']];
aActionsIDs = aActionsIDs + [player addAction["Take Repair kit", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Suitcase"],  5] select 0); player setVariable["repairkits", (player getVariable "repairkits")+1,true]; hint "You have taken a repair kit."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["Suitcase"],  5] select 0) < 4 and (player getVariable "repairkits")<2']];
aActionsIDs = aActionsIDs + [player addAction["Take Medkit", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["CZ_VestPouch_EP1"],  5] select 0); player setVariable["medkits", (player getVariable "medkits")+1,true]; hint "You have taken a medkit."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["CZ_VestPouch_EP1"],  5] select 0) < 4 and (player getVariable "medkits")<2 ']];
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#E01B1B"">Destroy choco beacon</t>"), "client\actions\pickupBeacon.sqf", 1, 1, false, false, "", 'player distance (nearestobjects [player, ["Satelit"],  5] select 0) < 5']];
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#21DE31"">Repack choco beacon</t>"), "client\actions\pickupBeacon.sqf", 0, 1, false, false, "", 'player distance (nearestobjects [player, ["Satelit"],  5] select 0) < 5']];
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#21DE31"">link choco beacon</t>"), "client\actions\pickupBeacon.sqf", 2, 1, false, false, "", 'player distance (nearestobjects [player, ["Satelit"],  5] select 0) < 5']];
//Interact with radar trucks
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#21DE31"">Deploy radar</t>"), "client\functions\radarDeploy.sqf",nil, 6, false, false, "", '_currRadar = (nearestobjects [player, ["M1133_MEV_EP1"],  5]); player distance (_currRadar select 0) < 5; ((nearestObjects[player, ["M1133_MEV_EP1"], 10] select 0) getVariable "deployed") == 0 AND str(playerSide) != "GUER"']];
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#E01B1B"">Repack radar</t>"), "client\functions\radarPack.sqf", nil, 6, false, false, "", '_currRadar = (nearestobjects [player, ["M1130_HQ_unfolded_Base_EP1"],  5]); player distance (_currRadar select 0) < 5; ((nearestObjects[player, ["M1130_HQ_unfolded_Base_EP1"], 10] select 0) getVariable "deployed") == 1 AND str(playerSide) != "GUER"']];
//Mission interactions
//Camonet pickup
aActionsIDs = aActionsIDs + [player addAction["Pickup ChocoBomb", "client\actions\pickupcamonet.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Explosive"],  5] select 0) < 5']];
aActionsIDs = aActionsIDs + [player addAction["Activate ChocoBomb", "client\chocofunc\chocobomb.sqf", [_bomb], 1, false, false, "", '_bomb = (nearestobjects [player, ["Explosive"],  5] select 0);player distance (nearestobjects [player, ["Explosive"],  5] select 0) < 5']];
//Cancel action
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#FFFFFF"">Cancel Action</t>"), "noscript.sqf", 'doCancelAction = true;', 1, false, false, "", 'mutexScriptInProgress']];
aActionsIDs = aActionsIDs + [player addAction["Get on Board", "client\functions\getonBoard.sqf", [], -12, false, false, "", 'player distance (nearestobjects [player, ["Land_LHD_1"],  500] select 0) < 800 && ((getposasl player) select 2) < 102']];
aActionsIDs = aActionsIDs + [player addAction["Activate BaseCore", "client\chocofunc\basecore.sqf", [1], 1, false, false, "", 'player distance (nearestobjects [player, ["Misc_cargo_cont_tiny"],  20] select 0) < 5; _obj = (nearestobjects [player, ["Misc_cargo_cont_tiny"],  5]); (_obj select 0 )getvariable"basecore"== 0;']];
aActionsIDs = aActionsIDs + [player addAction["Destroy BaseCore", "client\chocofunc\basecore_d.sqf", [1], 1, false, false, "", 'player distance (nearestobjects [player, ["Misc_cargo_cont_tiny"],  20] select 0) < 5; _obj = (nearestobjects [player, ["Misc_cargo_cont_tiny"],  5]); (_obj select 0 )getvariable"basecore"== 1;']];
aActionsIDs = aActionsIDs + [player addAction["Activate BaseCore lvl 2", "client\chocofunc\basecore.sqf", [2], 0, false, false, "", 'player distance (nearestobjects [player, ["TK_GUE_WarfareBUAVterminal_EP1"],  20] select 0) < 20; _obj = (nearestobjects [player, ["TK_GUE_WarfareBUAVterminal_EP1"],  20]); (_obj select 0 )getvariable"basecore" == 0;']];
aActionsIDs = aActionsIDs + [player addAction["Destroy BaseCore lvl 2", "client\chocofunc\basecore_d.sqf", [2], 0, false, false, "", 'player distance (nearestobjects [player, ["TK_GUE_WarfareBUAVterminal_EP1"],  20] select 0) < 20; _obj = (nearestobjects [player, ["TK_GUE_WarfareBUAVterminal_EP1"],  20]); (_obj select 0 )getvariable"basecore" == 1;']];
aActionsIDs = aActionsIDs + [player addAction["Activate BaseCore lvl 3", "client\chocofunc\basecore.sqf", [3], 0, false, false, "", 'player distance (nearestobjects [player, ["USMC_WarfareBAircraftFactory"],  20] select 0) < 20; _obj = (nearestobjects [player, ["USMC_WarfareBAircraftFactory"],  20]); (_obj select 0 )getvariable"basecore" == 0;']];
aActionsIDs = aActionsIDs + [player addAction["Capture Server Core",  "client\chocofunc\capturingCore.sqf", _obj, 0, false, false, "", 'player distance (nearestobjects [player, ["76n6ClamShell"],  30] select 0) < 30; _obj = (nearestobjects [player, ["76n6ClamShell"],  30]);(_obj select 0)getvariable"basecore" == 1;']];
aActionsIDs = aActionsIDs + [player addAction["Destroy Server Core",  "client\chocofunc\capturingCore2.sqf", _obj, 0, false, false, "", 'player distance (nearestobjects [player, ["76n6ClamShell"],  30] select 0) < 30; _obj = (nearestobjects [player, ["76n6ClamShell"],  30]);(_obj select 0)getvariable"basecore" == 0;']];

    
aActionsIDs = aActionsIDs + [player addAction["Destroy BaseCore lvl 3", "client\functions\basecore_d.sqf", [3], 0, false, false, "", 'player distance (nearestobjects [player, ["USMC_WarfareBAircraftFactory"],  20] select 0) < 20; _obj = (nearestobjects [player, ["USMC_WarfareBAircraftFactory"],  20]); (_obj select 0 )getvariable"basecore" == 1;']];
aActionsIDs = aActionsIDs + [player addAction["Redeem Chocos", "client\functions\satPhone.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["SatPhone"],  20] select 0) < 3']];
//HaloSpawn
aActionsIDs = aActionsIDs + [player addAction["Ready for HaloSpawn", "client\functions\spawnHalo.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["ProtectionZone_Ep1"],  30] select 0) < 30 And spawnHalo']];
// chocopack 
aActionsIDs = aActionsIDs + [player addAction["Rescue Animal", "client\chocofunc\rescueanimal.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Hen","Rabbit","Cow04","Pastor","Goat"],  5] select 0) < 5 AND !RESCUE']];

aActionsIDs = aActionsIDs + [player addAction[("<t color=""#BEBEBE"">weapon to Chocopack</t>"), "addons\scripts\saveChocopack.sqf",[],-10,false,false,"", '_primary = primaryWeapon player;_primary != ""']];
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#BEBEBE"">Chocopack</t>"), "addons\scripts\createChocopack.sqf",[],-10,false,false,"", '_primary = primaryWeapon player;_primary == ""']];
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#BEBEBE"">setHome</t>"), "client\chocofunc\home.sqf",1,-10,false,false,"", '!home']];
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#BEBEBE"">GotoHome</t>"), "client\chocofunc\home.sqf",2,-10,false,false,"", 'home && !Dcooldown']];

if(player getvariable"sat" == 1)then 
{
    playersatId = player addAction [format ["<t color='#585858'>%1</t>", "activate Sattelite"], "client\systems\generalStore\adds\fnc_sattelite_fnc.sqf",[],-12,false,false,"","local player"];
    chocoland globalChat"check mouseWheel commands for Sattelite";
};
