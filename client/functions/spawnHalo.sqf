_mapside = Round (random 2);
     if(_mapside == 1) then 
     {
          _xCord = Round (random 2000) + 2436.33;
          _yCord = Round (random 1140) + 3501.65;
          _pos = [_xCord, _yCord,0.0014];
     }
     else 
     {
         _xCord = Round (random 1550)+3197.88;
         _yCord = Round (random 1375)+ 2857;
         _pos = [_xCord,_yCord, 0.0014];
     };
//layer setPos _pos;
		    
    2 cutText ["Suicide jump initialized. Open Your Parachute at alt 150+!!Use MOUSEWHEEL", "PLAIN DOWN", 3];
player globalChat " Open your parachute at the ground.";
player setPos _pos; // Stop the player appearing on the ground for a split second before the HALO 
    [player, 1000] exec "ca\air2\halo\data\Scripts\HALO_init.sqs";   
    respawnDialogActive = false;
	closeDialog 0;

//Force 3rd person view at spawning
firstperson_allowed = false;
while {not firstperson_allowed} do {

	if(cameraView == "INTERNAL" || cameraView == "GROUP") then {
		vehicle player switchCamera "EXTERNAL";
	};

	sleep 0.1;
	firstperson_allowed = true;
};

sleep 5;

_mins = floor(60 * (daytime - floor(daytime)));
_townName = _randomLoc select 2;
[
	"Paradropping into",_townName,format ["%1:%3%2", floor(daytime), _mins, if(_mins < 10) then {"0"} else {""}]
] spawn BIS_fnc_infoText;

//Altimeter reading at top right
while {((getposATL player)select 2) > 1} do
{
    hintsilent parseText format ["<t align='center' color='#00aa00' font='Zeppelin33' shadow='1' shadowColor='#000000' size='2'>Alt %1m</t>", round (getPosATL player select 2)];

player allowDamage false;
sleep 0,1;
};
sleep 3;
 player allowDamage true;
