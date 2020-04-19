


//________________  Author : GEORGE FLOROS [GR] ___________ 16.12.18 _____________

/*
________________ GF Missions Script ________________

https://forums.bohemia.net/forums/topic/219080-gf-missions-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


//________________ Missions Settings _____________
//________________ Set true or false  _____________

//________________ You can disable them completly in the Missions_init _____________

_EOS_Spawn 					= false;					
_DAC_Spawn 					= false;					
_Custom_Spawn 				= true;					




sleep GF_Missions_Wait_Time;

diag_log "//________________	4_Snipers_Hide.sqf	Initializing	_____________";
diag_log "________________	taskSetState	4_Snipers_Hide_1	________________";
diag_log "________________	taskSetState	4_Snipers_Hide_2	________________";


if (GF_Missions_Systemchat_info) then {
systemchat "4_Snipers_Hide Initializing";
};




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Select the spawn Position	________________
/*
//________________	To use this add	________________
GF_Missions_pos = [] call GF_Missions_Pos_isFlatEmpty;	

//________________	There is a test spawn inside the script	________________
//________________	uncomment and use ex : 	________________ 
[]spawn GF_Missions_Pos_isFlatEmpty;

GF_Missions_Pos_isEmpty
GF_Missions_Pos_isFlat
GF_Missions_Pos_isFlatEmpty

GF_Missions_Pos_Random_Building
GF_Missions_Pos_Residential

GF_Missions_Pos_Airport_Tanoa_Only
GF_Missions_Pos_Hill
GF_Missions_Pos_Mount
GF_Missions_Pos_NameCity
GF_Missions_Pos_NameCityCapital
GF_Missions_Pos_NameLocal
GF_Missions_Pos_NameMarine
GF_Missions_Pos_NameVillage

GF_Missions_Pos_ShoreLine_Shore
GF_Missions_Pos_ShoreLine_Water
GF_Missions_Pos_Found
*/


//________________	Select the spawn Position	________________

GF_Missions_pos = [] call GF_Missions_Pos_Mount;


waitUntil {GF_Missions_pos_initialized};
waitUntil {time >5};

//________________	This will be used for DAC and any other position will be as	 _2 , _3 , etc	________________
_Pos_1 = GF_Missions_pos;



//________________	Spawn Objects	________________

_Building_array = [
// 	Land_BagBunker_Large_F	Land_BagBunker_Small_F	Land_BagBunker_Small_F
"CamoNet_INDP_F",
"CamoNet_BLUFOR_F",
"CamoNet_OPFOR_F",
"CamoNet_INDP_open_F",
"CamoNet_BLUFOR_open_F",
"CamoNet_OPFOR_open_F",
"CamoNet_INDP_big_F",
"CamoNet_BLUFOR_big_F",
"CamoNet_OPFOR_big_F"
]; 

_Building_Spawn = selectRandom _Building_array;
_Building = _Building_Spawn createVehicle _Pos_1;
_Building setDir (random 360);


//________________ Positions of objects  ________________
_Group_Pos = _Building getRelPos [0, 12];
_Flag_Pos = _Building getRelPos [6, 12];
_Object_1_Pos = _Building getRelPos [3, 6];
_Object_2_Pos = _Building getRelPos [1, 3];
_Object_3_Pos = _Building getRelPos [5, 8];


//________________ Create _Object_1 ________________
_Object_1_array = selectRandom [
"Land_SatelliteAntenna_01_F",
"Land_SatelliteAntenna_01_F",
"Land_Photos_V3_F",
"Land_Photos_V2_F",
"Land_Photos_V1_F",
"Land_Notepad_F"
]; 
_Object_1 = createVehicle [_Object_1_array, _Object_1_Pos, [], 0, "CAN_COLLIDE"];
_Object_1 setDir (random 360);


//________________ Create _Object_2 ________________
_Object_2_array = selectRandom [
"ShootingMat_01_OPFOR_F",
"ShootingMat_01_Khaki_F",
"ShootingMat_01_folded_OPFOR_F",
"ShootingMat_01_Olive_F",
"ShootingMat_01_folded_Khaki_F",
"ShootingMat_01_folded_Olive_F"
]; 
_Object_2 = createVehicle [_Object_2_array, _Object_2_Pos, [], 0, "CAN_COLLIDE"];
_Object_2 setDir (random 360);


