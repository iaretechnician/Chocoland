#include "buildstoreDefines.sqf"

class buildshopd {

	idd = buildshop_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] spawn PopulateBuildStore";	//"[] execVM 'client\systems\vehicleStore\PopulateVehStore.sqf'";

	class controlsBackground {
		
		class MainBackground: w_RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";

			  x = 0.35 ;
			y = 0.15 ;
			w = 0.60 ; //0.28
			h = 0.861111;
		};

		class DialogTitleText: w_RscText
		{
			idc = -1;
			text = " Buildings & Statics";

			 x = 0.35;
			y = 0.10;
			w = 0.13 * safezoneW;
			h = 0.10 * safezoneH;
		};

		class PlayerMoneyText: w_RscText
		{
			idc = buildshop_money;
			text = "Price:";

                        x = 0.65;
			y = 0.10;
			w = 0.13 * safezoneW;
			h = 0.1 * safezoneH;
		};
	};
	
	class controls {
            ///custom
                class loadVehStore: w_RscButton
		{
			idc =-1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\vehicleStore\loadVehStore.sqf'";
			text = "-> Vehicle Store";

		x = 0.13;
			y = 0.15;
			w = 0.065 * safezoneW;
			h = 0.040 * safezoneH;

		};
                 class loadChopStore: w_RscButton
		{
			idc =-1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\GunStore\loadGunStore.sqf'";
			text = "-> Weapon Store";

		x = 0.13;
			y = 0.25;
			w = 0.065 * safezoneW;
			h = 0.040 * safezoneH;

		};
                 class loadBuildStore: w_RscButton
		{
			idc = -1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\ChopperStore\loadChopStore.sqf'";
			text = "-> Chopper Store";

		x = 0.13;
			y = 0.35;
			w = 0.065 * safezoneW;
			h = 0.040 * safezoneH;

		};
                 class loadBuildStore2: w_RscButton
		{
			idc = -1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\generalStore\loadGenStore.sqf'";
			text = "-> General Store";

			x = 0.13;
			y = 0.45;
			w = 0.065 * safezoneW;
			h = 0.040 * safezoneH;


		};
                ////////end custom
		
		class SelectionList: w_RscListbox
		{
			idc = buildshop_item_list;
			onLBSelChanged = "[] spawn buildItemInfo";

			x = 0.10 * safezoneW + safezoneX;
			y = 0.07 * safezoneH + safezoneY;
			w = 0.25;
			h = 0.30 * safezoneH;
		};

		class BuyVehicleButton: w_RscButton
		{
			idc = -1;
			onButtonClick = "[] execVM 'client\systems\BuildStore\buyBuild.sqf'";
			text = "Buy";

		x = 0.11 * safezoneW + safezoneX;
			y = 0.92;
			w = 0.065 * safezoneW;
			h = 0.040 * safezoneH;
			color[] = {0.1,0.95,0.1,1};

		};

		class CancelButton: w_RscButton
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			text = "Cancel";

                 x = 0.17 * safezoneW + safezoneX;
			y = 0.92;
			w = 0.065 * safezoneW;
			h = 0.040 * safezoneH;
			color[] = {0.95,0.1,0.1,1};

		};
	};
};
		