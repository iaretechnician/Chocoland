

#include "dialog\chopstoreDefines.sqf";

disableSerialization;

//Initialize Values
_chop_type = "";
_price = 0;
_picture = "";
// Grab access to the controls
_dialog = findDisplay chopshop_DIALOG;
_itemlist = _dialog displayCtrl chopshop_item_list;
_itemlisttext = _dialog displayCtrl chopshop_money;
_vehiclepicture = _dialog displayCtrl chopshop_vehicle_pic;
//Get Selected Item
_selectedItem = lbCurSel _itemlist;
_itemText = _itemlist lbText _selectedItem;
_itemlisttext ctrlSetText format ["Price: 0$"];	
_vehiclepicture ctrlSettext _picture;

//Check Items Price
{if(_itemText == _x select 0) then{ 
	_type = _x select 2;
	_price = _x select 1;
	_picture = getText (configFile >> "cfgVehicles" >> _type >> "picture");
        _vehiclepicture ctrlSettext _picture;
         _price=[_price] call fnc_number;
_itemlisttext ctrlSetText format ["Price: %1$", _price];

}
}forEach ChopperStoreArray;
