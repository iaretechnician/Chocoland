#include "menuDefines.sqf"

class menu1d {

	idd = menu_DIALOG;
	movingEnable = false;
	enableSimulation = true;
		class controlsBackground {
                class MainBackground2: w_RscPicture
		{
			idc = picture2;
			text = "\ca\ui\data\ui_logo_main_ca.paa";
                        x = 0.04168 * safezoneW + safezoneX ;
			y = 0.111629 * safezoneH + safezoneY ;
			w = 0.3 * safezoneW; //0.28
			h = 0.3 * safezoneH;
                        
			
		};
                   class WastelandHud_Info:w_RscText
		{
			idc = hud_status_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (0 + (0.05 / SafeZoneW)));
                        y = safeZoneY + (safeZoneH * (0 + (0.05 / SafeZoneH)));
			w = 0.35; h = 0.22;
			colorText[] = {0,0,1,0.2};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "Teamspeak: tseu5.vilayer.com:9988<br/>ServerIP: 134.255.217.167:2302";
			shadow = 0;
			class Attributes {
				align = "left";
			};
		};
               

		
	};
	
	class controls {
		///custom
              
                  class loadChopStore: w_RscButton
		{
			idc =-1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\GunStore\loadGunStore.sqf'";
			text = "-> Weapons";

			x = 0.020313 * safezoneW + safezoneX;
			y = 0.036111 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.07 * safezoneH;

		};
                  class loadgenStore: w_RscButton
		{
			idc = -1;
			onButtonClick = "closeDialog 0; []execVM 'client\systems\menu\animal.sqf'";
			text = "-> Animal Mode";

			x = 0.220313 * safezoneW + safezoneX;
			y = 0.036111 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.07 * safezoneH;

		};
                class loadVehStore: w_RscButton
		{
			idc =-1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\vehicleStore\loadVehStore.sqf'";
			text = "-> Vehicles";

			x = 0.120313 * safezoneW + safezoneX;
			y = 0.036111 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.07 * safezoneH;
		};
                 class loadChopStore3: w_RscButton
		{
			idc =-1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\ChopperStore\loadChopStore.sqf'";
			text = "-> Airplanes";

			x = 0.020313 * safezoneW + safezoneX;
			y = 0.421852 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.07 * safezoneH;

		};
                 class loadBuildStore: w_RscButton
		{
			idc = -1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\BuildStore\loadBuildStore.sqf'";
			text = "-> Buildings";

			x = 0.120313 * safezoneW + safezoneX;
			y = 0.421852 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.07 * safezoneH;

		};
                 
                 class loadfunStore2: w_RscButton
		{
			idc = -1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\generalStore\loadGenStore.sqf'";
			text = "-> Choco Generals";

			x = 0.220313 * safezoneW + safezoneX;
			y = 0.421852 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.07 * safezoneH;

		};
                class smartAmmobutton: w_RscButton
		{
			idc = -1;
			onButtonClick = "[] execVM 'client\systems\gunStore\smartammo.sqf'";
			text = "Smart Ammo buy (F3)";

			x = 0.3 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.04 * safezoneH;

		};
                 class smartAmmobutton2: w_RscButton
		{
			idc = -1;
			onButtonClick = "[] execVM 'client\chocofunc\erfolge.sqf'";
			text = "Rainbow Flares";

			x = 0.2 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.04 * safezoneH;

		};
              
                
	};
};