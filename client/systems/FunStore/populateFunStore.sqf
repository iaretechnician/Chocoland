#include "dialog\FunStoreDefines.sqf";
disableSerialization;

// Grab access to the controls
_dialog = findDisplay funshop_DIALOG;
_itemlisttext = _dialog displayCtrl funshop_item_TEXT;
_itempicture = _dialog displayCtrl funshop_item_pic;
_itemlist = _dialog displayCtrl funshop_item_list;								
_itemInfo = _dialog displayCtrl funshop_item_Info;

lbClear _itemlist;
_itemlist lbSetCurSel -1;
_itempicture ctrlSettext "";
_itemlisttext ctrlSettext "";
_itemInfo ctrlSetStructuredText parseText "";
{
	_itemlistIndex = _itemlist lbAdd format["%1",_x select 0];
} forEach FunStoreArray;