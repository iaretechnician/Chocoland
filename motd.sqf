if(!X_Client) exitWith {};
sleep 60;
_hint = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />Welcome To ChocoLands - Wasteland MOD BaseDefense, on this Chocoland you may to be an Animal, you can ATtach objects , you can hide objects, you can hide yourself, you can get infinite Ammunition,you are god in Parajump, you cannot unlock enemy locked objects"];
[nil,player,"loc",rHINT,_hint] call RE;

sleep 300;
while {true} do 
{
_bounty = 100 max floor((Player getvariable "bounty") * 250);
player setVariable["choco",(player getVariable"choco")+ _bounty,true];
_hint = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />earn Money by killing Npcs, Players, BaseCores, Banks, Rewards or collect it on the ChocoIsland <br />------------------------<br /><t color='#17FF41' size='1.5' shadow='2' shadowColor='#000000' align='center'>Reward $%1 </t>",_bounty];
[nil,player,"loc",rHINT,_hint] call RE;
sleep 300;
//step
_bounty = 100 max floor((Player getvariable "bounty") * 250);
player setVariable["choco",(player getVariable"choco")+ _bounty,true];
_hint = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />look for the Secret MoneyZone where you get 999$ every Second<br />------------------------<br /><t color='#17FF41' size='1.5' shadow='2' shadowColor='#000000' align='center'>Reward $%1 </t>",_bounty];
[nil,player,"loc",rHINT,_hint] call RE;
sleep 300;
//step
_bounty = 100 max floor((Player getvariable "bounty") * 250);
player setVariable["choco",(player getVariable"choco")+ _bounty,true];
_hint = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />have fun with our New Missions and beware of the shadows<br />------------------------<br /><t color='#17FF41' size='1.5' shadow='2' shadowColor='#000000' align='center'>Reward $%1 </t>",_bounty];
[nil,player,"loc",rHINT,_hint] call RE;
sleep 300;
//step
_bounty = 100 max floor((Player getvariable "bounty") * 250);
player setVariable["choco",(player getVariable"choco")+ _bounty,true];
_hint = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />Only you can unlock your locked object<br />------------------------<br /><t color='#17FF41' size='1.5' shadow='2' shadowColor='#000000' align='center'>Reward $%1 </t>",_bounty];
[nil,player,"loc",rHINT,_hint] call RE;
sleep 300;
//step
_bounty = 100 max floor((Player getvariable "bounty") * 250);
player setVariable["choco",(player getVariable"choco")+ _bounty,true];
_hint = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />We can be both of God and Devil, since we`re trying to raise the dead against the stream of Time<br />------------------------<br /><t color='#17FF41' size='1.5' shadow='2' shadowColor='#000000' align='center'>Reward $%1 </t>",_bounty];
[nil,player,"loc",rHINT,_hint] call RE;
sleep 300;
//step
_bounty = 100 max floor((Player getvariable "bounty") * 250);
player setVariable["choco",(player getVariable"choco")+ _bounty,true];
_hint = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />Please advertise for us to keep these server alive!, without advertising would the game fun would suffer !<br />------------------------<br /><t color='#17FF41' size='1.5' shadow='2' shadowColor='#000000' align='center'>Reward $%1 </t>",_bounty];
[nil,player,"loc",rHINT,_hint] call RE;
sleep 300;
//step
_bounty = 100 max floor((Player getvariable "bounty") * 250);
player setVariable["choco",(player getVariable"choco")+ _bounty,true];
_hint = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />Try the ParaStore, where u can order Weapons, Vehicles, Planes, Jets, Choppers and Buildings<br />------------------------<br /><t color='#17FF41' size='1.5' shadow='2' shadowColor='#000000' align='center'>Reward $%1 </t>",_bounty];
[nil,player,"loc",rHINT,_hint] call RE;
sleep 300;
//step
_bounty = 100 max floor((Player getvariable "bounty") * 250);
player setVariable["choco",(player getVariable"choco")+ _bounty,true];
_hint = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />Become the best in the highscore and get the Chocobonus<br />------------------------<br /><t color='#17FF41' size='1.5' shadow='2' shadowColor='#000000' align='center'>Reward $%1 </t>",_bounty];
[nil,player,"loc",rHINT,_hint] call RE;
sleep 300;
//step
_bounty = 100 max floor((Player getvariable "bounty") * 250);
player setVariable["choco",(player getVariable"choco")+ _bounty,true];
_hint = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />Have an idea? let us know what it is and maybe we can implement it on one of our server!<br />------------------------<br /><t color='#17FF41' size='1.5' shadow='2' shadowColor='#000000' align='center'>Reward $%1 </t>",_bounty];
[nil,player,"loc",rHINT,_hint] call RE;
sleep 300;
};