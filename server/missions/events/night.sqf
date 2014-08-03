if(!isServer) exitwith {};

// 7 uhr geht sonne auf
// 17,29 geht sonne unter
//tag kann 10:28 gehn  /_day
//nacht kann 13:31 gehn

_day= 120;
_night=10;
chocomin=0;
_datehour=0;
_dateMin=0;
_cycleD = 628/_day;
_cycleN = 811/_night;
_c=0;
//max 1439 min
while{true}do 
{
   
    if(chocomin >628)then{_c=Round(_cycleN)}else{_c=round(_cycleD)};
    if(chocomin >=1439)then{chocomin=chocomin - 1439};//set min to 0
     chocomin = chocomin+_c;
     publicvariable"chocomin";
     //aufteilen
     sleep 60;
    // if(_min/60 >1)then{_datehour= floor(_min/60)};
    // if(_datehour >17)then{_datehour= _datehour -17};
   //  _dateMin= _min % 60;
    // setDate[2014,03,07,_datehour + 7,_dateMin];
};