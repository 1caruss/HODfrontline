//Autosave by (HOD)Icaruss


if !(isServer) exitWith {};


_HODautosave = {

private _uncapturedMkrs = all_eos_mkrs;

{
if (getMarkerColor _x == "ColorGreen")
	then {
	
		_uncapturedMkrs = _uncapturedMkrs - [_x];
		
		};
		
} foreach _uncapturedMkrs;




profileNamespace setVariable ["HOD_FRONT_prog", _uncapturedMkrs];

saveProfileNamespace;


};

waitUntil {
    _until = diag_tickTime + (30 * 60);
	


    waitUntil {sleep 1; diag_tickTime > _until;}; // wait until the timer is greater than whats time is stored in local variable _until.
    0 spawn _HODautosave; // spawn your function code
    false; // Loop waitUntil forever. Once the timing condition is met and the function has been spawned as a separate thread, it will return false and loop to the beginning of the original empty waitUntil.
};