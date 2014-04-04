#include "FunStoreDefines.sqf"

class funshopd {

	idd = funshop_DIALOG;
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn PopulateFunStore";	//"[] execVM 'client\systems\vehicleStore\PopulateVehStore.sqf'";

	class controlsBackground {
		
		class MainBackground: w_RscPicture
		{
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
                       x = 0.001704 * safezoneW + safezoneX ;
			y = 0.00 * safezoneH + safezoneY ;
			w = 0.27 * safezoneW;
			h = 0.60 * safezoneH;
			
		};

		class DialogTitleText: w_RscText
		{
			idc = -1;
			text = "Funniest";
                      x = 0.001 * safezoneW + safezoneX;
			y = 0.013 * safezoneH + safezoneY;
			w = 0.065 * safezoneW;
			h = 0.040 * safezoneH;
		};

		class PlayerMoneyText: w_RscText
		{
			idc = funshop_money;
			text = "Price:";

			  x = 0.10 * safezoneW + safezoneX;
			y = 0.013 * safezoneH + safezoneY;
			w = 0.065 * safezoneW;
			h = 0.040 * safezoneH;
		};
	};
	
	class controls {
		///custom
                class loadVehStore: w_RscButton
		{
			idc =-1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\vehicleStore\loadVehStore.sqf'";
			text = "-> Vehicles";

			 x = 0.228459 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.124927 * safezoneW;
			h = 0.0599908 * safezoneH;
		};
                 class loadChopStore: w_RscButton
		{
			idc =-1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\GunStore\loadGunStore.sqf'";
			text = "-> Weapons";

			  x = 0.230203 * safezoneW + safezoneX;
			y = 0.12 * safezoneH + safezoneY;
			w = 0.124927 * safezoneW;
			h = 0.0599908 * safezoneH;

		};
                 class loadBuildStore: w_RscButton
		{
			idc = -1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\BuildStore\loadBuildStore.sqf'";
			text = "-> Buildings";

			x = 0.230203 * safezoneW + safezoneX;
			y = 0.18 * safezoneH + safezoneY;
			w = 0.124927 * safezoneW;
			h = 0.0599908 * safezoneH;

		};
                 class loadBuildStore2: w_RscButton
		{
			idc = -1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\generalStore\loadGenStore.sqf'";
			text = "-> Generals";

			x = 0.230203 * safezoneW + safezoneX;
			y = 0.24 * safezoneH + safezoneY;
			w = 0.124927 * safezoneW;
			h = 0.0599908 * safezoneH;

		};
                  class loadfunStore3: w_RscButton
		{
			idc = -1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\ChopperStore\loadChopStore.sqf'";
			text = "-> Choppers";

			x = 0.230203 * safezoneW + safezoneX;
			y = 0.30 * safezoneH + safezoneY;
			w = 0.124927 * safezoneW;
			h = 0.0599908 * safezoneH;


		};
		class SelectionList: w_RscListbox
		{
			idc = funshop_item_list;
			onLBSelChanged = "[] spawn funItemInfo";

			x = 0.008857 * safezoneW + safezoneX;
			y = 0.065 * safezoneH + safezoneY;
			w = 0.184927 * safezoneW;
			h = 0.44 * safezoneH;
		};
		class BuyVehicleButton: w_RscButton
		{
			idc = -1;
			onButtonClick = "[] execVM 'client\systems\FunStore\buyfun.sqf'";
			text = "Buy";

			 x = 0.12 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.065 * safezoneW;
			h = 0.040 * safezoneH;
			color[] = {0.1,0.95,0.1,1};

		};

		class CancelButton: w_RscButton
		{
			idc = -1;
			onButtonClick = "closeDialog 0;";
			text = "Cancel";

			 x = 0.01 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.065 * safezoneW;
			h = 0.040 * safezoneH;
			color[] = {0.95,0.1,0.1,1};

		};
	};
};