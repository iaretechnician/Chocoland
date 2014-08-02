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

serverAdministrators = ["76561198078783807","76561198010316297","76561198032150693","76561198135184514"];  
publicVariable "serverAdministrators";