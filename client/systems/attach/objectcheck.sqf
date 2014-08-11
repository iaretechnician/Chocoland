
_obj =cursortarget;

_switch = _this select 0;
_array = ["Land_Misc_ConcPipeline_EP1","Misc_concrete_High","Concrete_Wall_EP1","RampConcrete","Land_ConcreteRamp","Land_ConcreteBlock","Misc_cargo_cont_tiny",
"TK_GUE_WarfareBUAVterminal_EP1","USMC_WarfareBAircraftFactory","Land_A_Castle_Bastion","Land_A_CraneCon","Land_A_statue02","Land_A_GeneralStore_01a","Land_A_TVTower_Base"
,"Land_Barn_Metal","Land_A_Office01","Land_A_BuildingWIP","Land_A_Hospital","Land_HouseB_Tenement"];

switch (_switch) do
{ 
 case 1:{
     if(player distance _obj <= 20)then{
        if(!(isplayer _obj) and !(_obj in _array))then{
            object1 = _obj;player globalchat"object 1 defined."
        }else{player globalchat"you cannot Attach this object";}
    }else{player globalchat"you are to far away";};
};
 case 2:{
     if(player distance _obj <= 20)then{
        if(!(isplayer _obj) and !(_obj in _array))then{
            object2 = _obj;player globalchat"object 2 defined."
        }else{player globalchat"you cannot Attach this object";}
    }else{player globalchat"you are to far away";};
};
};