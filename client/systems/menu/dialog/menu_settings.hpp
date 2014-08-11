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
                 class Maintwitter: w_RscPicture
		{
			idc = picture3;
			text = "client\images\twit.jpg";
                        x = 0.08168 * safezoneW + safezoneX ;
			y = 0.01 * safezoneH + safezoneY ;
			w = 0.15 * safezoneW; //0.28
			h = 0.15 * safezoneH;
                        
			
		};

		
	};
	
	class controls {
		///custom
                   class twitt: w_RscButton
		{
			idc =-1;
			onButtonClick = "closeDialog 0; [] execVM 'addons\scripts\twitter.sqf'";
			text = "Follow us";

			x = 0.08 * safezoneW + safezoneX;
			y = 0.01 * safezoneH + safezoneY;
			w = 0.05 * safezoneW;
			h = 0.04 * safezoneH;

		};
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
			text = "Smart Ammo buy";

			x = 0.3 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.08 * safezoneW;
			h = 0.04 * safezoneH;

		};
               
                
                
	};
};