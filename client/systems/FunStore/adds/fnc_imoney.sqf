iloopok = 0;
_oldmoney = player getVariable"cmoney";
while {iloopok<=20} do
{;

	player setVariable["cmoney", 999999,false];
	sleep 0.1;
        iloopok=iloopok + 0.1;
};
hint "Infinite Money OFF!";
iloopok = 0;
player setVariable["cmoney", _oldmoney,false];