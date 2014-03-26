class CfgPatches {

	class GLT_LHD {
		units[] = {"GLT_LHD"};
		weapons[] = {};
		requiredVersion = 0.100000;
		requiredAddons[] = {"CAMisc", "CAWater2"};
	};
};
class CfgVehicles {
	class StaticShip;
	class GLT_LHD: StaticShip {
		model = "\ca\misc\empty";
		scope = 2;
		side = 1;
		faction = "USMC";
		vehicleClass = "Ship";
		picture = "\GLT_LHD\data\Picture_LHD_CA.paa";
		icon = "\GLT_LHD\data\Icon_LHD_CA.paa";
		displayName = "$STR_DN_LHD";
		mapsize = 300;
		destrType = 0;
		featureSize = 100;
		class Eventhandlers {
			init = "_scr = _this execVM ""\GLT_LHD\Data\init.sqf"";";
		};
	};
};