while {alive player} do {
	waituntil {sleep 0.1; !(cameraView in ["INTERNAL","GUNNER"])};
    if(cameraView == "GROUP") then {
        vehicle player switchCamera "INTERNAL";
		playSound "IncomingChallenge";
        player globalchat "Commander view is disabled";    
    };

	if (vehicle player != player)then{
	waituntil {sleep 0.2; vehicle player == player};};
};