//________________ Create _Object_3 ________________
_Object_3_array = selectRandom [
"Land_SatellitePhone_F",
"Land_HandyCam_F",
"Land_Laptop_02_unfolded_F",
"Land_Tablet_02_F",
"Land_Camera_01_F"
]; 
_Object_3 = createVehicle [_Object_3_array, _Object_3_Pos, [], 0, "CAN_COLLIDE"];
_Object_3 setDir (random 360);


//________________	Disable damage	________________ 
_Building allowDamage false;



///////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//________________	Enemies spawn commands	________________
/*
//________________	Examples :	________________
//________________	add this to Spawn one	________________
[] spawn GF_Missions_Spawn_Infantry_Patrol;

//________________ add this to Spawn the Number  ________________
for "_i" from 0 to 3 do {
[] spawn GF_Missions_Spawn_Infantry_Patrol;
sleep 3;
};
//________________	Examples :	________________


//________________	Infantry spawn commands	________________

//________________	Infantry	________________
[] spawn GF_Missions_Spawn_Infantry_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Defend;
[] spawn GF_Missions_Spawn_Infantry_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry;

//________________	Infantry_Divers	________________
[] spawn GF_Missions_Spawn_Infantry_Divers_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Divers_Defend;
[] spawn GF_Missions_Spawn_Infantry_Divers_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Divers;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Divers;

//________________	Infantry_Paratroopers	________________
[] spawn GF_Missions_Spawn_Infantry_Paratroopers_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Paratroopers_Defend;
[] spawn GF_Missions_Spawn_Infantry_Paratroopers_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Paratroopers;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Paratroopers;

//________________	Infantry_Recon	________________
[] spawn GF_Missions_Spawn_Infantry_Recon_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Recon_Defend;
[] spawn GF_Missions_Spawn_Infantry_Recon_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Recon;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Recon;

//________________	Infantry_Recon_SF	________________
[] spawn GF_Missions_Spawn_Infantry_Recon_SF_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Recon_SF_Defend;
[] spawn GF_Missions_Spawn_Infantry_Recon_SF_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Recon_SF;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Recon_SF;

//________________	Infantry_SF	________________
[] spawn GF_Missions_Spawn_Infantry_SF_Patrol;
[] spawn GF_Missions_Spawn_Infantry_SF_Defend;
[] spawn GF_Missions_Spawn_Infantry_SF_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_SF;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_SF;

//________________	Infantry_SF_Urban	________________
[] spawn GF_Missions_Spawn_Infantry_SF_Urban_Patrol;
[] spawn GF_Missions_Spawn_Infantry_SF_Urban_Defend;
[] spawn GF_Missions_Spawn_Infantry_SF_Urban_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_SF_Urban;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_SF_Urban;

//________________	Infantry_Snipers	________________
[] spawn GF_Missions_Spawn_Infantry_Snipers_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Snipers_Defend;
[] spawn GF_Missions_Spawn_Infantry_Snipers_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Snipers;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Snipers;


//________________	Vehicles spawn commands	________________

//________________	Armoured_Vehicles	________________
[] spawn GF_Missions_Spawn_Armoured_Vehicles_Patrol;
[] spawn GF_Missions_Spawn_Armoured_Vehicles_Defend;
[] spawn GF_Missions_Spawn_Armoured_Vehicles_Attack;

//________________	Boats	________________
[] spawn GF_Missions_Spawn_Boats_Patrol;
[] spawn GF_Missions_Spawn_Boats_Defend;
[] spawn GF_Missions_Spawn_Boats_Attack;

//________________	Helicopters	________________
[] spawn GF_Missions_Spawn_Helicopters_Patrol;
[] spawn GF_Missions_Spawn_Helicopters_Defend;
[] spawn GF_Missions_Spawn_Helicopters_Attack;

//________________	Helicopters_Attack	________________
[] spawn GF_Missions_Spawn_Helicopters_Attack_Patrol;
[] spawn GF_Missions_Spawn_Helicopters_Attack_Defend;
[] spawn GF_Missions_Spawn_Helicopters_Attack_Attack;

//________________	Helicopters_Transport_	________________
[] spawn GF_Missions_Spawn_Helicopters_Transport_Patrol;
[] spawn GF_Missions_Spawn_Helicopters_Transport_Defend;
[] spawn GF_Missions_Spawn_Helicopters_Transport_Attack;

//________________	Land_Vehicles	________________
[] spawn GF_Missions_Spawn_Land_Vehicles_Patrol;
[] spawn GF_Missions_Spawn_Land_Vehicles_Defend;
[] spawn GF_Missions_Spawn_Land_Vehicles_Attack;

//________________	Planes	________________
[] spawn GF_Missions_Spawn_Planes_Patrol;
[] spawn GF_Missions_Spawn_Planes_Defend;
[] spawn GF_Missions_Spawn_Planes_Attack;

//________________	Static_Weapons	________________
[] spawn GF_Missions_Spawn_Static_Weapons;

//________________	END of examples	________________
*/




