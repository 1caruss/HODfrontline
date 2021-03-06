/*

This script adds a request for a CAS aircraft (not physically spawned) which provides tracking and targeted strike capability.

Author: Incontinentia

*/

private ["_necItem","_fullVP","_preStrikeCDE","_playTimeVar","_playTime","_percentage","_hqCallsign","_airCallsign","_nightTimeOnly","_dawn","_dusk","_aircraftType","_minTimeOnTgt","_randomDelay","_altitudeMin","_altitudeRandom","_radius","_speed","_ammoArray","_allowSensitive","_maxCollateral","_sideFriendly","_trackingEnabled","_percentageReliability","_isAffectedByOvercast","_objectOcclusion","_maxOvercastDegradation","_trackingRange","_terminalNecessary","_requestInterval","_repeatedStrikes","_timeout"];

//General Options
_percentage = 100;                      //Percentage chance that the aircraft will be available for sorties
_hqCallsign = "CROSSROADS";             //Callsign for HQ element
_airCallsign = "Eagle 34";           //Aircraft callsign
_nightTimeOnly = false;                 //Is activity limited to night-time only sorties?
_dawn = 6;                              //Dawn time (before this time, the aircraft will look for chemlights / IR strobes) - 0-24
_dusk = 18;                             //Dusk time (before this time, the aicraft will look for smoke) - 0-24

//Player options
_necItem = "ItemMap";                 //Required item to call for air support.
_fullVP = false;                         //Should JTAC and pilot use full voice procedure or limit radio contact to essential only?
_preStrikeCDE = true;                   //Should the pilot conduct a collateral damage assessment before the strike? (Check for civilians, nearby friendlies, sensitive targets in strike radius)

//Aicraft options
_aircraftType = "RQ-170 Sentinel RPA";  //Aircraft type (for voice procedure, does not change anything about strike)
_minTimeOnTgt = 60;                    //How long should the aircraft take to reach the AO in seconds
_randomDelay = 20;                     //Random delay factor (could be delayed by up to this many seconds)
_altitudeMin = 8000;                    //Minimum altitude of ordnance launch
_altitudeRandom = 4000;                 //Random additional altitude above minimum for ordnance launch
_radius = 1500;                         //Radius of launch position around player in meters
_rtbOnNoAmmo = true; 					//Should the unit RTB when out of ammo? (Set to false if you want the unit to continue tracking after it has run out of ammo)
_playTime = 30;                         //Amount of time aircraft will remain on station (in minutes) - i.e. over the target area
_playTimeVar = 5;                      //Variation in minutes for time on station (must be significantly less than _playtime to avoid errors)
_requestInterval = 3;                  //Maximum amount of time in minutes between unsuccessful aircraft requests (will be able to request again once this timer is done)
_maxSorties = 999;                        //Max number of sorties
_timeout = 120;                          //Radio message timout in seconds (player must communicate before this runs out or the mission will abort - the final strike confirmation will be 15 times this value to enable coordination)

//Ordnance options
_bomb = 4;							    //How many GBUs will the air unit carry?
_missile = 6;                           //How many AT missiles the air unit carry?

//Allow targeting of sensetive targets (put "this setVariable ["APW_sensetiveTarget",true,true];" without quotation marks in the sensitive unit's init)
_allowSensitive = false;

//Mission aborted if more than this number of civilians are in the probable kill radius (only civilians visible from overhead will be counted, more may be present in reality)
_maxCollateral = 2;

//Cancel strike if units of this side are in kill zone
_sideFriendly = west;

//Sensor / Tracking Options
_trackingEnabled = true;                //Is tracking enabled? (If false, below settings are ignored)
_percentageReliability = 98;			//What percentage of units will be picked up by tracking in perfect conditions?
_isAffectedByOvercast = false;			//Is tracking affected by overcase conditions?
_objectOcclusion = true;				//Do objects block tracking (i.e. a unit standing under a building)?
_maxOvercastDegradation = 70;			//How much % reliability will be lost at full overcast?
_trackingRange = 800;					//Maximum tracking range from player
_terminalNecessary = false;				//Is a UAV terminal necessary to view tracking information?
