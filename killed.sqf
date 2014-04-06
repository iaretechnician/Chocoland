_unit = _this select 0;
_killer = _this select 1;
 _bounty = 50+ (50*(score _killer)*( score _unit));
            _killer getVariable["cmoney",_bounty,false];
            _killer globalChat format["you got %1$ by killing %2",_bounty,(_unit select 1)];
            sleep 1;