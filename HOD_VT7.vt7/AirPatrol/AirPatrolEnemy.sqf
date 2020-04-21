// AirPatrolEnemy.sqf
// © v.2 DECEMBER 2016 - Devastator_cm
// v.2.1 optimization

private _Enemies  	 		= _this select 0; 
private _EnemyRatings 		= [];  //[[vehicle, rating, attack_rating, laser_rating, laser_coef, type]]
private _Typ 				= "";
private _Rating 			= 0;
private _MaxRating      	= 0;
private _BestEnemy			= [];
private _Enemy          	= objNull;
private _LaserRating    	= 0;
private _LaserRatingCoef 	= 0;
private _i 					= 0;
private _RandomEnemy		= objNull;
{
	_Typ 				= "unknown";
	_Rating 		 	= 0;
	_LaserRatingCoef 	= 0;
	if(_x isKindOf "LandVehicle") then 
	{	
		_Typ 				= "LandVehicle";
		_Rating 			= 4;
		_LaserRatingCoef 	= 4;
		if (_x isKindOf "Tank") then
		{
			_Typ 				= "Tank";
			_Rating 			= 5;
			_LaserRatingCoef 	= 15;
		};
		if (_x isKindOf "Truck" || _x isKindOf "Truck_F") then
		{
			_Typ = "Truck";
			_Rating = 2;
		};
		if (_x isKindOf "StaticWeapon") then
		{
			_Typ 				= "Static";
			_Rating 			= 3;
			_LaserRatingCoef 	= 2;
		};
	};
	if(_x isKindOf "Man") then 
	{
		_Typ    = "Man";
		_Rating = 1;
	};
	if(_x isKindOf "Air") then 
	{
		_Typ    = "Air";
		_Rating = 40;
	};

	//_EnemyRatings = _EnemyRatings + [[_x, _Rating, _Rating, _LaserRating, _LaserRatingCoef, _Typ]];
	_EnemyRatings pushBack [_x, _Rating, _Rating, _LaserRating, _LaserRatingCoef, _Typ];
}	foreach _Enemies;

{
	_Enemy 			= _x;
	_LaserRating 	= 0;
	{
		if(_Enemy distance2D (_x select 0) < 20) then{_LaserRating = _LaserRating + (_x select 1);};
	}	foreach _EnemyRatings;

	for "_i" from 0 to (count _EnemyRatings) step 1 do 
	{
		if(_Enemy == _EnemyRatings select _i select 0) exitwith 
		{
			_EnemyRatings select _i set [2, _LaserRating + (_EnemyRatings select _i select 4)];
			_EnemyRatings select _i set [3, _LaserRating];
			};
	};	
}	foreach _Enemies;

{
	if((_x select 2) > _MaxRating) then {_MaxRating = (_x select 2);};
}	foreach _EnemyRatings;

{
	if(_x select 2 == _MaxRating) then {_BestEnemy pushBack _x;};
}	foreach _EnemyRatings;
_RandomEnemy = selectRandom _BestEnemy;

_RandomEnemy