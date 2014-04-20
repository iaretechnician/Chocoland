if(!basecoreState) then {
    basecoreState = true;hint "BaseCore Markers ON ";
//// maker create
 unitList = allUnits;
 j = count unitList;
 i = 0;

 while {basecoreState} do
 { 
 unitList = allUnits;
 j = count unitList;
 i = 0;
  
  for "i" from 0 to j do
  {
   unit = unitList select i;
   pos = position unit;
   deleteMarkerLocal ("playerMarker"+ (str i));
   marker = "playerMarker" + (str i);
   marker = createMarkerLocal [marker,pos];
   marker setMarkerTypeLocal "waypoint";
   marker setMarkerPosLocal (pos);
   marker setMarkerColorLocal("ColorBlue");
   marker setMarkerTextLocal format ["%1",name unit];
  };
  sleep 0.5;
 };
};

if(basecoreState) then {
    // marker delete
    basecoreState == false;
    hint "BaseCore Markers OFF";
    unitList = allUnits;
    j = count unitList;
    i = 0;
    for "i" from 0 to j do
         {
   unit = unitList select i;
   pos = position unit;
   deleteMarkerLocal ("playerMarker"+ (str i));
        };
};

