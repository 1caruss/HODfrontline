// AirPatrolSearch.sqf
// © v.2 DECEMBER 2016 - Devastator_cm

private _Vehicle     	= _this select 0;
private _SearchRange 	= _this select 1;
private _CommDelay   	= _this select 2;
private _KillZone	 	= _this select 3;
private _EnemySides  	= [];
private _NearEnemies 	= [];
private _enemy 			= objNull;

_Vehicle setVariable ["DEVAS_AirSearch",true,false];
_EnemySides  = [side _Vehicle] call BIS_fnc_enemySides;

while {alive _Vehicle && canmove _Vehicle} do
{
	_NearEnemies = allUnits select {_x distance _Vehicle < _SearchRange && side _x in _EnemySides};
	{ 
		_enemy 		= _x;
		if ((_Vehicle distance2D  _enemy) <= _KillZone) then 
		{
			{_x reveal [_enemy, 4];} foreach crew _Vehicle; 
		}
		else
		{ 
			{_x reveal _enemy;} foreach crew _Vehicle;
		};
	} 	forEach _NearEnemies;
	sleep random _CommDelay;
};
_Vehicle setVariable ["DEVAS_AirSearch",false,false];