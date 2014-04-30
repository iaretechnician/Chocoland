//	@file Version: 1.0
//	@file Name: createCargoItem.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 26/1/2013 15:19

if(!isServer) exitwith {};

private["_parachuteClass","_dropPosition","_itemClass","_parachute","_cargo","_effectSmoke"];

_parachuteClass = _this select 0;
_dropPosition = _this select 1;
_itemClass = _this select 2;

_parachute = createVehicle [_parachuteClass, _dropPosition, [], 0, "NONE"];
_cargo = createVehicle [_itemClass, _dropPosition, [], 0, "NONE"];
_cargo attachTo [_parachute, [0,0,3]];
_parachute setpos _dropPosition;

if(_itemClass == "Land_stand_small_EP1") then
{
	_cargo setVariable["food",20,true];
};
if(_itemClass == "USBasicWeaponsBox") then
{
	 _cargo addWeaponCargoGlobal ["SVD_des_EP1",1];
     _cargo addWeaponCargoGlobal ["PK",1];
    _cargo addWeaponCargoGlobal ["SCAR_H_LNG_Sniper_SD",1];
		_cargo addWeaponCargoGlobal ["M16A4_ACG_GL",20];
		_cargo addWeaponCargoGlobal ["M4A1_HWS_GL",20];
		_cargo addWeaponCargoGlobal ["M4A1_AIM_SD_camo",20];
		_cargo addWeaponCargoGlobal ["M4A1_HWS_GL_SD_Camo",20];	
		_cargo addWeaponCargoGlobal ["M4A3_RCO_GL_EP1",20];
	   _cargo addWeaponCargoGlobal ["Binocular_Vector",10];
		_cargo addWeaponCargoGlobal ["NVGoggles",5];
		_cargo addWeaponCargoGlobal ["Binocular",5];
               _cargo addWeaponCargoGlobal ["M9SD",20];
		_cargo addWeaponCargoGlobal ["MakarovSD",20];
        
        // Add ammunition
         _cargo addMagazineCargoGlobal ["15Rnd_9x19_M9SD",50];
      _cargo addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD",50];
         _cargo addMagazineCargoGlobal ["20rnd_762x51_SB_SCAR",10];
        _cargo addMagazineCargoGlobal ["10Rnd_762x54_SVD",10];
         _cargo addMagazineCargoGlobal ["100Rnd_762x54_PK",10];
    _cargo addMagazineCargoGlobal ["30Rnd_556x45_Stanag",50];
		_cargo addMagazineCargoGlobal ["30Rnd_556x45_StanagSD",50];
       _cargo addMagazineCargoGlobal ["1Rnd_HE_M203",50];
 _cargo addMagazineCargoGlobal ["1Rnd_Smoke_M203",50];
	_cargo addMagazineCargoGlobal ["SmokeShell",50];
	_cargo addMagazineCargoGlobal ["SmokeShellRed",50];
		_cargo addMagazineCargoGlobal ["SmokeShellGreen",50]; 
};
if(_itemClass == "RUBasicWeaponsBox") then
{
	 // Add new weapons before ammunition
          _cargo addWeaponCargoGlobal ["AK_107_kobra",40];
		 _cargo addWeaponCargoGlobal ["AK_107_GL_kobra",20];
		 _cargo addWeaponCargoGlobal ["AKS_74_U",40];
		 _cargo addWeaponCargoGlobal ["MakarovSD",80];	
          _cargo addWeaponCargoGlobal ["SCAR_H_CQC_CCO",20];
		 _cargo addWeaponCargoGlobal ["SCAR_H_CQC_CCO_SD",1];
		 _cargo addWeaponCargoGlobal ["SCAR_H_STD_EGLM_Spect",30];
		 _cargo addWeaponCargoGlobal ["SCAR_H_LNG_Sniper",1];
		 _cargo addWeaponCargoGlobal ["DMR",1];
		 _cargo addWeaponCargoGlobal ["M32_EP1",20];	
		 _cargo addWeaponCargoGlobal ["Mk13_EP1",20];	
        _cargo addWeaponCargoGlobal ["Binocular_Vector",10];
		 _cargo addWeaponCargoGlobal ["NVGoggles",5];
		 _cargo addWeaponCargoGlobal ["Binocular",5];
        // Add ammunition
    _cargo addMagazineCargoGlobal ["20Rnd_762x51_DMR",10];
   _cargo addMagazineCargoGlobal ["30Rnd_545x39_AK",50];
   _cargo addMagazineCargoGlobal ["8Rnd_9x18_MakarovSD",30];
     _cargo addMagazineCargoGlobal ["HandGrenade",50];
      _cargo addMagazineCargoGlobal ["1Rnd_HE_GP25",50];
      _cargo addMagazineCargoGlobal ["1Rnd_SMOKE_GP25",50];
       _cargo addMagazineCargoGlobal ["20rnd_762x51_B_SCAR",30];
		 _cargo addMagazineCargoGlobal ["20rnd_762x51_SB_SCAR",30];
         _cargo addMagazineCargoGlobal ["1Rnd_HE_M203",150];
        _cargo addMagazineCargoGlobal ["1Rnd_Smoke_M203",60];
		 _cargo addMagazineCargoGlobal ["1Rnd_SmokeRed_M203",20];
		 _cargo addMagazineCargoGlobal ["FlareWhite_M203",20];
		 _cargo addMagazineCargoGlobal ["FlareRed_M203",20];
       _cargo addMagazineCargoGlobal ["6Rnd_HE_M203",40];
		 _cargo addMagazineCargoGlobal ["6Rnd_Smoke_M203",40];
		 _cargo addMagazineCargoGlobal ["6Rnd_FlareWhite_M203",20];
		 _cargo addMagazineCargoGlobal ["6Rnd_FlareRed_M203",20];
	 _cargo addMagazineCargoGlobal ["6Rnd_SmokeRed_M203",20];
};

_effectSmoke = "smokeShellPurple" createVehicle _dropPosition;
_effectSmoke attachto [_cargo, [0,0,0]];