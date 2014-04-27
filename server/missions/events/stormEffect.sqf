// mando_storm.sqs v1.1
// by Mandoble
//
// Purpose:
// Forms up a storm
//
// What do you need:
// trueno1,trueno2,trueno3,trueno4,viento1 ogg files in your mission's Sound folder and in description.ext 
//
// Parameters:
// Storm overcast level (0.0 to 1.0)
// Storm rain level (0.0 to 1.0)
// Storm fog level (0.0 to 1.0)
// Seconds to wait before storm starts
// Seconds to wait after strom ends (original overcast, rain and fog levels will be set along this time)
// Storm duration in seconds (you may use a big number and stop the storm whem needed setting mando_storm = false
// Lightning colour [R, G, B]
//
// Example for a storm forming up in 1 minute, lasting 30 minutes and disipating in 5 minutes:
// 
// [1, 1, 1, 60, 1800, 300, [1,1,1]] execVM "mando_storm.sqf"
//


_sounds = ["trueno1","trueno2","trueno3", "trueno4"];
_overcastlevel = _this select 0;
_rainlevel  = _this select 1;
_foglevel   = _this select 2;
_waitbefore = _this select 3;
_waitafter  = _this select 4;
_duration   = _this select 5;
_lcolour    = _this select 5;

_log = "Logic" createVehicleLocal [0,0,0];
_lightning = "#lightpoint" createVehicleLocal [0,0,0];
_lightning setLightColor [1,1,1];

_lightning setLightAmbient [1,1,1];
_lightning setLightBrightness 0;

_overcastinit = overcast;
_foginit = fog;
_raininit = rain;

_waitbefore setOvercast _overcastlevel;
_waitbefore setRain _rainlevel;
Sleep _waitbefore;
_waitbefore setFog _foglevel;

mando_storm = true;
_maxdist = 30;
_mindist = 0.1;
_maxsounds = (count _sounds);
_windtimeini  = dayTime * 3600;
_stormtimeini = dayTime * 3600;
while {mando_storm && ((dayTime * 3600) < (_stormtimeini + _duration))} do
{
   _ang = random 360;
   _dist = _mindist + random _maxdist;
   _disl = _dist * 10;
   _rand = random _maxsounds;
   _soundn = (_rand - (_rand mod 1));
   _sound = _sounds select _soundn;
   _posp = getPos player;
   _posl = [(_posp select 0) + _disl*sin(_ang),(_posp select 1) + _disl*cos(_ang), 50];
   _pos2 = [(_posp select 0) + _disl*sin(_ang),(_posp select 1) + _disl*cos(_ang), 50];
   _pos3 = [(_posp select 0) + _disl*sin(_ang),(_posp select 1) + _disl*cos(_ang), 50];
   _pos4 = [(_posp select 0) + _disl*sin(_ang),(_posp select 1) + _disl*cos(_ang), 50];
   _posb = [(_posp select 0) + _disl*sin(_ang)*5,(_posp select 1) + _disl*cos(_ang)*5, 50];
   _numlights = 3 + random 3;

   drop["\ca\data\blesk2","","Spaceobject",0.01,0.2,_posb,[0,0,0],0,1.27,1,0,[10],[[1,1,1,1],[1,1,1,0.5],[1,1,1,0.1]],[1,0],0,0,"","",""];
   for [{_i = 0},{_i < _numlights},{_i = _i + 1}] do
   {
      _lightning setPos _posl;
      _lightning setLightBrightness 1;
      Sleep 0.1;
      _lightning setLightBrightness 0;
      Sleep 0.1;
      _lightning setLightBrightness 0.5;
      Sleep 0.1;
      _lightning setLightBrightness 0;
      /////
      _lightning2 setPos _pos2;
      _lightning2 setLightBrightness 1;
      Sleep 0.1;
      _lightning2 setLightBrightness 0;
      Sleep 0.1;
      _lightning2 setLightBrightness 0.5;
      Sleep 0.1;
      _lightning2 setLightBrightness 0;
      /////
      _lightning3 setPos _pos3;
      _lightning3 setLightBrightness 1;
      Sleep 0.1;
      _lightning3 setLightBrightness 0;
      Sleep 0.1;
      _lightning3 setLightBrightness 0.5;
      Sleep 0.1;
      _lightning3 setLightBrightness 0;
      /////
      _lightning4 setPos _pos4;
      _lightning4 setLightBrightness 1;
      Sleep 0.1;
      _lightning4 setLightBrightness 0;
      Sleep 0.1;
      _lightning4 setLightBrightness 0.5;
      Sleep 0.1;
      _lightning4 setLightBrightness 0;
    };
    Sleep (_dist / _maxdist)*2;
   _posp = getPos player;
   _poss = [(_posp select 0) + _dist*sin(_ang),(_posp select 1) + _dist*cos(_ang), 1];
   _log setPos _poss;
   _log say _sound;
  Sleep (10 + random 15);
   if ((dayTime * 3600) > (_windtimeini + 60)) then
   {
      player say "viento1";
      _windtimeini  = dayTime * 3600;
   };
};
deleteVehicle _log;
deleteVehicle _lightning;
_waitafter setOvercast _overcastinit;
_waitafter setRain _raininit;
Sleep _waitafter;
_waitafter setFog _foginit;