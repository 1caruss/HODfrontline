


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


/*
//________________	add this to use	________________
//________________	Infantry	________________
[] spawn GF_Missions_Spawn_Infantry_Civilians_Patrol;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Civilians;		//	add the name of the building ex : [_Building] spawn GF_Missions_Garrison_The_Building_Infantry;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Civilians;
*/


//________________	GF_Missions_Spawn_Infantry_Civilians_Patrol	________________

GF_Missions_Spawn_Infantry_Civilians_Patrol = {

_Pos = GF_Missions_pos;
_Pos_Spawn =  [[[_Pos, 25 + random 100]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup civilian;

for "_x" from 0 to (GF_Missions_Squad_Members) do {

_Unit = _Group createunit [GF_Missions_Pool_Civilian select floor(random count GF_Missions_Pool_Civilian),_Pos_Spawn,[],0,"None"];
[_Unit] JoinSilent _Group;

removeAllWeapons _Unit;
removeAllItems _Unit;
removeAllAssignedItems _Unit;
removeVest _Unit;
removeBackpack _Unit;
removeGoggles _Unit;

if (GF_Missions_Change_Equipment) then {	
_Unit spawn GF_SCL_GF_Missions_civilian;
};


_Goggles = selectRandom GF_SCL_GF_Missions_Goggles_array;
_Headgear = selectRandom GF_SCL_GF_Missions_Headgear_array;  
_Vests = selectRandom GF_SCL_GF_Missions_Vests_array; 
_Backpacks = selectRandom GF_SCL_GF_Missions_Backpacks_array;


//	add possibility 
if (floor (random 10) < 6) then {_Unit addGoggles _Goggles;};
if (floor (random 10) < 5) then {_Unit addHeadgear _Headgear;};
if (floor (random 10) < 4) then {_Unit addVest _Vests;};
if (floor (random 10) < 3) then {_Unit addBackpack _Backpacks;};

[_Group,_Pos,GF_Missions_BIS_fnc_taskPatrol_distance] call BIS_fnc_taskPatrol;
};
};


//________________	GF_Missions_Garrison_The_Building_Infantry_Civilians	________________ 

GF_Missions_Garrison_The_Building_Infantry_Civilians = {

_building = _this select 0;

_buildingPositions = [_building] call BIS_fnc_buildingPositions;
_count = count _buildingPositions;
_round = _count / 3;
_round_count = round _round;
_Positions = _round_count;

//	hint format ["%1",_count];
//	hint format ["%1",_Positions];

if (_count > 0) then {

_Group = createGroup civilian;
for "_x" from 0 to (_Positions) do {

_Pos_Spawn = selectRandom _buildingPositions;

_Unit = _Group createunit [GF_Missions_Pool_Civilian select floor(random count GF_Missions_Pool_Civilian),_Pos_Spawn,[],0,"None"];
[_Unit] JoinSilent _Group;
_Unit disableAI "PATH";

removeAllWeapons _Unit;
removeAllItems _Unit;
removeAllAssignedItems _Unit;
removeVest _Unit;
removeBackpack _Unit;
removeGoggles _Unit;

if (GF_Missions_Change_Equipment) then {	
_Unit spawn GF_SCL_GF_Missions_civilian;
};


_Goggles = selectRandom GF_SCL_GF_Missions_Goggles_array;
_Headgear = selectRandom GF_SCL_GF_Missions_Headgear_array;  
_Vests = selectRandom GF_SCL_GF_Missions_Vests_array; 
_Backpacks = selectRandom GF_SCL_GF_Missions_Backpacks_array;


//	add possibility 
if (floor (random 10) < 6) then {_Unit addGoggles _Goggles;};
if (floor (random 10) < 5) then {_Unit addHeadgear _Headgear;};
if (floor (random 10) < 4) then {_Unit addVest _Vests;};
if (floor (random 10) < 3) then {_Unit addBackpack _Backpacks;};
};
};
};


//________________	GF_Missions_Garrison_Area_Buildings_Infantry_Civilians	________________ 

GF_Missions_Garrison_Area_Buildings_Infantry_Civilians = {

_Exclude_Buildings = [
"Land_Pier_F",
"Land_Pier_small_F",
"Land_NavigLight",
"Land_LampHarbour_F"
];


_Buildings = nearestObjects [GF_Missions_pos, ["House", "Building"], GF_Missions_Garrison_Area_Distance];
	
{
_Building = _x;

if (!(typeOf _Building in _Exclude_Buildings)) then {
	
for "_i" from 0 to 50 do {

	_buildingpos = _Building buildingpos _i;
	if (str _buildingpos == "[0,0,0]") exitwith {};
	
	_Possibility = floor (random 100) < GF_Missions_Garrison_Area_Possibility;
	if (_Possibility) then {
	
	_Group = createGroup civilian;
	_Unit = _Group createunit [GF_Missions_Pool_Civilian select floor(random count GF_Missions_Pool_Civilian),_buildingpos,[],0,"None"];
	[_Unit] JoinSilent _Group;
	_Unit disableAI "PATH";
		
	removeAllWeapons _Unit;
	removeAllItems _Unit;
	removeAllAssignedItems _Unit;
	removeVest _Unit;
	removeBackpack _Unit;
	removeGoggles _Unit;

	if (GF_Missions_Change_Equipment) then {	
	_Unit spawn GF_SCL_GF_Missions_civilian;
	};


	_Goggles = selectRandom GF_SCL_GF_Missions_Goggles_array;
	_Headgear = selectRandom GF_SCL_GF_Missions_Headgear_array;  
	_Vests = selectRandom GF_SCL_GF_Missions_Vests_array; 
	_Backpacks = selectRandom GF_SCL_GF_Missions_Backpacks_array;


		//	add possibility 
	if (floor (random 10) < 6) then {_Unit addGoggles _Goggles;};
	if (floor (random 10) < 5) then {_Unit addHeadgear _Headgear;};
	if (floor (random 10) < 4) then {_Unit addVest _Vests;};
	if (floor (random 10) < 3) then {_Unit addBackpack _Backpacks;};
			};	
		};
	};				
}foreach _Buildings;
};