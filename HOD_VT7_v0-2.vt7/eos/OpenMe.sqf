EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";null=[] execVM "eos\core\spawn_fnc.sqf";onplayerConnected {[] execVM "eos\Functions\EOS_Markers.sqf";};
/* EOS 1.98 by BangaBob 
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10],[1,0,250,WEST]] call EOS_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;

EXAMPLE CALL - BASTION
 null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST,false,false],[10,2,120,TRUE,TRUE]] call Bastion_Spawn;
 null=[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call Bastion_Spawn;
*/



VictoryColor="colorGreen";	// Colour of marker after completion
hostileColor="colorRed";	// Default colour when enemies active
bastionColor="colorOrange";	// Colour for bastion marker
EOS_DAMAGE_MULTIPLIER=1;	// 1 is default
EOS_KILLCOUNTER=true;		// Counts killed units



//infantry patrol zones
null = [["EOSpat_1","EOSpat_2","EOSpat_3","EOSpat_4","EOSpat_5","EOSpat_6","EOSpat_7","EOSpat_8","EOSpat_9","EOSpat_10",
"EOSpat_11","EOSpat_12","EOSpat_13","EOSpat_14","EOSpat_15","EOSpat_16","EOSpat_17","EOSpat_18","EOSpat_19","EOSpat_20",
"EOSpat_21","EOSpat_22","EOSpat_23","EOSpat_24","EOSpat_25","EOSpat_26","EOSpat_27","EOSpat_28","EOSpat_29","EOSpat_30",
"EOSpat_31","EOSpat_32","EOSpat_33","EOSpat_34","EOSpat_35","EOSpat_36","EOSpat_37","EOSpat_38","EOSpat_39","EOSpat_40",
"EOSpat_41","EOSpat_42","EOSpat_43","EOSpat_44","EOSpat_45","EOSpat_46","EOSpat_47","EOSpat_48","EOSpat_49","EOSpat_50",
"EOSpat_51","EOSpat_52","EOSpat_53","EOSpat_54","EOSpat_55","EOSpat_56","EOSpat_57","EOSpat_58","EOSpat_59","EOSpat_60",
"EOSpat_61","EOSpat_62","EOSpat_63","EOSpat_64","EOSpat_65","EOSpat_66","EOSpat_67","EOSpat_68","EOSpat_69","EOSpat_70",
"EOSpat_71","EOSpat_72","EOSpat_73","EOSpat_74","EOSpat_75","EOSpat_76","EOSpat_77","EOSpat_78","EOSpat_79","EOSpat_80",
"EOSpat_81","EOSpat_82","EOSpat_83","EOSpat_84","EOSpat_85","EOSpat_86","EOSpat_87","EOSpat_88","EOSpat_89","EOSpat_90",
"EOSpat_91","EOSpat_92","EOSpat_93","EOSpat_94","EOSpat_95","EOSpat_96","EOSpat_97","EOSpat_98","EOSpat_99","EOSpat_100"],

[0,0],[3,2,75],[0,0],[0],[0],[0,0],[5,0,350,EAST,TRUE,TRUE]] call EOS_Spawn;



//infantry zones (villages/towns)
null = [["EOSinf_1","EOSinf_2","EOSinf_3","EOSinf_4","EOSinf_5","EOSinf_6","EOSinf_7","EOSinf_8","EOSinf_9","EOSinf_10",
"EOSinf_11","EOSinf_12","EOSinf_13","EOSinf_14","EOSinf_15","EOSinf_16","EOSinf_17","EOSinf_18","EOSinf_19","EOSinf_20",
"EOSinf_21","EOSinf_22","EOSinf_23","EOSinf_24","EOSinf_25","EOSinf_26","EOSinf_27","EOSinf_28","EOSinf_29","EOSinf_30",
"EOSinf_31","EOSinf_32","EOSinf_33","EOSinf_34","EOSinf_35","EOSinf_36","EOSinf_37","EOSinf_38","EOSinf_39","EOSinf_40",
"EOSinf_41","EOSinf_42","EOSinf_43","EOSinf_44","EOSinf_45","EOSinf_46","EOSinf_47","EOSinf_48","EOSinf_49","EOSinf_50",
"EOSinf_51","EOSinf_52","EOSinf_53","EOSinf_54","EOSinf_55","EOSinf_56","EOSinf_57","EOSinf_58","EOSinf_59","EOSinf_60",
"EOSinf_61","EOSinf_62","EOSinf_63","EOSinf_64","EOSinf_65","EOSinf_66","EOSinf_67","EOSinf_68","EOSinf_69","EOSinf_70",
"EOSinf_71","EOSinf_72","EOSinf_73","EOSinf_74","EOSinf_75","EOSinf_76","EOSinf_77","EOSinf_78","EOSinf_79","EOSinf_80",
"EOSinf_81","EOSinf_82","EOSinf_83","EOSinf_84","EOSinf_85","EOSinf_86","EOSinf_87","EOSinf_88","EOSinf_89","EOSinf_90",
"EOSinf_91","EOSinf_92","EOSinf_93","EOSinf_94","EOSinf_95","EOSinf_96","EOSinf_97","EOSinf_98","EOSinf_99","EOSinf_100"],

[2,1],[1,2,50],[0,0],[0],[0],[0,0],[5,0,350,EAST,TRUE,TRUE]] call EOS_Spawn;



