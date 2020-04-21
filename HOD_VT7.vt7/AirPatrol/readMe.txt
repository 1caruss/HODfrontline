// © December 2016 - Devastator_cm
// Tested with Development Build 1.66.139494


To use: 

1. Copy the AirPatrolfolder into your mission directory
2. Add aircraft(s), fixed wing or helicopter, on the map
3. Add markers on the map that you want the aircraft to move through
4. Call "AirPatrol\AirPatrolInit.sqf" from your init.sqf to initialize the scripts (this must occour before step 5)
5. Add the code (see below) either to your init.sqf (which will start patrol right away when mission starts) or to a trigger to start the air patrol on demand
6. "AirPatrol\AirPatrolEnd.sqf is called automatically when aircraft reaches the final marker. Any further actions which aircraft needs to take can be coded in this file by user.
   Check AirPatrolEnd.sqf file for further information and examples.

Code:
if (isServer) then 
{
	_handle = [aircraft_1, [["pos1", 80], ["pos2", 150], ["pos3", 200], ["pos4", 100]], 1500, 200, 30, [10, 30, 60], base1, 150] spawn DEVAS_AirPatrol;
};


The code parameters in the script-call are:

1. Aircraft's variable name
2. A multidimensional array of moveTo Markers and respective altitudes
3. Enemy search range. Enemies in this range will be considered as danger if they are noticed by aircraft or reported by ground forces.
   Minimum value for this parameter is 1500 by helicopters and 3500 by fixed wing.
4. Speed limit for aircraft. This value is not absolute. Altitude changes can speed up or speed down the aircraft.
5. Patrol restart delay in seconds, after aircraft engages an enemy and there is no more contact in search range it will wait in the area until restart delay is finished. 
6. An array for communication delay. In case there are friendly units in area, aircraft is getting positions of enemy based on communication delay.
   It is a random delay based on [min, med, max] 
7. Name of the helipad (can be invisible as well) which will be considered as base to refuel if needed. In case you have a fixed wing, use an invisible helipad and put it
   on runway of the airport which needs to be considered as base.
8. Kill zone. If any enemy is inside this radius aircraft will see them no matter if they are hiden or not (aircrafts have many visual equipments ;) )
   Communication delay is also plays a role here. If units were inside kill zone but there was a comm. delay aircraft will not notice them right away.


License:  These scripts are not to be altered or used for commercial or military purposes without the author's prior consent.