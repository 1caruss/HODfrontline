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



//infantry patrol zones - 
null = [["EOSpat_1","EOSpat_2","EOSpat_3","EOSpat_4","EOSpat_5","EOSpat_6","EOSpat_7","EOSpat_8","EOSpat_9","EOSpat_10",
"EOSpat_11","EOSpat_12","EOSpat_13","EOSpat_14","EOSpat_15","EOSpat_16","EOSpat_17","EOSpat_18","EOSpat_19","EOSpat_20",
"EOSpat_21","EOSpat_22","EOSpat_23","EOSpat_24","EOSpat_25","EOSpat_26","EOSpat_27","EOSpat_28","EOSpat_29","EOSpat_30",
"EOSpat_31","EOSpat_32","EOSpat_33","EOSpat_34","EOSpat_35","EOSpat_36","EOSpat_37","EOSpat_38","EOSpat_39","EOSpat_40",
"EOSpat_41","EOSpat_42","EOSpat_43","EOSpat_44","EOSpat_45","EOSpat_46","EOSpat_47","EOSpat_48","EOSpat_49","EOSpat_50",
"EOSpat_51","EOSpat_52","EOSpat_53","EOSpat_54","EOSpat_55","EOSpat_56","EOSpat_57","EOSpat_58","EOSpat_59","EOSpat_60",
"EOSpat_61","EOSpat_62","EOSpat_63","EOSpat_64","EOSpat_65","EOSpat_66","EOSpat_67","EOSpat_68","EOSpat_69","EOSpat_70",
"EOSpat_71","EOSpat_72","EOSpat_73","EOSpat_74","EOSpat_75","EOSpat_76","EOSpat_77","EOSpat_78","EOSpat_79","EOSpat_80",
"EOSpat_81","EOSpat_82","EOSpat_83","EOSpat_84","EOSpat_85","EOSpat_86","EOSpat_87","EOSpat_88","EOSpat_89","EOSpat_90",],

[0,0],[3,2,75],[0,0],[0],[0],[1,0,25],[5,1,400,EAST,TRUE,TRUE]] call EOS_Spawn;



