
_obj =cursortarget;

_switch = _this select 0;

switch (_switch) do
{ 
 case 1:{
     if(player distance _obj <= 20 && !isplayer _obj && {!(_obj getvariable["R3F_LOG_disabled", true])})then{object1 = _obj;chocoland globalChat"Main Object defined."
    }else{chocoland globalChat"you are to far away";};
};
 case 2:{
     if(player distance _obj <= 20 && !isplayer _obj && {!(_obj getvariable["R3F_LOG_disabled", true])})then{object2 = _obj;chocoland globalChat"object 2 defined."
    }else{chocoland globalChat"you are to far away";};
};
};