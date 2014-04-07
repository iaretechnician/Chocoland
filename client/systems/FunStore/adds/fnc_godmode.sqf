
while {iloopok<=60} do
{;
	player addeventhandler ["hit",{player setdammage 0}];
player addeventhandler ["dammaged",{player setdammage 0}];
(vehicle player) addeventhandler ["hit",	{vehicle player setdammage 0}];
(vehicle player) addeventhandler ["dammaged",{vehicle player setdammage 0}];
(vehicle player) removeAllEventHandlers "handleDamage";
(vehicle player) addEventHandler ["handleDamage", { false }];	
(vehicle player) allowDamage false;
        iloopok=iloopok + 0.1;
        hint "GOD mode ON";
sleep 0.1;
};
iloopok = 0;
player removeAllEventHandlers "hit";
player removeAllEventHandlers "dammaged";
(vehicle player) removeAllEventHandlers "hit";
(vehicle player) removeAllEventHandlers "dammaged";
(vehicle player) addEventHandler ["handleDamage", { true }];	
(vehicle player) removeAllEventHandlers "handleDamage";
(vehicle player) allowDamage true;
hint "YOU ARE NO LONGER GOD";
sleep 0.1;
};