//motorized zones
null = [["EOSmot_1","EOSmot_2","EOSmot_3","EOSmot_4","EOSmot_5","EOSmot_6","EOSmot_7","EOSmot_8","EOSmot_9","EOSmot_10",
"EOSmot_11","EOSmot_12","EOSmot_13","EOSmot_14","EOSmot_15","EOSmot_16","EOSmot_17","EOSmot_18","EOSmot_19","EOSmot_20",
"EOSmot_21","EOSmot_22","EOSmot_23","EOSmot_24","EOSmot_25","EOSmot_26","EOSmot_27","EOSmot_28","EOSmot_29","EOSmot_30",
"EOSmot_31","EOSmot_32","EOSmot_33","EOSmot_34","EOSmot_35","EOSmot_36","EOSmot_37","EOSmot_38","EOSmot_39","EOSmot_40",
"EOSmot_41","EOSmot_42","EOSmot_43","EOSmot_44","EOSmot_45","EOSmot_46","EOSmot_47","EOSmot_48","EOSmot_49","EOSmot_50",
"EOSmot_51","EOSmot_52","EOSmot_53","EOSmot_54","EOSmot_55","EOSmot_56","EOSmot_57","EOSmot_58","EOSmot_59","EOSmot_60",
"EOSmot_61","EOSmot_62","EOSmot_63","EOSmot_64","EOSmot_65","EOSmot_66","EOSmot_67","EOSmot_68","EOSmot_69","EOSmot_70",
"EOSmot_71","EOSmot_72","EOSmot_73","EOSmot_74","EOSmot_75","EOSmot_76","EOSmot_77","EOSmot_78","EOSmot_79","EOSmot_80",
"EOSmot_81","EOSmot_82","EOSmot_83","EOSmot_84","EOSmot_85","EOSmot_86","EOSmot_87","EOSmot_88","EOSmot_89","EOSmot_90",
"EOSmot_91","EOSmot_92","EOSmot_93","EOSmot_94","EOSmot_95","EOSmot_96","EOSmot_97","EOSmot_98","EOSmot_99","EOSmot_100"],

[0,0],[0,0],[3,1,90],[2,60],[0],[1,0,90],[5,0,350,EAST,FALSE,TRUE]] call EOS_Spawn;



//mechanised zones
null = [["EOSmech_1","EOSmech_2","EOSmech_3","EOSmech_4","EOSmech_5","EOSmech_6","EOSmech_7","EOSmech_8","EOSmech_9","EOSmech_10",
"EOSmech_11","EOSmech_12","EOSmech_13","EOSmech_14","EOSmech_15","EOSmech_16","EOSmech_17","EOSmech_18","EOSmech_19","EOSmech_20",
"EOSmech_21","EOSmech_22","EOSmech_23","EOSmech_24","EOSmech_25","EOSmech_26","EOSmech_27","EOSmech_28","EOSmech_29","EOSmech_30",
"EOSmech_31","EOSmech_32","EOSmech_33","EOSmech_34","EOSmech_35","EOSmech_36","EOSmech_37","EOSmech_38","EOSmech_39","EOSmech_40",
"EOSmech_41","EOSmech_42","EOSmech_43","EOSmech_44","EOSmech_45","EOSmech_46","EOSmech_47","EOSmech_48","EOSmech_49","EOSmech_50",
"EOSmech_51","EOSmech_52","EOSmech_53","EOSmech_54","EOSmech_55","EOSmech_56","EOSmech_57","EOSmech_58","EOSmech_59","EOSmech_60",
"EOSmech_61","EOSmech_62","EOSmech_63","EOSmech_64","EOSmech_65","EOSmech_66","EOSmech_67","EOSmech_68","EOSmech_69","EOSmech_70",
"EOSmech_71","EOSmech_72","EOSmech_73","EOSmech_74","EOSmech_75","EOSmech_76","EOSmech_77","EOSmech_78","EOSmech_79","EOSmech_80",
"EOSmech_81","EOSmech_82","EOSmech_83","EOSmech_84","EOSmech_85","EOSmech_86","EOSmech_87","EOSmech_88","EOSmech_89","EOSmech_90",
"EOSmech_91","EOSmech_92","EOSmech_93","EOSmech_94","EOSmech_95","EOSmech_96","EOSmech_97","EOSmech_98","EOSmech_99","EOSmech_100"],

[0,0],[0,0],[3,1,90],[2,60],[0],[1,0,90],[5,0,350,EAST,FALSE,TRUE]] call EOS_Spawn;



//bastion zones
null = [["BAS_1","BAS_2","BAS_3","BAS_4","BAS_5","BAS_6","BAS_7","BAS_8","BAS_9","BAS_10"],

[0,1],[0,2],[0],[1,2],[0,0,EAST,TRUE],[5,2,120,TRUE,TRUE]] call Bastion_Spawn;