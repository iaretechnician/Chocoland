//Thanks for checking out my edit. Thanks to: Veteran, Jet, Blueblood, OMGOMG123, InfiSTAR, Malory, Rustler, Some people off Youtube for sending me some awesome scripts. And anyone else I forgot!
//////////////////////////////////////////////////////////////////////
//          __    Happy New Year!         _   _______   __ 			//
//   	   / /   ____  ____ _____ _____  / | / /__  /  / / 			//
//  	  / /   / __ \/ __ `/ __ `/ __ \/  |/ /  / /  / /  			//
// 		 / /___/ /_/ / /_/ / /_/ / / / / /|  /  / /__/ /___			//
//		/_____/\____/\__, /\__,_/_/ /_/_/ |_/  /____/_____/			//
//            		/____/        www.youtube.com/LoganNZL          //
//////////////////////////////////////////////////////////////////////

setGroupIconsVisible [true, true];
_color_green = [0,1,0,1];
_color_blue = [0,0,1,1];
_color_white = [0,1,0,1];
_color_orange = [1,0.3,0,1];
_color_red = [1,0,0,1];

if (isnil "LoganIsTired") then {LoganIsTired = 0;}; if (LoganIsTired == 0) then {LoganIsTired = 1; hint "LoganNZL's ESP ON";} else {LoganIsTired = 0; hint "LoganNZL's ESP OFF";};

while {LoganIsTired == 1} do
{
	{
		if (vehicle _x == _x) then 
		{
			clearGroupIcons group _x;
			group _x addGroupIcon ["x_art"];
			
			if ((side _x == side player) && (side player != resistance)) then 
			{
				group _x setGroupIconParams [_color_white, format ["[%1]-[%2m]",name _x,round(_x distance player)], 0.5, true];
			} 
			else 
			{
				group _x setGroupIconParams [_color_orange, format ["[%1]-[%2m]",name _x,round(_x distance player)], 0.5, true];
			};
		}
		else
		{
			clearGroupIcons group _x;
			group _x addGroupIcon ["x_art"];
			
			if ((side _x == side player) && (side player != resistance)) then 
			{
				_vehname = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle _x) >> 'displayName'));
				_crew =			(name (crew (vehicle _x) select 0));
				_crew2 =		", "+(name (crew (vehicle _x) select 1));
				_crew3 =		", "+(name (crew (vehicle _x) select 2));
				_crew4 =		", "+(name (crew (vehicle _x) select 3));
				_crew5 =		", "+(name (crew (vehicle _x) select 4));
				_crew6 =		", "+(name (crew (vehicle _x) select 5));
				_crew7 =		", "+(name (crew (vehicle _x) select 6));
				_crew8 =		", "+(name (crew (vehicle _x) select 7));
				_crew9 =		", "+(name (crew (vehicle _x) select 8));
				_crew10 =	", "+(name (crew (vehicle _x) select 9));
				group _x setGroupIconParams [_color_white, format ["[%2]-[%3%4%5%6%7%8%9%10%11]-[%1m]",round(_x distance player),_vehname,_crew,_crew2,_crew3,_crew4,_crew5,_crew6,_crew7,_crew8,_crew9,_crew10], 0.5, true];
			} 
			else 
			{
				_vehname = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle _x) >> 'displayName'));
				_crew =			(name (crew (vehicle _x) select 0));
				_crew2 =		", "+(name (crew (vehicle _x) select 1));
				_crew3 =		", "+(name (crew (vehicle _x) select 2));
				_crew4 =		", "+(name (crew (vehicle _x) select 3));
				_crew5 =		", "+(name (crew (vehicle _x) select 4));
				_crew6 =		", "+(name (crew (vehicle _x) select 5));
				_crew7 =		", "+(name (crew (vehicle _x) select 6));
				_crew8 =		", "+(name (crew (vehicle _x) select 7));
				_crew9 =		", "+(name (crew (vehicle _x) select 8));
				_crew10 =	", "+(name (crew (vehicle _x) select 9));
				group _x setGroupIconParams [_color_red, format ["[%2]-[%3%4%5%6%7%8%9%10%11]-[%1m]",round(_x distance player),_vehname,_crew,_crew2,_crew3,_crew4,_crew5,_crew6,_crew7,_crew8,_crew9,_crew10], 0.5, true];
			};
		};
	} forEach playableUnits;
sleep 0.5;
};
{clearGroupIcons group _x;} forEach playableUnits;