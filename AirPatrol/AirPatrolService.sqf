// AirPatrolService.sqf
// © v.2 DECEMBER 2016 - Devastator_cm
// v.2.1 optimization

private _Vehicle  			= _this select 0;
private _markerArray  		= _this select 1;
private _SpeedLimit		  	= _this select 2;
private _SearchRange		= _this select 3;
private _RestartDelay		= _this select 4;
private _CommDelay 			= _this select 5;
private _Base 				= _this select 6;
private _KillZone           = _this select 7;
private _wp 				= objNull;
private _Fuel				= 0;
private _Damage             = 0;
private _RefuelCoef         = 1/120; // 120 Sec to refuel for Heli
private _RepairCoef			= 1/180; // 180 Sec to repair for Heli
private _ServiceDone        = false;
private _RTBAltitude		= 200;  // Default for heli
private _LandingAltitude	= 100;  // Default for heli
private _MagsCurrent  		= [];
private _MagsSetup  		= [];
private _i                  = 0;
private _Gunner             = gunner _Vehicle;

if(_Vehicle isKindOf "Plane") then 
{
	_RefuelCoef         = 1/180;
	_RepairCoef			= 1/240;
	_RTBAltitude		= 400;
	_LandingAltitude	= 150;
};

{_MagsCurrent pushBack [_x select 0, _x select 1, _x select 2];} foreach magazinesAllTurrets _Vehicle;
_MagsSetup 		= _Vehicle getVariable "DEVAS_AirLoadout";

while {(count (waypoints group _Vehicle)) > 0} do {deleteWaypoint ((waypoints  group _Vehicle) select 0);};
_Vehicle setSpeedMode 	"FULL";
_Vehicle setBehaviour 	"CARELESS";
_Vehicle setCombatMode 	"YELLOW";
_Vehicle limitSpeed 9999;
if(_Vehicle distance2D  getPos _Base > 1200) then {_Vehicle flyInHeight _RTBAltitude;} else {_Vehicle flyInHeight _LandingAltitude;};
_wp = (group _Vehicle) addWaypoint [(getPos _Base), 0];
_wp setWaypointType 		"TR UNLOAD";
(group _Vehicle) setCurrentWaypoint _wp;
sleep 15;
waitUntil 
{
	sleep 10; 
	if(_Vehicle distance2D  getPos _Base <= 1200 &&  getpos _Vehicle select 2 > _LandingAltitude) then {_Vehicle flyInHeight _LandingAltitude;};
	(_Vehicle isKindOf "Plane" && speed _Vehicle == 0) || (_Vehicle isKindOf "Helicopter" && (getpos _vehicle select 2) < 1)
};
_Fuel 	= fuel 		_Vehicle;
_Damage = damage 	_Vehicle;
_Vehicle setfuel 0;
if(!isnull _Gunner && !alive _Gunner) exitwith 
{	
	{ 
		_x action ["GetOut", _Vehicle];
		[_x] allowGetIn false;
	}	foreach crew _Vehicle;
};

while{(_Fuel < 1 || _Damage != 0) && alive _Vehicle} do
{
	_Fuel 	= _Fuel + _RefuelCoef;
	sleep 1;
	_Vehicle setdamage (_Damage - _RepairCoef);
	_Damage = damage _Vehicle;
};

{_Vehicle removeMagazinesTurret  [_x select 0, _x select 1];} foreach _MagsCurrent;

for "_i" from 0 to (count  _MagsCurrent) step 1 do
{	
	if ((_MagsCurrent select _i) select 2 != (_MagsSetup select _i) select 2) then
	{

		sleep 15;
		_Vehicle addmagazineTurret [(_MagsCurrent select _i) select 0, (_MagsCurrent select _i) select 1];
	}
	else
	{
		_Vehicle addmagazineTurret [(_MagsCurrent select _i) select 0, (_MagsCurrent select _i) select 1];
	};
};
_Vehicle setfuel 1;
if(alive _Vehicle) then {[_Vehicle, _markerArray, _SearchRange, _SpeedLimit, _RestartDelay, _CommDelay, _Base, _KillZone] spawn DEVAS_AirPatrol};