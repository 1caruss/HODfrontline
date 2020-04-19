// AirPatrolEnd.sqf
// © v.2 DECEMBER 2016 - Devastator_cm

private _Vehicle	= _this select 0;
private _LastMarker	= _this select 1; // Last marker which air unit reached

{
	_x setSpeedMode  "NORMAL"; // Used to set the speed mode when air unit reaches last marker
    _x setCombatMode "YELLOW"; // Used to set the combat mode when air unit reaches last marker
    _x setBehaviour  "SAFE";   // Used to set the behaviour when air unit reaches last marker
} 	foreach crew _Vehicle;


if(_Vehicle == heli_1) then {_handle = [heli_1, [["m_heli_1", 40], ["m_heli_2", 70], ["m_heli_3", 120], ["m_heli_4", 120], ["m_heli_5", 80]], 800, 200, 30, [10, 20, 40], helipad_1, 250] spawn DEVAS_AirPatrol;};

if(_Vehicle == jet_1) then {_handle = [jet_1, [["m_jet_1", 150], ["m_jet_2", 250], ["m_jet_3", 350], ["m_jet_4", 450], ["m_jet_5", 300]], 1500, 280, 30, [10, 20, 40], airbase_1, 450] spawn DEVAS_AirPatrol;};