if (GF_Missions_Custom_Spawn) then {

//________________	GF_Missions_Custom_Spawn	________________

if (_Custom_Spawn) then {

//________________	add _possibility	________________

_possibility			= floor (random 10) < 3;



for "_i" from 0 to random 2 do {
[] spawn GF_Missions_Spawn_Infantry_Snipers_Defend;
sleep 3;
};



for "_i" from 0 to random 4 do {
[] spawn GF_Missions_Spawn_Infantry_Snipers_Patrol;
sleep 3;
};


};
};
//________________	GF_Missions_Custom_Spawn End	________________




//________________	createMarker	________________
 
 if (_EOS_Spawn or _DAC_Spawn) then {
 
_EOS_Marker = createMarker ["EOS_Marker", _Pos_1];
_EOS_Marker setMarkerShape "ELLIPSE";
_EOS_Marker setMarkerSize [GF_Missions_DAC_Area_Spawn_Meters,GF_Missions_DAC_Area_Spawn_Meters];
};




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (GF_Missions_DAC_Spawn) then {

//________________	DAC	________________


if (_DAC_Spawn) then {

/*
	________________	DAC	________________
	http://www.armaholic.com/page.php?id=25550
	https://forums.bohemia.net/forums/topic/167033-dac-v31-dynamic-ai-creator-released/
*/

//________________	add a unique name for the DAC zone	________________

waituntil{DAC_NewZone == 0};
_DAC_Values = [
//________________	DAC Tutorial Readme	________________
//	http://www.realisticarma.com/images/Bilder/Missionsbau/Skripte/DAC%20V3.1%20Readme.pdf

//_Create_DAC_Zone = ["A",[B,C,D,E],[F],[G],[H],[I],[J,K,L,M,N]] spawn DAC_Zone;

//	A Name of the zone (Trigger), please define as string (the given name here must be the same one which has been given to the trigger)
"EOS_Marker",
//	B The ID Number of the Zone (an arbitrary number), to connect zones which each other (same ID = connect zones, unambiguous ID = zone runs local)
[1,

//	C Status of the zone when zone has been initiated. 0 = zone keeps activated, 1 = zone will be deactivated
0,

//	D Statement of a valid number out of the DAC_Config_Events, default = 0 (means that no events will be processed).
0

//	E Only specify if the groups should have zero waypoints in their master zone (the parameter can be specified as an option).
//	optional
],
//	F Array to generate Infantry [5,2,50,10] generates Infantry 5 times, size of groups 2, 50 WP altogether, 10 wp per group
[(3 + (round(random 6))),3,50,5],

//	G Array to generate Wheeled vehicles [3,2,30,5] generates vehicles 3 times, size of groups 2, 30 WP altogether, 10 wp per group
[(1 + (round(random 2))),2,30,5],

//	H Array to generate Tracked vehicles [5,1,40,8] generates tanks 5 times, size of groups 1, 40 WP altogether, 8 WP per group
[(1 + (round(random 2))),1,20,5],

//	I Array to generate Helicopters [3,2,5] generates Helicopters 3 times Size of groups 2 (if cargo is used), 5 WP per group
//	or Array to generate DAC camps [1,2,50,0,100,10] generates 1 Camp Size of group 2, radius 50 meters, Vehicles and Infantry, 100%, 10 resapwns
//	*** CAUTION Spawning Helicopters in a NON Flat position , can stop DAC from working *** you can spawn a Camp or static instead
[],		//	[(1 + (round(random 2))),4,5],

//	J Zone belongs to Site > 0 = East, 1 = West, 2 = RACS, 3 = civilian (for more see readme page 7)
[0,	

//	K Unit configuration of the zone (DAC_Config_Units) > default units = 0 for East, 1 for West, 2 for RACS, 3 for civilians
5,	//	Custom editable Units in GF_Missions\Custom_Units_Array.sqf

//	L Behaviour configuration of the zone (DAC_Config_Behaviour) > default behaviour = 0 for East, 1 for West, 2 for RACS, 3 for civilian
0,	

//	M Camp configuration of the zone (DAC_Config_Camps) > needed only if 1 camp minimum will be generated in the respective zone.
0

//	N Waypoint configuration of the zone (DAC_Config_Waypoints) > parameter is optional. Config 0 will be used if there is no value defined (default)
//	optional
]];

[_Pos_1,GF_Missions_DAC_Area_Spawn_Meters,GF_Missions_DAC_Area_Spawn_Meters,0,0,_DAC_Values] call DAC_fNewZone;
waituntil{DAC_NewZone == 0};

};
};
//________________	End of DAC	________________




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (GF_Missions_EOS_Spawn) then {

//________________	EOS	________________

if (_EOS_Spawn) then {


/*
GROUP SIZES KEY
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20
 
NOTE: FOR 100% PROBABILITY OF UNITS SPAWNING SET 3rd PARAMETER TO 100 OR LEAVE EMPTY.
House Patrol groups spawn in buildings within the marker. After spawning each group will remain inside buildings. 
To spawn 1 house patrol  groups - [1,2] 
Spawn 3 house patrol groups with 50% probability of spawning - [3,2,50] 
To spawn a group with between 2 and 4 units - [1,1]
Spawn three groups with between 16 and 20 units and a 70% probability of spawning - [3,5,70]

Patrolling Infantry spawn anywhere within the marker. After spawning each group will be given waypoints and patrol the marker. 
To spawn 1 group of infantry  - [1,2] 
Spawn 3 patrol groups with 50% probability of spawning - [3,2,50] 
To spawn a group with between 2 and 4 units - [1,1]
Spawn three groups with between 16 and 20 units and a 70% probability of spawning - [3,5,70]

Motorised Infantry spawn anywhere within the marker. After spawning each group will be given waypoints and patrol the marker. Motorised infantry are light vehicles and carry units in the free seats.
To spawn 1 motorised infantry  - [1,2] 
Spawn 3 motorised infantry  with 50% probability of spawning - [3,2,50] 
Cargo with between 2 and 4 units - [1,1]
Cargo with between 16 and 20 units - [3,5]

Armoured Vehicles spawn within the marker. Similar to Motised infantry except they do not carry cargo. 
Spawn 3 armoured vehicles with 50% probability of spawning - [3,50] 
Spawn 3 armoured vehicles with 100% probability of spawning - [3] 
Helicopters spawn outside the marker and fly towards the zone. If the helicopter cargo is 0 then an attack helicopter will spawn. If the helicopter cargo is above 0 then a transport helicopter will carry units into the marker and land.
Spawn 1 transport helicopter with cargo and 75% probability of spawning - [1,3,75] 
Spawn 1 Attack helicopter and 15% probability of spawning - [1,0,15] 
 */

 
//________________	EOS_Spawn	________________

[["EOS_Marker"],									//	Marker Names
[1 + (round(random 3)), 2 + (round(random 10))],	//	House Patrol Groups	[Number of Groups , Size of each Group]
[1 + (round(random 2)), 1 + (round(random 8))],		//	Patroling Infantry
[],													//	Motorized Infantry	[(round(random 2)),(round(random 2))]
[],													//	Armoured Vehicles
[],													//	Static Weapons
[(round(random 2)),									//	Helicopters
(round(random 6))],									//	Helicopter Cargo
[GF_Missions_EOS_Faction,							//	Faction
GF_Missions_EOS_Marker_Type,						//	Marker Type , 0 = Highlight , 1 = Invinsible , 2 Normal 
GF_Missions_EOS_Spawn_Distance,						//	Spawn Distance
GF_Missions_Enemy_Side,								//	Unit Side
GF_Missions_EOS_HEIGHTLIMIT,						// 	HEIGHTLIMIT
GF_Missions_Debug_EOS								//	DEBUG
]] call EOS_Spawn;

};
};
//________________	End of EOS	________________




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Set Task 1	________________

