//ModdedGaming.org
//Add the following line to playerSetup.sqf
//[] execVM "client\functions\blockView.sqf";

while {alive player} do {
    if(cameraView == "GROUP") then {
        vehicle player switchCamera "EXTERNAL";
        player globalchat "commander view disabled";    
    };
    sleep 0.5;
};