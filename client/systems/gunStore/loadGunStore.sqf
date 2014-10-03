
//	@file Version: 1.0

//	@file Name: loadGunStore.sqf

//	@file Author: [404] Deadbeat

//	@file Created: 20/11/2012 05:13

//	@file Args:


#include "dialog\gunstoreDefines.sqf";


disableSerialization;

_gunshopDialog = createDialog "gunshopd";

gunStoreCart = 0;

_dialog = findDisplay gunshop_DIALOG;

_playerMoney = _dialog displayCtrl gunshop_money;

_money = player getVariable "choco";
_money = player getVariable "choco";

_playerMoney CtrlsetText format["Cash: $%1", _money];
loadout=[];
