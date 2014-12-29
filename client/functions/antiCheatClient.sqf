
while {true} do {
    
    if(walked)then {
_nObject = nearestObject [player, "EvMoney"];
if(player distance _nObject < 2 && moneypick == 1)then { []execVM "client\actions\pickupMoney.sqf";};
  player enableSimulation true;
  disableUserInput false;
    if(cameraView == "GROUP") then {
        vehicle player switchCamera "EXTERNAL";
        chocoland globalChat "commander view disabled";    
    };
	

    sleep 2; 
};};

