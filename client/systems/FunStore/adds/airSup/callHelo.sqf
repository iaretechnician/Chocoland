_man = _this select 0;
_id = _this select 2;

_man removeAction as1;
_man removeAction as2;
_man removeAction as3;
_man removeAction as4;

if(helo)then{asf1 = _man addAction [localize "STR_MENUHATT","client\systems\FunStore\adds\airSup\sendAttHelo.sqf",[], 50, false, false, "", "_target == player"];};
if(trans)then{asf2 = _man addAction [localize "STR_MENUHTRAN","client\systems\FunStore\adds\airSup\sendTrans.sqf",[], 40, false, false, "", "_target == player"];};
asf5 = _man addAction [localize "STR_MENUEXT","client\systems\FunStore\adds\airSup\sendFixed.sqf",["exit"], 10, false, false, "", "_target == player"];

if(true)exitWith{};