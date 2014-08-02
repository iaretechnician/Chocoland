_random = Round(random 2);
if(_random == 2)then

{titleText [format["\n your lucky you got 20 chocos"], "PLAIN DOWN", 0];
player setvariable["bounty",(player getvariable"bounty")+20,true];
}
else 
{titleText [format["\n not this time, thanks for gamble"], "PLAIN DOWN", 0];
};