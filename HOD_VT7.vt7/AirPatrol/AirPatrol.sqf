// AirPatrol.sqf
// © v.2 DECEMBER 2016 - Devastator_cm
// v.2.1 optimization

if (!isServer) exitWith {};
private _Vehicle				= _this select 0;
private _markerArray 		 	= _this select 1;
private _SearchRange			= (_this select 2) max 1500; // For heli min
private _SpeedLimit				= _this select 3;
private _RestartDelay			= _this select 4;
private _CommDelay				= _this select 5;
private _Base 					= _this select 6;
private _KillZone               = _this select 7;
private _EnemyFound  			= false;
private _marker 			 	= _markerArray select 0 select 0;
private _altitude 				= _markerArray select 0 select 1;
private _markersRemaining 	 	= _markerArray;
private _Destination			= false;
private _c 					 	= 0;
private _MarkerResetCounter     = 0;
private _MarkerResetDistance    = 100;  // Heli default
private _Distance2Marker		= 0;
private _CorrectionCounter      = 15;	// Heli default
private _MagsCurrent  		    = [];
private _CurrentAmmo            = 0;
private _Ammo                   = "";
private _WeaponType             = "";
private _enemies 				= [];
private _enemySides				= _Vehicle call BIS_fnc_enemySides;

while {(count (waypoints group _Vehicle)) > 0} do {deleteWaypoint ((waypoints  group _Vehicle) select 0);};
_Vehicle setSpeedMode 	"NORMAL";
_Vehicle setBehaviour 	"CARELESS";
_Vehicle setCombatMode 	"BLUE";
_Vehicle flyInHeight 	_altitude;
_Vehicle doMove (getMarkerPos _marker);
_Vehicle limitSpeed 	_SpeedLimit;
_Vehicle setVariable ["DEVAS_AirService",false,false];

if(_Vehicle isKindOf "Plane") then 
{
	_MarkerResetDistance = 250;
	_CorrectionCounter   = 25;
	_SearchRange = _SearchRange max 3500;
};

switch (side _Vehicle) do
{
    case WEST:
    {_Vehicle setVariable ["DEVAS_AirLaserType", "LaserTargetW", false];};
    case EAST:
    {_Vehicle setVariable ["DEVAS_AirLaserType", "LaserTargetE", false];};
    case INDEPENDENT:
    {_Vehicle setVariable ["DEVAS_AirLaserType", "LaserTargetI", false];};
};

{
	_MagsCurrent pushBack [_x select 0, _x select 1, _x select 2];
	_Ammo 		= [(configFile >> "CfgMagazines" >> _x select 0), "ammo", 0] call BIS_fnc_returnConfigEntry;
	_WeaponType = [(configFile >> "CfgAmmo" >> _Ammo), "simulation", "N/A"]  call BIS_fnc_returnConfigEntry;
	if(_WeaponType == "shotBullet") then {_CurrentAmmo = _x select 2;}; 
} 	foreach magazinesAllTurrets _Vehicle;

if (isNil {_Vehicle getVariable "DEVAS_AirLoadout"}) then
{	
	_Vehicle setVariable ["DEVAS_AirLoadout", _MagsCurrent, false];
	_Vehicle setVariable ["DEVAS_AirCannon",  _CurrentAmmo, false];
};

_c = 0;

if(!(_Vehicle getVariable ["DEVAS_AirSearch", false])) then {[_Vehicle, _SearchRange, _CommDelay, _KillZone] spawn DEVAS_AirPatrolSearch;};

while {alive _Vehicle && canMove _Vehicle} do 
{
	_enemies = [];
	_enemies = (_Vehicle neartargets _SearchRange) apply {_x select 4} select {side _x in _enemySides AND {count crew _x > 0} AND typeOf _x != "Logic"};
	if(!(_enemies isEqualTo [])) exitWith {_EnemyFound = true;};
	_Distance2Marker = _Vehicle distance2D (getMarkerPos _marker);
	if (_Distance2Marker > _MarkerResetDistance && _Distance2Marker < (_MarkerResetDistance * 2)) then {_MarkerResetCounter = _MarkerResetCounter + 1;};
	if (_Distance2Marker <= _MarkerResetDistance || _MarkerResetCounter == 20) then 
	{ 
		
		if (count _markersRemaining > 1) then 
		{	
			_marker 			= _markersRemaining select 1 select 0;
			_altitude 			= _markersRemaining select 1 select 1;
			_markersRemaining deleteAt (0);
			_Vehicle flyInHeight 			_altitude; 
			_Vehicle doMove getMarkerPos 	_marker;
			_c = 0;
			_MarkerResetCounter = 0;
		}
		else {_Destination = true;};
	} 
	else 
	{
		if (_c == 0) then 
		{
			_Vehicle flyInHeight _altitude;
			_Vehicle doMove getMarkerPos _marker;
		};
	};
	if (_Destination) exitwith {};
	if (_c == _CorrectionCounter) then {_c = 0} else {_c = _c + 1}; 
	sleep 0.5;
	if(fuel _Vehicle <= 0.2 || damage _Vehicle >= 0.1 || (_Vehicle getVariable "DEVAS_AirCannon") / 2 > _CurrentAmmo) exitwith
	{
		_Vehicle setVariable ["DEVAS_AirService",true,false];
		[_Vehicle, _markersRemaining, _SpeedLimit, _SearchRange, _RestartDelay, _CommDelay, _Base, _KillZone] spawn DEVAS_AirPatrolService;
	};
};

if (_Destination) then {[_Vehicle, _marker] spawn DEVAS_AirPatrolEnd;};

if(!_Destination && alive _Vehicle && canmove _Vehicle && !(_Vehicle getVariable "DEVAS_AirService")) then
{
	{
		_x setBehaviour  "Combat";
	 	_x setCombatMode "RED";
	} 	forEach crew _Vehicle;
	[_Vehicle, _markersRemaining, _SpeedLimit, _SearchRange, _RestartDelay, _CommDelay, _Base, _KillZone] spawn DEVAS_AirPatrolAttack;
};