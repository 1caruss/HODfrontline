//EOS SYSTEM by banga bob - modified by HOD
[]execVM "eos\OpenMe.sqf";

// ====================================================================================

//MHQ Tracker by Tetlys
[] execVM "scripts\mhqTrack.sqf"; 

// ====================================================================================
// Execute Airfell's Keypad
_nul = []execVM "AF_Keypad\AF_KP_vars.sqf";
// ====================================================================================

// Set initial public variables
if (IsServer) then {
//	To create a random code un-comment the follow three lines and comment out code = "1234"
//	creates a random four to six digit code
//	cipher = floor random [1000,550000,999999];
//	publicVariable 'cipher';
//	code = format ["%1",cipher];
	code = "1234";
	publicVariable 'code';
};
// ====================================================================================

//Engima's Dynamic Civilians Script

call compile preprocessFileLineNumbers "Engima\Civilians\Common\Common.sqf";
call compile preprocessFileLineNumbers "Engima\Civilians\Common\Debug.sqf";

// The following constants may be used to tweak behaviour

ENGIMA_CIVILIANS_SIDE = civilian;      // If you for some reason want the units to spawn into another side.
ENGIMA_CIVILIANS_MINSKILL = 0.4;       // If you spawn something other than civilians, you may want to set another skill level of the spawned units.
ENGIMA_CIVILIANS_MAXSKILL = 0.6;       // If you spawn something other than civilians, you may want to set another skill level of the spawned units.

ENGIMA_CIVILIANS_MAXWAITINGTIME = 300; // Maximum standing still time in seconds
ENGIMA_CIVILIANS_RUNNINGCHANCE = 0.05; // Chance of running instead of walking

// Civilian personalities
ENGIMA_CIVILIANS_BEHAVIOURS = [
	["CITIZEN", 100] // Default citizen with ordinary behaviour. Spawns in a house and walks to another house, and so on...
];


ENGIMA_CIVILIANS_INSTANCE_NO = 0;

if (isServer) then {
	call compile preprocessFileLineNumbers "Engima\Civilians\Server\ServerFunctions.sqf";
	call compile preprocessFileLineNumbers "Engima\Civilians\ConfigAndStart.sqf";
};

// ====================================================================================

//genesis92x Vcom AI Script - Exec Fnc

[] execVM "Vcom\VcomInit.sqf";

// ====================================================================================
null=[] call HOD_fnc_autosave;
