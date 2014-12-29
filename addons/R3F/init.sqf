
[] spawn
{
	#include "config.sqf"
	
	#include "R3F_LOG_disable_enable.sqf"
	
	
	call compile preprocessFile format ["addons\R3F\en_strings_lang.sqf"];
	
	if (isServer) then
	{
		
		R3F_ARTY_AND_LOG_FNCT_PUBVAR_setDir =
		{
			private ["_objet", "_direction"];
			_objet = _this select 1 select 0;
			_direction = _this select 1 select 1;
			
		
			_objet setDir _direction;
			_objet setPos (getPos _objet);
		};
		"R3F_ARTY_AND_LOG_PUBVAR_setDir" addPublicVariableEventHandler R3F_ARTY_AND_LOG_FNCT_PUBVAR_setDir;
	};
	
	#ifdef R3F_ARTY_enable
		#include "R3F_ARTY\init.sqf"
		R3F_ARTY_active = true;
	#endif
	
	#ifdef R3F_LOG_enable
		#include "R3F_LOG\init.sqf"
		R3F_LOG_active = true;
	#else
		
		R3F_LOG_joueur_deplace_objet = objNull;
	#endif
	
	
	if !(isServer && isDedicated) then
	{
		execVM "addons\R3F\surveiller_nouveaux_objets.sqf";
	}
	
	else
	{
		execVM "addons\R3F\surveiller_nouveaux_objets_dedie.sqf";
	};
};