_Mission_Pos =  [[[_Pos_1, 25 + random 100]],["water"]] call BIS_fnc_randomPos;

[GF_Missions_allPlayers,["4_Snipers_Hide_1","GF_Missions_Pack"],["Snipers Hide","Snipers Hide",""], _Mission_Pos,true,1,true,"kill",true] call BIS_fnc_taskCreate;
["4_Snipers_Hide_1","ASSIGNED",true] spawn BIS_fnc_taskSetState;


diag_log "//________________	4_Snipers_Hide.sqf	Initialized	_____________";

if (GF_Missions_Systemchat_info) then {
systemchat "4_Snipers_Hide.sqf	Initialized";
};	
	
	


///////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//________________	GF_Missions_Time_out_mission_fail	________________

if (GF_Missions_Time_out_mission_fail) then {

GF_Missions_Time_Out_Fail = false;
GF_Missions_Time_Out = false;
[] spawn {
sleep GF_Missions_Set_the_sec_for_fail;
GF_Missions_Time_Out_Fail = true;
sleep 80;
GF_Missions_Time_Out = true;
};

[] spawn {
while {!GF_Missions_Time_Out} do {

if (GF_Missions_Systemchat_info) then {
systemchat "Check for GF_Missions_Time_Out";
};

sleep 50;

if (GF_Missions_Time_Out_Fail) then { 

GF_Missions_Time_Out = true;

if (GF_Missions_Systemchat_info) then {
systemchat "GF_Missions_Time_Out";
};

//________________	Set mission_fail	________________

["4_Snipers_Hide_1","FAILED",true] spawn BIS_fnc_taskSetState;

sleep 5;

if (GF_Missions_Systemchat_info) then {
systemchat "saving Game Wait";
systemchat "Next mission";
};	

if (GF_Missions_saveGame) then {
sleep 2;
saveGame;
};
	
null = []execVM "GF_Missions\Missions_init.sqf";
};
};
};

};




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Check Task	________________
	

