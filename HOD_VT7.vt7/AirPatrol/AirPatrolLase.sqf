// AirPatrolLase.sqf
// © v.2 DECEMBER 2016 - Devastator_cm
// v.2.1 side command fixed
// Laser range for heli

private _Vehicle		= _this select 0;
private _Enemy 			= _this select 1;
private _LaserRating 	= _this select 2;
private _Lase 			= false;
private _Laser          = objNull;
private _LaserRange		= 700; // 700 meters minimum is for Heli
private _i              = 0;

if(_Vehicle isKindOf "Plane") then 
{
	_LaserRange = 1200;
};

if(_Enemy isKindOf "Tank" || _LaserRating > 10) then {_Lase = true;}
else
{
	_rnd      = floor random 100;
	_required = (10 - _LaserRating) * 10;
	if(_rnd > _required && _LaserRating >= 4) then {_Lase = true;};

};

if(_Lase) then
{   
	waituntil {((_Vehicle getreldir _Enemy) <= 60 || (_Vehicle getreldir _Enemy) >= 300) && (_Vehicle distance2D _Enemy) > _LaserRange && alive _Vehicle && canmove _Vehicle};
	if(!alive _Vehicle || !canmove _Vehicle) exitwith {};
	_Laser = createVehicle [(_Vehicle getVariable "DEVAS_AirLaserType"), [0,0,0], [], 0, "NONE"];
	_Laser attachto [_Enemy, [0, 0, 0]];
	_Enemy setVariable ["DEVAS_AirLaserOn", true, false];
	while{_i < 1800} do
	{
		sleep 0.1;
	    if(!alive _Enemy || (!canmove _Enemy && (count crew _Enemy) == 0) || !alive _Vehicle || (count crew _Enemy) == 0 || !canmove _Vehicle || _Enemy getVariable ["ace_cookoff_isCookingOff", false]) exitwith {};
	    _i = _i + 1;
	};
	deletevehicle (_Laser);
	_Enemy setVariable ["DEVAS_AirLaserOn", false, false];
};