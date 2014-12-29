
disableSerialization;
private["_ui","_hud","_food","_water","_playerMoney","_vitals","_highscore"];
_core = "";
_fpic= 0;
_money= 0;
_n = 1;
_decimal =0;
_pic1= "<img size='1.3' image='client\icons\chocoGreen.paa'/>";
_pic2= "<img size='1.3' image='client\icons\chocoPurple.paa'/>";
while {true} do
{
    1000 cutRsc ["WastelandHud","PLAIN"];
    _ui = uiNameSpace getVariable "WastelandHud";
    _vitals = _ui displayCtrl 3600;
    _hudVehicle = _ui displayCtrl 3601;
    _highscore = _ui displayCtrl 3602;
    _chococore = _ui displayCtrl 3603;
    
_money =player getVariable "cmoney";
_money=[_money] call fnc_number;
_bounty=player getvariable["bounty",1];
_multiplier = floor (player getvariable["bounty",1]);
_decimal =_bounty  - _multiplier;
_decimal = floor(_decimal * 10);
  _decimalPlaces = 2;
    _health = damage player;
    _health = round (_health * (10 ^ _decimalPlaces)) / (10 ^ _decimalPlaces);
    _health = 100 - (_health * 100);
    
if(oldBounty == _bounty)then{
_fpic= _pic1;
};
if(oldBounty != _bounty)then{_fpic = _pic2;[]spawn{oldBounty=player getvariable["bounty",1];sleep 0.5;};};

_vitals ctrlSetStructuredText parseText format ["<t size='2' font='Zeppelin33' color='#FFFFFF'>%1</t><t size='1.25' font='Zeppelin33' color='#FFFFFF'>,%2 %4</t><br/>%5 <img size='1' image='client\icons\health.paa'/><br/>%3 <img size='1' image='\CA\misc\data\icons\picture_money_CA.paa'/>", _multiplier,_decimal,_money, _fpic,_health];
_vitals ctrlCommit 0;
_highscore ctrlSetStructuredText parseText format ["%1",player getvariable["ongui",""]];
_highscore ctrlCommit 0;
_chococore ctrlSetStructuredText parseText format ["%1", player getvariable["ongui2",""]];
_chococore ctrlCommit 0;
    if(player != vehicle player) then
    {
        _tempString = "";
        _yOffset = 0.24;
        _vehicle = assignedVehicle player;

        {
            if((driver _vehicle == _x) || (gunner _vehicle == _x)) then
            {
                if(driver _vehicle == _x) then
                {
                    _tempString = format ["%1 %2 <img size='0.8' image='client\icons\driver.paa'/><br/>",_tempString, (name _x)];
                    _yOffset = _yOffset + 0.04;
                }
                else
                {
                    _tempString = format ["%1 %2 <img size='0.8' image='client\icons\gunner.paa'/><br/>",_tempString, (name _x)];
                    _yOffset = _yOffset + 0.04;
                }; 
            }
            else
            {
                _tempString = format ["%1 %2 <img size='0.8' image='client\icons\cargo.paa'/><br/>",_tempString, (name _x)];
                _yOffset = _yOffset + 0.04;
            };    
        } forEach crew _vehicle;

        _hudVehicle ctrlSetStructuredText parseText _tempString;
        _x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
        _y = safeZoneY + (safeZoneH * (1 - (_yOffset / SafeZoneH)));
        _hudVehicle ctrlSetPosition [_x, _y, 0.4, 0.65];
        _hudVehicle ctrlCommit 0;
    };
        
   sleep 1;
};
waituntil{walked};
[] execVM "client\systems\hud\playerHud.sqf";