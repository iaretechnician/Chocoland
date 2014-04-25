#include "menuDefines.sqf"

class confirm {

	idd = confirm_DIALOG;
	movingEnable = false;
	enableSimulation = true;
		class controlsBackground {
                class MainBackground2: w_RscPicture
		{
			idc = picture2;
			text = "";
                        x = 0.04168 * safezoneW + safezoneX ;
			y = 0.111629 * safezoneH + safezoneY ;
			w = 0.3 * safezoneW; //0.28
			h = 0.3 * safezoneH;

		};
};
class controls {

                 class loadChopStore3: w_RscButton
		{
			idc =-1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\ChopperStore\loadChopStore.sqf'";
			text = "yes";

			x = 0.020313 * safezoneW + safezoneX;
			y = 0.421852 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.07 * safezoneH;

		};
                                 
                 class loadfunStore2: w_RscButton
		{
			idc = -1;
			onButtonClick = "closeDialog 0; [] execVM 'client\systems\FunStore\loadFunStore.sqf'";
			text = "no";

			x = 0.220313 * safezoneW + safezoneX;
			y = 0.421852 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.07 * safezoneH;

		};
              
	};
};