

//check object is not op  or static house 
// set up   variable door 
doorobject = cursortarget;
if((typeof doorobject) in R3F_LOG_CFG_objets_deplacables and !R3F_LOG_mutex_local_verrou)then {
if(doorobject getvariable"playerGUID" == (name player)) then{
    R3F_LOG_mutex_local_verrou = true;
 _price = 1000;
{  if(_x select 2 == typeof doorobject)then {_price =_x select 1;};} foreach BuildStoreArray; 
_price = _price * 5;
// start ClientEVent keypress
doorvariable = true;
//kosten abziehen und frage
player setvariable["choco",(player getvariable"choco")-_price,true];
//variable auf 1 setzen
chocodoor =1;
hint format[" you set your ChocoDoor for %1$ ",_price] ;
// keypress  if variable of object 0 do UP else down 
doorobject allowDamage false;
doorobjectpos = getposatl doorobject;
 R3F_LOG_mutex_local_verrou = false;
player removeAction playerdoor;
}else {player globalchat " you cannot  use the Doorfunction on this Object because you are not the owner."};
}else{ player globalchat" This Object cannot be a Door"; R3F_LOG_mutex_local_verrou = false;};