_Trigger_Present = createTrigger ["EmptyDetector", _Pos_1];
_Trigger_Present setTriggerArea [GF_Missions_Attack_Distance, GF_Missions_Attack_Distance, 0, false];
_Trigger_Present setTriggerActivation ["EAST", "PRESENT", false];
_Trigger_Present setTriggerStatements ["this","",""];

waitUntil {count list _Trigger_Present > 4};		
waitUntil {count list _Trigger_Present < 3};	
waitUntil { { _x distance _Trigger_Present < GF_Missions_Attack_Distance } count GF_Missions_allPlayers > 0 ;};
deleteVehicle _Trigger_Present;



///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Task SUCCEEDED	________________

["4_Snipers_Hide_1", "SUCCEEDED",true] spawn BIS_fnc_taskSetState;			
sleep 5;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	DAC_fDeleteZone , deleteMarker	________________

if (_DAC_Spawn) then {
if (GF_Missions_DAC_Spawn) then {
["EOS_Marker"] call DAC_fDeleteZone;
sleep 1;
};
};

if (_EOS_Spawn) then {
if (GF_Missions_EOS_Spawn) then {
deleteMarker "EOS_Marker";
sleep 1;
};	
};




///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//________________	Mission End	________________

GF_Missions_Time_Out = true;


if (GF_Missions_Systemchat_info) then {
systemchat "saving Game Wait";
systemchat "Next mission";
};	

if (GF_Missions_saveGame) then {
sleep 2;
saveGame;
};
	
null = []execVM "GF_Missions\Missions_init.sqf";


//________________	Delete mission's objects	________________	
if (GF_Missions_Delete_Objects) then {
waitUntil { { _x distance _Building > GF_Missions_Delete_Objects_Distance } count GF_Missions_allPlayers > 0 };
systemchat "Delete mission's objects";
{ deleteVehicle _x } forEach [
_Building,
_Object_1,
_Object_2,
_Object_3
];
};