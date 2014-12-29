if(!X_Client) exitWith {};
sleep 20;
waitUntil {!respawnDialogActive}; 
chocoland globalchat"hotfix 0.1a - Healthbar back , Disable ammo truck, disable Weapons for jets, also we want to balance this Modification of Wasteland, we will also improve HIDEMYMONEY to automatically, have fun<3";
sleep 300;
_money=0;
_hint = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />Welcome %1, on this Server you have a Custom Shop for Weapons, Vehicles, Planes, Jets, Choppers and Buildings(check mousewheel), new Killing System, you can be an Animal, you can ATtach objects, you cannot unlock enemy locked objects, build your perfect Base", name player];
[nil,player,"loc",rHINT,_hint] call RE;
sleep 1;
_hint1 = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />added Vehicle Manager : use with T and change Skin, colors of the vehicle,if you buy it all player see the same color/skins <br />------------------------<br /><t color='#17FF41' size='1.5' shadow='2' shadowColor='#000000' align='center'>Reward $%1 </t>",(player getvariable["bounty",1])*500];
_hint2 = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />Playerdatabase changes: Important : you need to hide your money in locked objects if you want to keep your money over ServerRestarts<br />------------------------<br /><t color='#17FF41' size='1.5' shadow='2' shadowColor='#000000' align='center'>Reward $%1 </t>",(player getvariable["bounty",1])*500];
_hint3 = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />Send Money fix,Connection to heavensdelight fix, Gunstore -Ammo -Buy Fix,added some features on attachMode (filter only nonPlayers)<br />------------------------<br /><t color='#17FF41' size='1.5' shadow='2' shadowColor='#000000' align='center'>Reward $%1 </t>",(player getvariable["bounty",1])*500];
_hint4 = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />Change KillingSystem: yourMultiplier*enemyMultiplier*500;chocoTrader deleted,Chocos Deleted, jets are back with weapons but expensive,improve DonatorPerk:gives you all perks and +DoubleMultiplier<br />------------------------<br /><t color='#17FF41' size='1.5' shadow='2' shadowColor='#000000' align='center'>Reward $%1 </t>",(player getvariable["bounty",1])*500];
_hint5 = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />Change KillingSystem: yourMultiplier*enemyMultiplier*500;chocoTrader deleted,Chocos Deleted, jets are back with weapons but expensive,improve DonatorPerk:gives you all perks and +DoubleMultiplier<br />------------------------<br /><t color='#17FF41' size='1.5' shadow='2' shadowColor='#000000' align='center'>Reward $%1 </t>",(player getvariable["bounty",1])*500];
_hint6 = parseText format ["<t color='#FFBF00' size='2' shadow='2' shadowColor='#000000' align='center'>ChocoLand</t><br />------------------------<br />Use F5 for the Parastore, F3 for SmartAmmo, F4 to demolish your Objects<br />------------------------<br /><t color='#17FF41' size='1.5' shadow='2' shadowColor='#000000' align='center'>Reward $%1 </t>",(player getvariable["bounty",1])*500];
sleep 600;
while {true} do 
{
    waitUntil {!respawnDialogActive}; 
    []call countingbounty;
_money =  floor ((player getvariable"bounty")*500);
player setVariable["cmoney",(player getvariable["cmoney",1]) +_money,true];
_random = round (random 5)+1;
 call compile format["[nil,player,""loc"",rHINT,_hint%1] call RE;", _random];

sleep 600;

};
