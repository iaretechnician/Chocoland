
_obj =cursortarget;
_test = 0;
_switch = _this select 0;
_objl= _obj getvariable"objectLocked";
if(isnil "_objl" || !_objl)exitwith{player globalchat"this object is not orginal";};

switch (_switch) do
{ 
 case 1:{
     if(player distance _obj <= 20)then{
       if(!(isplayer _obj) and !((typeOf _obj) isKindOf "house"))then{
            object1 = _obj;player globalchat"object 1 defined."
        }else{player globalchat"you cannot Attach this object";}
    }else{player globalchat"you are to far away";};
};
 case 2:{
     if(player distance _obj <= 20)then{
        if(!(isplayer _obj) and !((typeOf _obj) isKindOf "house"))then{
            object2 = _obj;player globalchat"object 2 defined."
        }else{player globalchat"you cannot Attach this object";}
    }else{player globalchat"you are to far away";};
};
};