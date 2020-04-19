// AirPatrolAttack.sqf
// © v.2 DECEMBER 2016 - Devastator_cm
// v.2.1 filter out Logic objects + restart taki * 10 silindi + Loiter eklendi

private _Vehicle  			= _this select 0;
private _markerArray  		= _this select 1;
private _SpeedLimit		  	= _this select 2;
private _SearchRange		= _this select 3;
private _RestartDelay		= _this select 4;
private _CommDelay 			= _this select 5; 
private _Base 				= _this select 6;
private _KillZone           = _this select 7;
private _StopSearch    		= false;
private _all_units     	 	= [];
private _EnemyFound 		= true;
private _enemies 			= [];
private _random 			= 0;
private _random_enemy 		= objNull;
private _enemy 				= objNull;
private _posEnemy   		= [];
private _wp 				= objNull;
private _distance			= objNull;
private _EnemySet 			= false;
private _NewEnemyCounter    = 0;
private _NewEnemyCntLimit 	= 900; // Heli default
private _enemySides			= _Vehicle call BIS_fnc_enemySides;
private _LaserLock          = 0;
private _CurrentAmmo        = 0;
private _Ammo               = "";
private _WeaponType         = "";
private _Gunner             = gunner _Vehicle;
private _LoiterRadius		= 200; // Heli default

_Vehicle limitSpeed 9999;
_wp = (group _Vehicle) addWaypoint [(getPos _Vehicle), 0];
_wp setWaypointType 		"CYCLE";
_wp setWaypointBehaviour 	"COMBAT";
_wp setWaypointCombatMode 	"RED";
_wp setWaypointSpeed    	"NORMAL";
if(_Vehicle isKindOf "Plane") then 
{
	_NewEnemyCntLimit   = 1500;
	_LoiterRadius		= 800;
};

sleep 1;

while {!_StopSearch} do 
{ 	
	{
		_Ammo 		= [(configFile >> "CfgMagazines" >> _x select 0), "ammo", 0] call BIS_fnc_returnConfigEntry;
		_WeaponType = [(configFile >> "CfgAmmo" >> _Ammo), "simulation", "N/A"]  call BIS_fnc_returnConfigEntry;
		if(_WeaponType == "shotBullet") exitwith {_CurrentAmmo = _x select 2;};
	} 	foreach magazinesAllTurrets _Vehicle;

	if(fuel _Vehicle <= 0.2 || damage _Vehicle >= 0.5 || (_Vehicle getVariable "DEVAS_AirCannon") / 5 > _CurrentAmmo || (!isnull _Gunner && !alive _Gunner)) exitwith
	{ 
		_Vehicle setVariable ["DEVAS_AirService",true,false];
		[_Vehicle, _markerArray, _SearchRange, _SpeedLimit, _RestartDelay, _CommDelay, _Base, _KillZone] spawn DEVAS_AirPatrolService;
	};
	if(!_EnemyFound && !_StopSearch) then 
	{
		_wp setWaypointPosition [(getPos _Vehicle), 0];
		_wp setWaypointType 			"LOITER";
		_wp setWaypointLoiterRadius 	_LoiterRadius;
		_wp setWaypointLoiterType 		"CIRCLE";
	    (group _Vehicle) setCurrentWaypoint _wp;
	    sleep 			_RestartDelay; 
		_StopSearch 	= true;
	};
    _EnemyFound = false;
    _enemies = [];
	_enemies = (_Vehicle neartargets _SearchRange) apply {_x select 4} select {side _x in _enemySides AND {count crew _x > 0} AND typeOf _x != "Logic"};
	if (count _enemies != 0) then
	{ 
	   	_EnemyFound  = true;
	   	_StopSearch  = false;
	   	if(_EnemySet) then
	   	{
	   		_posEnemy  	= _Vehicle getVariable "DEVAS_AirEnemyPos";
	   		_enemy 		= _Vehicle getVariable "DEVAS_AirEnemy";
	   		_distance 	= _enemy distance2D  _posEnemy;
	   		if ((_distance >= 100 && !(_enemy isKindOf "Air")) || (_distance >= 2000 && _enemy isKindOf "Air") || 
	   		     !alive _enemy || (!canmove _enemy && (count crew _enemy) == 0) || (count crew _enemy) == 0 || 
	   		     _NewEnemyCounter >= _NewEnemyCntLimit || _enemy getVariable ["ace_cookoff_isCookingOff", false]) then 
	   		{_EnemySet = false;};
	   	};
	   	if(!_EnemySet) then
	   	{
	    	_random_enemy 		= [_enemies] call DEVAS_AirPatrolEnemy;
			_posEnemy   		= getPos (_random_enemy select 0);
			_Vehicle setVariable ["DEVAS_AirEnemy", _random_enemy select 0, false];
			_Vehicle setVariable ["DEVAS_AirEnemyPos", _posEnemy, false];
			_EnemySet 			= true;
			_NewEnemyCounter    = 0;
			// Following lines are for debug. It is to see to which position vehicle will attack
			//_vclPosMrkr = createMarkerLocal [format ["mrkr_%1_%2", _Vehicle, _d], _posEnemy];
			//_vclPosMrkr setMarkerTextLocal format["_%1_%2", _Vehicle, _d];
			//_vclPosMrkr setMarkerTypeLocal "hd_destroy"; 
			//_d = _d + 1;
			_wp setWaypointType 		"CYCLE";
			_wp setWaypointPosition [_posEnemy, 0];
			(group _Vehicle) setCurrentWaypoint _wp;
			{
				_x doTarget (_random_enemy select 0);
				_x doFire   (_random_enemy select 0);
			} 	forEach crew _Vehicle;
			{
				_Ammo 		= [(configFile >> "CfgMagazines" >> _x), "ammo", 0] call BIS_fnc_returnConfigEntry;
				_LaserLock 	= [(configFile >> "CfgAmmo" >> _Ammo), "laserLock", 0] call BIS_fnc_returnConfigEntry;
				if(_LaserLock == 1 && !((_random_enemy select 0) getVariable ["DEVAS_AirLaserOn", false]) && !((_random_enemy select 0) isKindOf "Air")) exitwith 
				{
					[_Vehicle, _random_enemy select 0, _random_enemy select 3] spawn DEVAS_AirPatrolLase;
				};
			} foreach magazines _Vehicle;
		};
	};
	_NewEnemyCounter = _NewEnemyCounter + 1;
	sleep 0.1;
};

if (alive _Vehicle && canMove _Vehicle && !(_Vehicle getVariable "DEVAS_AirService")) then {[_Vehicle, _markerArray, _SearchRange, _SpeedLimit, _RestartDelay, _CommDelay, _Base, _KillZone] spawn DEVAS_AirPatrol;};