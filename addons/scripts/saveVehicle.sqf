if (!(isengineOn vehicle player) AND  ((velocity vehicle player select 2) <= 1) AND ((velocity vehicle player select 1) <= 1) AND((velocity vehicle player select 0) <= 1))
then {
    _vehicleSave1 = typeof vehicle player;
    _vehicleSave = vehicle player;

   player action ["getOut", vehicle player];
  sleep 0.5;
  player switchMove "AinvPknlMstpSlayWrflDnon_medic";
    if (!isPlayer _vehicleSave) then {
       vehicleSave=_vehicleSave;
_nic = [nil, vehicleSave, "per", rHideobject, true] call RE; 
    hint format ["%1 saved to Hangar! (PlayerMenu for Spawn)", _vehicleSave1];
    sleep 1;
    player globalChat "Vehicle Saved.";
    player SwitchMove "amovpknlmstpslowwrfldnon_amovpercmstpsraswrfldnon";
      } else{ player globalChat "There is another Player in this Vehicle.";sleep 1;};
} else { player globalChat "cannot Save Vehicle,pls stop and turn engine Off"; sleep 1;};