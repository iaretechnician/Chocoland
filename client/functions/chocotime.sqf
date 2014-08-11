

_datehour= 0;
_dateMin = 0;
_min = 0;
chocomin = 0;
while{true}do 
{
     _min= chocomin;
    if(_min/60 >1)then{_datehour= floor(_min/60)};
     if(_datehour >17)then{_datehour= _datehour -17};
     _dateMin= _min % 60;
     setDate[2014,03,07,_datehour + 7,_dateMin]; 
     sleep 60;
};