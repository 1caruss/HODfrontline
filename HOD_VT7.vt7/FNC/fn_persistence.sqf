/*
 Persistence Check/Set zone marker color and remove corresponding triggers.
 By Jigsor
 Reccomened to use -loadMissionToMemory startup parameter on server.
 modified by Icaruss
*/

if (!isServer && hasInterface) exitWith{};

if ((count (profileNamespace getVariable ["HOD_FRONT_prog", []]) > 0)) then {
	if (!isServer) then {
		if (!canSuspend) exitWith {[] spawn HOD_fnc_persistence};
		uiSleep 0.3;
	} else {
		waitUntil {time > 0};
		sleep 5;
	};

	private "_uncapturedMkrs";
  
  
		_uncapturedMkrs = profileNamespace getVariable "HOD_FRONT_prog";

  
	private _capturedMkrs = [];
	private _mkr = "";
	private _trig = "";

	{
		_mkr = _x;
		if ((_mkr in all_eos_mkrs) && !(_mkr in _uncapturedMkrs)) then {
			_capturedMkrs pushBack _mkr;
		};
	} foreach all_eos_mkrs;

	{
		_mkr = _x;
		_trig = format ["EOSTrigger%1", _mkr];
		if (isNil {server getVariable [_trig, nil]}) then {
			waitUntil {!isNil {server getVariable [_trig, nil]} && {!isNull (server getVariable _trig)}};
		};
		sleep 1;
		_mkr setMarkerColor "ColorGreen";
		_mkr setMarkerAlpha 0.5;
		deleteVehicle (server getVariable _trig);
			hint format ["%1 deleted",_trig];
	} forEach _capturedMkrs;

	server setvariable ["EOSmarkers", _uncapturedMkrs, true];
	
	
	diag_log format ["***** %1 Uncaptured zone markers restored out of %2 Total zone markers", count _uncapturedMkrs, count all_eos_mkrs];

} 

else {

	profileNamespace setVariable ["HOD_FRONT_prog", []];	
	saveProfileNamespace;
};

