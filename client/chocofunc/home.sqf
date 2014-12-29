_action = _this select 3 ;

switch (_action) do{
	case 1 :{player setvariable["home",(getposatl player),true]; chocoland globalChat"you have successfully marked your sweet home.";home = true;};
    case 2 :{if(!Dcooldown)then{
        titleText ["", "BLACK OUT", 6];dcooldown =true; 
    sleep 6;  
    player setposatl (player getvariable["home",[0,0,0]]);
    titleText ["", "BLACK IN", 6];
    sleep 4;
    _cd = 600;
    _ctext = "10";
    if((player getvariable"donator") == 1)then { _cd = 300;
    _ctext = "5";};
chocoland globalChat format ["you wake up at your home - %1 Min cooldown",_ctext];
        sleep _cd;
        Dcooldown = false;
        };
    };};