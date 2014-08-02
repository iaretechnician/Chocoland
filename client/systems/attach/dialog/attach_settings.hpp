#include "attachDefines.sqf"

class attachd {

	idd = attach_DIALOG;
	movingEnable = true;
	//enableSimulation = true;
		class controlsBackground {
                class MainBackground2: w_RscPicture
		{
			idc = picture2;
			text = "";
                        x = 0.04168 * safezoneW + safezoneX ;
			y = 0.111629 * safezoneH + safezoneY ;
			w = 0.3 * safezoneW;
			h = 0.3 * safezoneH;
			
		};

		
	};
	class controls {
		///custom
             
		class CancelButton1: w_RscButton
		{
			idc = -1;
			onButtonClick = "object1 = cursorTarget";
			text = "MainObjects";

			x = 0.320313 * safezoneW + safezoneX;
			y = 0.621852 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.07 * safezoneH;
		};
                class CancelButto2: w_RscButton
		{
			idc = -1;
			onButtonClick = "object2 = cursorTarget";
			text = "Object 2";

			x = 0.420313 * safezoneW + safezoneX;
			y = 0.621852 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.07 * safezoneH;
		};
               
                class CancelButto3: w_RscButton
		{
			idc = -1;
			onButtonClick = "closeDialog 0;[] execVM 'client\systems\attach\buyattach.sqf'";
			text = "attachbuy";

			x = 0.520313 * safezoneW + safezoneX;
			y = 0.621852 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.07 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};
                
                class CancelButton4: w_RscButton
		{
			idc = -1;
			onButtonClick = "[1] execVM 'client\systems\attach\moderate.sqf'";
			text = "X-up";

			x = 0.520313 * safezoneW + safezoneX;
			y = 0.521852 * safezoneH + safezoneY;
			w = 0.07 * safezoneW;
			h = 0.07 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};
                class CancelButton5: w_RscButton
		{
			idc = -1;
			onButtonClick = "[2] execVM 'client\systems\attach\moderate.sqf'";
			text = "X-down";

			x = 0.570313 * safezoneW + safezoneX;
			y = 0.521852 * safezoneH + safezoneY;
			w = 0.07 * safezoneW;
			h = 0.07 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};
                 class CancelButton6: w_RscButton
		{
			idc = -1;
			onButtonClick = "[3] execVM 'client\systems\attach\moderate.sqf'";
			text = "Y-up";

			x = 0.520313 * safezoneW + safezoneX;
			y = 0.421852 * safezoneH + safezoneY;
			w = 0.07 * safezoneW;
			h = 0.07 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};
                class CancelButton7: w_RscButton
		{
			idc = -1;
			onButtonClick = "[4] execVM 'client\systems\attach\moderate.sqf'";
			text = "Y-down";

			x = 0.570313 * safezoneW + safezoneX;
			y = 0.421852 * safezoneH + safezoneY;
			w = 0.07 * safezoneW;
			h = 0.07 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};
                 class CancelButton8: w_RscButton
		{
			idc = -1;
			onButtonClick = "[5] execVM 'client\systems\attach\moderate.sqf'";
			text = "Z-up";

			x = 0.520313 * safezoneW + safezoneX;
			y = 0.321852 * safezoneH + safezoneY;
			w = 0.07 * safezoneW;
			h = 0.07 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};
                class CancelButton9: w_RscButton
		{
			idc = -1;
			onButtonClick = "[6] execVM 'client\systems\attach\moderate.sqf'";
			text = "Z-down";

			x = 0.570313 * safezoneW + safezoneX;
			y = 0.321852 * safezoneH + safezoneY;
			w = 0.07 * safezoneW;
			h = 0.07 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};
                  class CancelButt2on8: w_RscButton
		{
			idc = -1;
			onButtonClick = "[7] execVM 'client\systems\attach\moderate.sqf'";
			text = "Rotate ->";

			x = 0.520313 * safezoneW + safezoneX;
			y = 0.221852 * safezoneH + safezoneY;
			w = 0.07 * safezoneW;
			h = 0.07 * safezoneH;
			color[] = {0.95,0.5,0.1,1};
		};
                class CancelButto2n9: w_RscButton
		{
			idc = -1;
			onButtonClick = "[8] execVM 'client\systems\attach\moderate.sqf'";
			text = "Rotate <-";

			x = 0.570313 * safezoneW + safezoneX;
			y = 0.221852 * safezoneH + safezoneY;
			w = 0.07 * safezoneW;
			h = 0.07 * safezoneH;
			color[] = {0.95,0.5,0.1,1};
		};
	};
};