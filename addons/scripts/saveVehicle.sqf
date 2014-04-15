if (!(isengineOn vehicle player) AND  ((velocity vehicle player select 2) <= 1) AND ((velocity vehicle player select 1) <= 1) AND((velocity vehicle player select 0) <= 1))
then {
    vehicleSave1 = typeof vehicle player;
    vehicleSave = vehicle player;
    //new
    { _x action ["getOut", vehicle player];
    }foreach playableUnits in vehicleSave;
   player action ["getOut", vehicle player];
  sleep 0.9;
  // if (!isPlayer vehicleSave) then {
_nic = [nil, vehicleSave, "per", rHideobject, true] call RE; 
    hint format ["%1 saved to Hangar! (PlayerMenu for Spawn)", vehicleSave1];
    sleep 1;
    player globalChat "Vehicle Saved.";
      //} else{ player globalChat "There is another Player in this Vehicle.";sleep 1;};
} else { player globalChat "cannot Save Vehicle,pls stop and turn engine Off"; sleep 1;};