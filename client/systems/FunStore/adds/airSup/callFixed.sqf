_man = _this select 0;
_id = _this select 2;

_man removeAction as1;
_man removeAction as2;
_man removeAction as3;
_man removeAction as4;

if(jadam)then{asf1 = _man addAction ["JDAM","client\systems\FunStore\adds\airSup\sendFixed.sqf",["jdam"], 50, false, false, "", "_target == player"];};
if(lgb)then{asf2 = _man addAction ["LGB","client\systems\FunStore\adds\airSup\sendFixed.sqf",["lgb"], 40, false, false, "", "_target == player"];};
if(cbuap)then{asf3 = _man addAction ["CBU(AP)","client\systems\FunStore\adds\airSup\sendFixed.sqf",["cbuAP"], 30, false, false, "", "_target == player"];};
if(cbuat)then{asf4 = _man addAction ["CBU(AT)","client\systems\FunStore\adds\airSup\sendFixed.sqf",["cbuAT"], 20, false, false, "", "_target == player"];};
if(cbumine)then{asf7 = _man addAction ["CBU(MINE)","client\systems\FunStore\adds\airSup\sendFixed.sqf",["cbumine"], 17, false, false, "", "_target == player"];};
if(cas)then{asf6 = _man addAction ["CAS","client\systems\FunStore\adds\airSup\sendFixed.sqf",["cas"], 15, false, false, "", "_target == player"];};
asf5 = _man addAction [localize "STR_MENUEXT","client\systems\FunStore\adds\airSup\sendFixed.sqf",["exit"], 10, false, false, "", "_target == player"];

if(true)exitWith{};