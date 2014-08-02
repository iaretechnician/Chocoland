private ["_object", "_upordown", "_newheight", "_playerheight", "_ppos", "_atth", "_volume"];
_upordown = _this select 3;
if (R3F_LOG_mutex_local_verrou) then {
	player globalChat STR_R3F_LOG_mutex_action_en_cours;
} else {
	_object = R3F_LOG_joueur_deplace_objet;
	_pos = getPosATL _object;
	_newheight = _pos select 2;
	_ppos = getPosATL player;
	_playerheight = _ppos select 2;
	_objbound = boundingBox _object;
	_objmax = _objbound select 1;
	_volume = ((_objmax select 0) * (_objmax select 1) * (_objmax select 2));
	_attcoord = _object worldToModel _ppos;
	_atth = - (_attcoord select 2);
	switch (_upordown) do {
	case 1:
		{if ((_newheight - _playerheight) > 2.5) exitWith {player globalChat "You cant lift it so high up in the air.", "plain"; R3F_LOG_mutex_local_verrou = false;};
		_object attachTo [player, [ 0, (((boundingBox _object select 1 select 1) max (-(boundingBox _object select 0 select 1))) max ((boundingBox _object select 1 select 0) max (-(boundingBox _object select 0 select 0)))) + 1, _atth + 0.2]];};
	case 2:
		{_object attachTo [player, [ 0, (((boundingBox _object select 1 select 1) max (-(boundingBox _object select 0 select 1))) max ((boundingBox _object select 1 select 0) max (-(boundingBox _object select 0 select 0)))) + 1, _atth - 0.2]];};
	};
	R3F_LOG_mutex_local_verrou = false;
};//_smoke attachTo [_Parachute,[0,0,-1.5]];