//infantry zones (villages/towns) - 
null = [["EOS_inf1","EOS_inf2","EOS_inf3","EOS_inf4","EOS_inf5","EOS_inf6","EOS_inf7","EOS_inf8","EOS_inf9","EOS_inf10",
"EOS_inf11","EOS_inf12","EOS_inf13","EOS_inf14","EOS_inf15","EOS_inf16","EOS_inf17","EOS_inf18","EOS_inf19","EOS_inf20",
"EOS_inf21","EOS_inf22","EOS_inf23","EOS_inf24","EOS_inf25","EOS_inf26","EOS_inf27","EOS_inf28","EOS_inf29","EOS_inf30",
"EOS_inf31","EOS_inf32","EOS_inf33","EOS_inf34","EOS_inf35","EOS_inf36","EOS_inf37","EOS_inf38","EOS_inf39","EOS_inf40",
"EOS_inf41","EOS_inf42","EOS_inf43","EOS_inf44","EOS_inf45","EOS_inf46","EOS_inf47","EOS_inf48","EOS_inf49","EOS_inf50",
"EOS_inf51","EOS_inf52","EOS_inf53","EOS_inf54","EOS_inf55","EOS_inf56","EOS_inf57","EOS_inf58","EOS_inf59","EOS_inf60",
"EOS_inf61","EOS_inf62","EOS_inf63","EOS_inf64","EOS_inf65","EOS_inf66","EOS_inf67","EOS_inf68","EOS_inf69","EOS_inf70",
"EOS_inf71","EOS_inf72","EOS_inf73","EOS_inf74","EOS_inf75","EOS_inf76","EOS_inf77","EOS_inf78","EOS_inf79","EOS_inf80",
"EOS_inf81","EOS_inf82","EOS_inf83","EOS_inf84","EOS_inf85","EOS_inf86","EOS_inf87","EOS_inf88","EOS_inf89","EOS_inf90",
"EOS_inf91","EOS_inf92","EOS_inf93","EOS_inf94","EOS_inf95","EOS_inf96","EOS_inf97","EOS_inf98","EOS_inf99","EOS_inf100",
"EOS_inf101","EOS_inf102","EOS_inf103","EOS_inf104","EOS_inf105","EOS_inf106","EOS_inf107","EOS_inf108","EOS_inf109","EOS_inf110","EOS_inf111","EOS_inf112","EOS_inf113","EOS_inf114","EOS_inf115","EOS_inf116","EOS_inf117","EOS_inf118","EOS_inf119","EOS_inf120","EOS_inf121","EOS_inf122","EOS_inf123","EOS_inf124","EOS_inf125","EOS_inf126","EOS_inf127","EOS_inf128","EOS_inf129","EOS_inf130","EOS_inf131","EOS_inf132","EOS_inf133","EOS_inf134","EOS_inf135","EOS_inf136","EOS_inf137","EOS_inf138","EOS_inf139","EOS_inf140","EOS_inf141","EOS_inf142","EOS_inf143","EOS_inf144","EOS_inf145","EOS_inf146","EOS_inf147","EOS_inf148","EOS_inf149","EOS_inf150","EOS_inf151","EOS_inf152","EOS_inf153","EOS_inf154","EOS_inf155","EOS_inf156","EOS_inf157","EOS_inf158","EOS_inf159""EOS_inf160","EOS_inf161","EOS_inf162","EOS_inf163","EOS_inf164","EOS_inf165","EOS_inf166","EOS_inf167","EOS_inf168","EOS_inf169""EOS_inf170","EOS_inf171","EOS_inf172","EOS_inf173","EOS_inf174","EOS_inf175","EOS_inf176","EOS_inf177","EOS_inf178","EOS_inf179""EOS_inf180","EOS_inf181","EOS_inf182","EOS_inf183","EOS_inf184","EOS_inf185","EOS_inf186","EOS_inf187","EOS_inf188","EOS_inf189","EOS_inf190","EOS_inf191","EOS_inf192","EOS_inf193","EOS_inf194","EOS_inf195","EOS_inf196","EOS_inf197","EOS_inf198","EOS_inf199","EOS_inf200","EOS_inf201","EOS_inf202","EOS_inf203","EOS_inf204","EOS_inf205","EOS_inf206","EOS_inf207","EOS_inf208","EOS_inf209","EOS_inf210","EOS_inf211","EOS_inf212","EOS_inf213","EOS_inf214","EOS_inf215","EOS_inf216","EOS_inf217","EOS_inf218","EOS_inf219","EOS_inf220","EOS_inf221","EOS_inf222","EOS_inf223","EOS_inf224","EOS_inf225","EOS_inf226","EOS_inf227","EOS_inf228","EOS_inf229","EOS_inf230","EOS_inf231","EOS_inf232","EOS_inf233","EOS_inf234","EOS_inf235","EOS_inf236","EOS_inf237","EOS_inf238","EOS_inf239","EOS_inf240","EOS_inf241","EOS_inf242","EOS_inf243","EOS_inf244","EOS_inf245","EOS_inf246","EOS_inf247","EOS_inf248","EOS_inf249","EOS_inf250","EOS_inf251","EOS_inf252","EOS_inf253","EOS_inf254","EOS_inf255","EOS_inf256","EOS_inf257","EOS_inf258","EOS_inf259","EOS_inf260","EOS_inf261","EOS_inf262","EOS_inf263","EOS_inf264","EOS_inf265","EOS_inf266","EOS_inf267","EOS_inf268","EOS_inf269","EOS_inf270","EOS_inf271","EOS_inf272","EOS_inf273","EOS_inf274","EOS_inf275","EOS_inf276","EOS_inf277","EOS_inf278","EOS_inf279","EOS_inf280",
"EOS_inf281","EOS_inf282","EOS_inf283","EOS_inf284","EOS_inf285","EOS_inf286","EOS_inf287","EOS_inf288""EOS_inf289","EOS_inf290","EOS_inf291","EOS_inf292","EOS_inf293",],

[2,1],[1,2,50],[0,0],[0],[0],[0,0],[5,0,400,EAST,TRUE,TRUE]] call EOS_Spawn;



//motorized zones - 
null = [["EOSmot_1","EOSmot_2","EOSmot_3","EOSmot_4","EOSmot_5","EOSmot_6","EOSmot_7","EOSmot_8","EOSmot_9","EOSmot_10",
"EOSmot_11","EOSmot_12"],

[0,0],[0,0],[1,1,90],[2,60],[0],[1,0,30],[5,1,400,EAST,FALSE,TRUE]] call EOS_Spawn;



//mechanised zones - 
null = [["EOSmech_1","EOSmech_2","EOSmech_3","EOSmech_4","EOSmech_5","EOSmech_6","EOSmech_7","EOSmech_8","EOSmech_9","EOSmech_10"],

[0,0],[0,0],[1,1,90],[2,60],[0],[1,0,30],[5,1,400,EAST,FALSE,TRUE]] call EOS_Spawn;



//bastion zones - 
null = [["EOSbas_1","EOSbas_2","EOSbas_3","EOSbas_4","EOSbas_5","EOSbas_6","EOSbas_7","EOSbas_8","EOSbas_9","EOSbas_10",
"EOSbas_11","EOSbas_12","EOSbas_13"],

[0,1],[0,2],[0],[1,2],[0,0,EAST,TRUE],[5,0,120,TRUE,TRUE]] call Bastion_Spawn;


//Recon patrols - 
null = [["EOSrec_1","EOSrec_2","EOSrec_3","EOSrec_4","EOSrec_5","EOSrec_6","EOSrec_7","EOSrec_8","EOSrec_9","EOSrec_10",
"EOSrec_11","EOSrec_12","EOSrec_13","EOSrec_14","EOSrec_15","EOSrec_16","EOSrec_17","EOSrec_18"],

[0,0],[3,3,75],[0,0],[0],[0],[1,4,40],[6,1,400,EAST,TRUE,TRUE]] call EOS_Spawn;