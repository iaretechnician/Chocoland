_unit = _this select 0;
_killer = _this select 1;
 _bounty = 50+ (50*(score _killer)*( score _unit));
            _killer getVariable["cmoney",_bounty,false];
            sleep 1;