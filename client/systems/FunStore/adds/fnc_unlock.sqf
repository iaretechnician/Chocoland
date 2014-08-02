_private = ["_test", "_switch"];

_switch = _this select 0;

      switch (_switch) do
{
    case "decoder":{
        _test = player getvariable"decoder";
        if(_test ==1)then{hint" you are allready a Decoder!";player setvariable["bounty",(player getvariable"bounty") +25,true];
        }else{
            player globalchat" you unlocked Decoder Feature,destroy everything you want for few $ of objectcost. infritrate bases, destroy Dreams, use it with mouseWheel near object";
            player setvariable["decoder",1,true];
            };
 };   
    
    case "basebuilder":{
        _test = player getvariable"basebuilder";
        if(_test ==1)then{hint "you are allready a Basebuilder!";player setvariable["bounty",(player getvariable"bounty") +25,true];
        }else{
            player globalchat" you unlocked Basebuilder Feature,create wonderful Bases with your Special bonus, your Objects will return after Restarts for Ever, and you only pay 50%";
            player setvariable["basebuilder",1,true];
            }; 
    };
   
     case "attach":{
        _test = player getvariable"attach";
        if(_test ==1)then{hint "you are allready a attach!";player setvariable["bounty",(player getvariable"bounty") +25,true];
        }else{
            player globalchat"you unlocked attach Feature,create wonderful vehicles with your Special bonus, you can open it with B - Button";
            player setvariable["attach",1,true];
            }; 
    };
    };