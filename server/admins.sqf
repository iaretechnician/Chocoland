//	@file Version: 1.0
//	@file Name: admins.sqf
//	@file Author: [404] Costlyy
//	@file Created: NA
//	@file Args:

if(!X_Server) exitWith {};

//Admin menu access levels
moderators = []; 
publicVariable "moderators"; 
           
administrators = [];
publicVariable "administrators";

serverAdministrators = [
"76561198078783807",  // ikke chocobo
"76561198010316297",  // viggomarksman
"76561198032150693",  // misterixi
"76561198135184514",  // patrick2
//"76561198074957735",  // gheotic
"76561198112291918"]; // patrick
publicVariable "serverAdministrators";