


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
//________________	Infantry_Snipers	________________
[] spawn GF_Missions_Spawn_Infantry_Snipers_Patrol;
[] spawn GF_Missions_Spawn_Infantry_Snipers_Defend;
[] spawn GF_Missions_Spawn_Infantry_Snipers_Attack;
[] spawn GF_Missions_Garrison_The_Building_Infantry_Snipers;			//	add the name of the building ex : [_Building] spawn GF_Missions_Garrison_The_Building_Infantry;
[] spawn GF_Missions_Garrison_Area_Buildings_Infantry_Snipers;
*/


//________________	GF_Missions_Spawn_Infantry_Snipers_Patrol	________________

GF_Missions_Spawn_Infantry_Snipers_Patrol = {

_Pos = GF_Missions_pos;
_Pos_Spawn =  [[[_Pos, 25 + random 250]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup GF_Missions_Enemy_Side;

for "_x" from 0 to (GF_Missions_Squad_Members) do {

_unit = _Group createunit [GF_Missions_Pool_Infantry_Snipers select floor(random count GF_Missions_Pool_Infantry_Snipers),_Pos_Spawn,[],0,"None"];
[_unit] JoinSilent _Group;
(leader _Group) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};
};
[_Group,_Pos,GF_Missions_BIS_fnc_taskPatrol_distance] call BIS_fnc_taskPatrol;
};


//________________	GF_Missions_Spawn_Infantry_Snipers_Defend	________________	

GF_Missions_Spawn_Infantry_Snipers_Defend = {

_Pos = GF_Missions_pos;
_Pos_Spawn =  [[[_Pos, 25 + random 100]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup GF_Missions_Enemy_Side;

for "_x" from 0 to (GF_Missions_Squad_Members) do {

_unit = _Group createunit [GF_Missions_Pool_Infantry_Snipers select floor(random count GF_Missions_Pool_Infantry_Snipers),_Pos_Spawn,[],0,"None"];
[_unit] JoinSilent _Group;
(leader _Group) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};

};
[_Group, _Pos] call BIS_fnc_taskDefend;
};


//________________	GF_Missions_Spawn_Infantry_Snipers_Attack	________________

GF_Missions_Spawn_Infantry_Snipers_Attack = {

_Pos = GF_Missions_pos;
_Pos_Spawn =  [[[_Pos, GF_Missions_Attack_Distance]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup GF_Missions_Enemy_Side;

for "_x" from 0 to (GF_Missions_Squad_Members) do {

_unit = _Group createunit [GF_Missions_Pool_Infantry_Snipers select floor(random count GF_Missions_Pool_Infantry_Snipers),_Pos_Spawn,[],0,"None"];
[_unit] JoinSilent _Group;
(leader _Group) setSkill GF_Missions_set_AiSkill;

if (GF_Missions_Change_Equipment) then {	
_unit spawn GF_SCL_GF_Missions;
};

};
[_Group, _Pos] call BIS_fnc_taskAttack;


//________________	GF_Missions_Garrison_The_Building_Infantry_Snipers	________________ 

GF_Missions_Garrison_The_Building_Infantry_Snipers = {

_building = _this select 0;

_buildingPositions = [_building] call BIS_fnc_buildingPositions;
_count = count _buildingPositions;
_round = _count / 3;
_round_count = round _round;
_Positions = _round_count;

//	hint format ["%1",_count];
//	hint format ["%1",_Positions];

if (_count > 0) then {

_Group = createGroup GF_Missions_Enemy_Side;
for "_x" from 0 to (_Positions) do {

_Pos_Spawn = selectRandom _buildingPositions;

_Unit = _Group createunit [GF_Missions_Pool_Infantry_Snipers select floor(random count GF_Missions_Pool_Infantry_Snipers),_Pos_Spawn,[],0,"None"];
[_Unit] JoinSilent _Group;
_Unit disableAI "PATH";
};
};
};


//________________	GF_Missions_Garrison_Area_Buildings_Infantry_Snipers	________________ 

GF_Missions_Garrison_Area_Buildings_Infantry_Snipers = {

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
	
	_Group = createGroup GF_Missions_Enemy_Side;
	_Unit = _Group createunit [GF_Missions_Pool_Infantry_Snipers select floor(random count GF_Missions_Pool_Infantry_Snipers),_buildingpos,[],0,"None"];
	[_Unit] JoinSilent _Group;
	_Unit disableAI "PATH";
			
			};	
		};
	};				
}foreach _Buildings;
};
};