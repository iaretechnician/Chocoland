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

serverAdministrators = ["3771202","108720582","149964550","95513542"];  
publicVariable "serverAdministrators";