//_x = select 0;
saveVehicle = Format["%1",typeOf x1];
player action ["getOut", vehicle player];
deleteVehicle x1;   
hintsilent "Vehicle saved to Hangar! (PlayerMenu for Spawn)";