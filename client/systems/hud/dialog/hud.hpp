/*
	@file Version: 1.0
	@file Name: hud.hpp
	@file Author: [404] Deadbeat
	@file Created: 11/09/2012 04:23
	@file Args:
*/

#define hud_status_idc 3600
#define hud_vehicle_idc 3601
#define hud_high_idc 3602
class WastelandHud {
	idd = -1;
    fadeout=0;
    fadein=0;
	duration = 20;
	name= "WastelandHud";
	onLoad = "uiNamespace setVariable ['WastelandHud', _this select 0]";
	
	class controlsBackground {
		class WastelandHud_Vehicle:w_RscText
		{
			idc = hud_vehicle_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.14 / SafeZoneW)));
                        y = safeZoneY + (safeZoneH * (1 - (0.30 / SafeZoneH)));
			w = 0.2; h = 0.65;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};
class highscore:w_RscText
		{
			idc = hud_high_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.06;
			x = safeZoneX + (safeZoneW * (0.1 + (0.04 / SafeZoneW)));
                        y = safeZoneY + (safeZoneH * (0 + (0.15 / SafeZoneH)));
			w = 2; h = 0.08;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,1,1,0};
			text = "";
			shadow = 4;
			class Attributes {
				align = "center";
			};
		};
		class WastelandHud_Status:w_RscText
		{
			idc = hud_status_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.050;
			x = safeZoneX + (safeZoneW * (0.97 - (0.14 / SafeZoneW)));
                        y = safeZoneY + (safeZoneH * (1 - (0.15 / SafeZoneH)));
			w = 0.2; h = 0.20;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "500 <img size='0.8' image='\CA\misc\data\icons\picture_money_CA.paa'/><br/>100 <img size='0.8' image='client\icons\health.paa'/>";
			shadow = 4;
			class Attributes {
				align = "right";
			};
		};
	};
};
