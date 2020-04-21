// Force zone marker progression saving on Server

if (!isServer) exitWith {};

private _uncapturedMkrs = all_eos_mkrs;

{if (getMarkerColor _x isEqualTo "ColorGreen") then {_uncapturedMkrs = _uncapturedMkrs - [_x];};} foreach _uncapturedMkrs;

profileNamespace setVariable ["BMR_INS_progress", _uncapturedMkrs];

saveProfileNamespace;

[{hint "Save!";},"BIS_fnc_spawn",false,true] call BIS_fnc_MP;