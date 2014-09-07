#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'client\systems\playerMenu\item_list.sqf'";
	
	class controlsBackground {
		
			class MainBG : w_RscPicture {
			idc = -1;
			text = "ui_background_controlers_ca.paa";		
			moving = true;
			x = 0.0; y = 0.1;
			w = 1.4; h = 0.65;
		};
		
		
		class MainTitle : w_RscText {
			idc = -1;
			text = "Player Inventory Menu";
			sizeEx = 0.04;
			shadow = 2;		
			x = 0.260; y = 0.112;
			w = 0.3; h = 0.05;
		};
                //highscorestart
		class highscoreTitle : w_RscText {
			idc = -1;
			text = "your Highscore";
			sizeEx = 0.05;shadow = 2;		
			x = 0.800; y = 0.112;
			w = 0.3; h = 0.05;
		};
                class highscore1 : w_RscText {
			idc = highscore1;
			text = "Total Kills:";
			sizeEx = 0.03;
			x = 0.75; y = 0.19;
			w = 0.3; h = 0.05;
		};
                class highscore2 : w_RscText {
			idc = highscore2;
			text = "Winning streak:";
			sizeEx = 0.03;
			x = 0.75; y = 0.23;
			w = 0.3; h = 0.05;
		};
                class highscore3 : w_RscText {
			idc = highscore3;
			text = "Deaths:";
			sizeEx = 0.03;
			x = 0.75; y = 0.27;
			w = 0.3; h = 0.05;
		};
                class highscore8 : w_RscText {
			idc = highscore8;
			text = "Cleared Missions:";
			sizeEx = 0.03;
			x = 0.75; y = 0.31;
			w = 0.3; h = 0.05;
		};
                class highscore4 : w_RscText {
			idc = highscore4;
			text = "Money Payed:";
			sizeEx = 0.03;
			x = 0.75; y = 0.35;
			w = 0.3; h = 0.05;
		};
                class highscore5 : w_RscText {
			idc = highscore5;
			text = "Money Earned:";
			sizeEx = 0.03;
			x = 0.75; y = 0.39;
			w = 0.3; h = 0.05;
		};
                class highscore6 : w_RscText {
			idc = highscore6;
			text = "Time played:";
			sizeEx = 0.03;
			x = 0.75; y = 0.43;
			w = 0.3; h = 0.05;
		};
                 class highscore7 : w_RscText {
			idc = highscore7;
			text = "Total Walked:";
			sizeEx = 0.03;
			x = 0.75; y = 0.47;
			w = 0.3; h = 0.05;
		};
                //highscore end
		class moneyIcon : w_RscPicture {	
	  		idc = -1;
        	text = "\CA\misc\data\icons\picture_money_CA.paa";
        	x = 0.02; y = 0.32;
			w = 0.04; h = 0.04;
		};
		
		class waterIcon : w_RscPicture {
	  		idc = -1;
        	text = "client\icons\water.paa";
        	x = 0.015; y = 0.19;
			w = 0.05; h = 0.05;
		};
		
		class foodIcon : w_RscPicture {
      		idc = -1;
        	text = "client\icons\food.paa";
        	x = 0.02; y = 0.26;
			w = 0.04; h = 0.04;
		};
		
		class moneyText : w_RscText {
			idc = money_text;
			text = "";
			sizeEx = 0.03;
			x = 0.06; y = 0.313;
			w = 0.3; h = 0.05;
		};
		
		class foodText : w_RscText {	
			idc = food_text;
			sizeEx = 0.03;
			text = "";
			x = 0.06; y = 0.254;
			w = 0.3; h = 0.05;
		};
		
		class waterText : w_RscText {	
			idc = water_text;
			text = "";
			sizeEx = 0.03;
			x = 0.06; y = 0.193;
			w = 0.3; h = 0.05;
		};

		class distanceText : w_RscText {	
			idc = view_range_text;
			text = "View range:";
			sizeEx = 0.025;
			x = 0.03; y = 0.40;
			w = 0.3; h = 0.02;
		};
                class vehIcon : w_RscPicture {
      		idc = -1;
        	text = "client\icons\driver.paa";
        	x = 0.02; y = 0.26;
			w = 0.04; h = 0.04;
		};
		
		class saveVehicleText : w_RscText {
			idc = saveVehicleText_text;
			text = "";
			sizeEx = 0.04;
			x = 0.160; y = 0.46;
			w = 0.3; h = 0.05;
		};
                class saveVehicle2Text : w_RscText {
			idc = saveVehicleText2_text;
			text = "";
			sizeEx = 0.04;
			x = 0.160; y = 0.55;
			w = 0.3; h = 0.05;
		};
	};
	
	class controls {
	
		class itemList : w_Rsclist {
			idc = item_list;
			x = 0.49; y = 0.200;
			w = 0.235; h = 0.325;
		};
		
		class DropButton : w_RscButton {
			text = "Drop";
			onButtonClick = "[1] execVM 'client\systems\playerMenu\itemfnc.sqf'";
			x = 0.610; y = 0.54;
			w = 0.125; h = 0.033 * safezoneH;
		};
		
		class UseButton : w_RscButton {
			text = "Use";
			onButtonClick = "[0] execVM 'client\systems\playerMenu\itemfnc.sqf'";
			x = 0.48; y = 0.54;
			w = 0.125; h = 0.033 * safezoneH;	
		};

		class moneyInput: w_RscCombo {
			idc = money_value;
			x = 0.625; y = 0.605;
			w = .1; h = .030;
		};
		class playerInput: w_RscCombo {
			idc = player_value;
			x = 0.625; y = 0.655;
			w = .1; h = .030;
		};
		
		class DropcButton : w_RscButton {
			text = "Drop Money";
			onButtonClick = "[] execVM 'client\systems\playerMenu\dropMoney.sqf'";
			x = 0.48; y = 0.60;
                            w = 0.135; h = 0.033 * safezoneH;
		};
		
		class CloseButton : w_RscButton {
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.02; y = 0.68;
			w = 0.125; h = 0.046 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};
              
                class btnflipvehicle112 : w_RscButton {
		
			text = "Helpful TAB";
			onButtonClick = "closeDialog 0;_playerDialog = createDialog 'playerSettings2';";
            		x = 0; y = 0.12;
			w = 0.225; h = 0.046 * safezoneH;
		};
                    class btnflipvehicle12 : w_RscButton {
		
			text = ".";
			onButtonClick = "[]execVM'client\functions\getoutParachute.sqf';closeDialog 0;";
            		x = 0.59; y = 0.12;
			w = 0.05; h = 0.05;
		};
                 class btnf2lipvehicle4 : w_RscButton {
		
			text = "set ChocoDoor again";
			onButtonClick = "chocodoor =0;closeDialog 0;";
            		x = 0.160; y = 0.68;
			w = 0.225; h = 0.046 * safezoneH;
		};
               
               class SafeB2utton : w_RscButton {
			idc = safeButton;
			text = "autoPickupMoney on/off";
			onButtonClick = "[] execVM 'addons\scripts\moneypickup.sqf';closeDialog 0;";
			x = 0.360; y = 0.68;
			w = 0.225; h = 0.046 * safezoneH;
		};
                 class info1Button1 : w_RscButton {
			idc = safeButton;
			text = "introduction";
			onButtonClick = "call infointro;closeDialog 0;";
			x = 0.160; y = 0.18;
			w = 0.235; h = 0.049 * safezoneH;
		};
             
                  class SafeButton1 : w_RscButton {
			idc = safeButton;
			text = "Save Player";
			onButtonClick = "[] execVM 'addons\scripts\saveplayer.sqf';closeDialog 0;";
			x = 0.160; y = 0.28;
			w = 0.235; h = 0.049 * safezoneH;
		};
             
                  class vehButton : w_RscButton {
			idc = vehButton;
			text = "Spawn My Vehicle";
			onButtonClick = "[] execVM 'addons\scripts\createVehicle.sqf';closeDialog 0;";
			x = 0.160; y = 0.38;
			w = 0.235; h = 0.049 * safezoneH;
		};

		class GroupsButton : w_RscButton {
			idc = groupButton;
			text = "Group Management";
			onButtonClick = "[] execVM 'client\systems\groups\loadGroupManagement.sqf'";
			x = 0.160; y = 0.18;
			w = 0.235; h = 0.049 * safezoneH;
		};

		class btnDistanceNear : w_RscButton {
			text = "Near";
			onButtonClick = "setViewDistance 1100;";
			x = 0.02; y = 0.45;
			w = 0.125; h = 0.033 * safezoneH;
		};

		class btnDistanceMedium : w_RscButton {
			text = "Medium";
			onButtonClick = "setViewDistance 2200;";
			x = 0.02; y = 0.50;
			w = 0.125; h = 0.033 * safezoneH;
		};

		class btnDistanceFar : w_RscButton {
			text = "Far";
			onButtonClick = "setViewDistance 3300;";
			x = 0.02; y = 0.55;
			w = 0.125; h = 0.033 * safezoneH;
		};
		class btnDistanceInsane : w_RscButton {
			text = "Insane";
			onButtonClick = "setViewDistance 5000;";
			x = 0.02; y = 0.60;
			w = 0.125; h = 0.033 * safezoneH;
		};
		
	};

};