_x = select 0;
saveVehicle = Format["%1",typeOf _x];
player action ["getOut", vehicle player];
deleteVehicle _x;   
hintsilent "Vehicle saved to Hangar! (PlayerMenu for Spawn)";