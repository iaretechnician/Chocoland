
_switch = _this select 0;
_array = [];
{_array = _array + [_x select 2]}foreach ChopperStoreArray;
{_array = _array + [_x select 2]}foreach vehicleStoreArray;
{_array = _array + [_x select 2]}foreach BuildStoreArray;
switch (_switch) do
{ 
 case 1:{
     if(player distance cursortarget <= 20)then{
        if(typeof cursortarget in _array and typeof cursortarget != "Land_Misc_ConcPipeline_EP1"
        and typeof cursortarget != "Misc_concrete_High" and typeof cursortarget != "Concrete_Wall_EP1"
        and typeof cursortarget != "RampConcrete" and typeof cursortarget != "Land_ConcreteRamp"
        and typeof cursortarget != "Land_ConcreteBlock")then{
            object1 = cursorTarget;player globalchat"object 1 defined."
        }else{hint"you cannot Attach this object";}
    }else{hint"you are to far away";};
};
 case 2:{
     if(player distance cursortarget <= 20)then{
        if(typeof cursortarget in _array and typeof cursortarget != "Land_Misc_ConcPipeline_EP1"
        and typeof cursortarget != "Misc_concrete_High" and typeof cursortarget != "Concrete_Wall_EP1"
        and typeof cursortarget != "RampConcrete" and typeof cursortarget != "Land_ConcreteRamp"
        and typeof cursortarget != "Land_ConcreteBlock")then{
            object2 = cursorTarget;player globalchat"object 2 defined."
        }else{hint"you cannot Attach this object";}
    }else{hint"you are to far away";};
};
};