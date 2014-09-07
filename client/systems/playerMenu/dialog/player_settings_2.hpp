#include "player_sys.sqf"

class playerSettings2 {

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
			w = 1.0; h = 0.65;
		};
		
			
				
	};
	
	class controls {
	
		
		class CloseButton1 : w_RscButton {
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.02; y = 0.68;
			w = 0.125; h = 0.046 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};
                class btnflipvehicle1 : w_RscButton {
		
			text = "Flip Vehicle";
			onButtonClick = "[] execVM 'client\systems\playerMenu\flipvehicle.sqf'";
			
			x = 0.160; y = 0.18;
			w = 0.225; h = 0.046 * safezoneH;
		};
                class btnflipvehicle41 : w_RscButton {
		
			text = "fix PickupMoney";
			onButtonClick = "[] execVM 'client\systems\playerMenu\fixmoney.sqf';closeDialog 0;";
            		x = 0.160; y = 0.28;
			w = 0.225; h = 0.046 * safezoneH;
		};
           
                class btnflipvehicle1121 : w_RscButton {
		
			text = "BACK TO PLAYERMENU";
			onButtonClick = "closeDialog 0;_playerDialog = createDialog 'playerSettings';";
            		x = 0; y = 0.12;
			w = 0.225; h = 0.046 * safezoneH;
		};
                
               
             
                class SafeButton11 : w_RscButton {
			idc = safeButton;
			text = "Copy Teamspeak IP to Clipboard";
			onButtonClick = "[1] execVM 'client\systems\playerMenu\copy2clip.sqf';closeDialog 0;";
			x = 0.160; y = 0.54;
			w = 0.325; h = 0.046 * safezoneH;
		};
                class SafeButton111 : w_RscButton {
			idc = safeButton;
			text = "Copy Server IP to Clipboard";
			onButtonClick = "[2] execVM 'client\systems\playerMenu\copy2clip.sqf';closeDialog 0;";
			x = 0.160; y = 0.44;
			w = 0.325; h = 0.046 * safezoneH;
		};
                 class SafeButton1121 : w_RscButton {
			idc = safeButton;
			text = "Follow us on Twitter";
			onButtonClick = "[3] execVM 'client\systems\playerMenu\copy2clip.sqf';closeDialog 0;";
			x = 0.160; y = 0.64;
			w = 0.325; h = 0.046 * safezoneH;
		};
	};

};