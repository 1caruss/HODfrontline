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
"EOSpat_81","EOSpat_82","EOSpat_83","EOSpat_84","EOSpat_85","EOSpat_86","EOSpat_87","EOSpat_88","EOSpat_89","EOSpat_90"],

[0,0],[1,2,75],[0,0],[0],[0],[0,0],[5,1,500,EAST,TRUE,FALSE]] call EOS_Spawn;



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
"EOSinf_91","EOSinf_92","EOSinf_93","EOSinf_94","EOSinf_95","EOSinf_96","EOSinf_97","EOSinf_98","EOSinf_99","EOSinf_100",
"EOSinf_101","EOSinf_102","EOSinf_103","EOSinf_104","EOSinf_105","EOSinf_106","EOSinf_107","EOSinf_108","EOSinf_109","EOSinf_110",
"EOSinf_111","EOSinf_112","EOSinf_113","EOSinf_114","EOSinf_115","EOSinf_116","EOSinf_117","EOSinf_118","EOSinf_119","EOSinf_120",
"EOSinf_121","EOSinf_122","EOSinf_123","EOSinf_124","EOSinf_125","EOSinf_126","EOSinf_127","EOSinf_128","EOSinf_129","EOSinf_130",
"EOSinf_131","EOSinf_132","EOSinf_133","EOSinf_134","EOSinf_135","EOSinf_136","EOSinf_137","EOSinf_138","EOSinf_139","EOSinf_140",
"EOSinf_141","EOSinf_142","EOSinf_143","EOSinf_144","EOSinf_145","EOSinf_146","EOSinf_147","EOSinf_148","EOSinf_149","EOSinf_150",
"EOSinf_151","EOSinf_152","EOSinf_153","EOSinf_154","EOSinf_155","EOSinf_156","EOSinf_157","EOSinf_158","EOSinf_159","EOSinf_160",
"EOSinf_161","EOSinf_162","EOSinf_163","EOSinf_164","EOSinf_165","EOSinf_166","EOSinf_167","EOSinf_168","EOSinf_169","EOSinf_170",
"EOSinf_171","EOSinf_172","EOSinf_173","EOSinf_174","EOSinf_175","EOSinf_176","EOSinf_177","EOSinf_178","EOSinf_179","EOSinf_180",
"EOSinf_181","EOSinf_182","EOSinf_183","EOSinf_184","EOSinf_185","EOSinf_186","EOSinf_187","EOSinf_188","EOSinf_189","EOSinf_190",
"EOSinf_191","EOSinf_192","EOSinf_193","EOSinf_194","EOSinf_195","EOSinf_196","EOSinf_197","EOSinf_198","EOSinf_199","EOSinf_200",
"EOSinf_201","EOSinf_202","EOSinf_203","EOSinf_204","EOSinf_205","EOSinf_206","EOSinf_207","EOSinf_208","EOSinf_209","EOSinf_210",
"EOSinf_211","EOSinf_212","EOSinf_213","EOSinf_214","EOSinf_215","EOSinf_216","EOSinf_217","EOSinf_218","EOSinf_219","EOSinf_220",
"EOSinf_221","EOSinf_222","EOSinf_223","EOSinf_224","EOSinf_225","EOSinf_226","EOSinf_227","EOSinf_228","EOSinf_229","EOSinf_230",
"EOSinf_231","EOSinf_232","EOSinf_233","EOSinf_234","EOSinf_235","EOSinf_236","EOSinf_237","EOSinf_238","EOSinf_239","EOSinf_240",
"EOSinf_241","EOSinf_242","EOSinf_243","EOSinf_244","EOSinf_245","EOSinf_246","EOSinf_247","EOSinf_248","EOSinf_249","EOSinf_250",
"EOSinf_251","EOSinf_252","EOSinf_253","EOSinf_254","EOSinf_255","EOSinf_256","EOSinf_257","EOSinf_258","EOSinf_259","EOSinf_260",
"EOSinf_261","EOSinf_262","EOSinf_263","EOSinf_264","EOSinf_265","EOSinf_266","EOSinf_267","EOSinf_268","EOSinf_269","EOSinf_270",
"EOSinf_271","EOSinf_272","EOSinf_273","EOSinf_274","EOSinf_275","EOSinf_276","EOSinf_277","EOSinf_278","EOSinf_279","EOSinf_280",
"EOSinf_281","EOSinf_282","EOSinf_283","EOSinf_284","EOSinf_285","EOSinf_286","EOSinf_287","EOSinf_288","EOSinf_289","EOSinf_290",
"EOSinf_291","EOSinf_292","EOSinf_293"],

[2,1,75],[2,0,50],[0,0],[0],[0],[0,0],[5,0,350,EAST,FALSE,FALSE]] call EOS_Spawn;


//motorized zones - 
null = [["EOSmot_1","EOSmot_2","EOSmot_3","EOSmot_4","EOSmot_5","EOSmot_6","EOSmot_7","EOSmot_8","EOSmot_9","EOSmot_10",
"EOSmot_11","EOSmot_12"],

[0,0],[1,2,50],[1,1,75],[0],[0],[0],[5,1,500,EAST,FALSE,FALSE]] call EOS_Spawn;


//Recon patrols - 
null = [["EOSrec_1","EOSrec_2","EOSrec_3","EOSrec_4","EOSrec_5","EOSrec_6","EOSrec_7","EOSrec_8","EOSrec_9","EOSrec_10",
"EOSrec_11","EOSrec_12","EOSrec_13","EOSrec_14","EOSrec_15","EOSrec_16","EOSrec_17","EOSrec_18"],

[0,0],[2,1,75],[1,2,25],[0],[0],[0],[6,1,400,EAST,TRUE,TRUE]] call EOS_Spawn;


//mechanised zones
null = [["EOSmech_1","EOSmech_2","EOSmech_3","EOSmech_4","EOSmech_5","EOSmech_6","EOSmech_7","EOSmech_8","EOSmech_9","EOSmech_10"],

[0,0],[0,0],[1,75],[0],[0],[0],[5,1,350,EAST,FALSE,FALSE]] call EOS_Spawn;


//bastion zones
null = [["BAS_1","BAS_2","BAS_3","BAS_4","BAS_5","BAS_6","BAS_7","BAS_8","BAS_9","BAS_10","BAS_11","BAS_12","BAS_13"],

[2,1],[1,2],[0],[1,2],[5,0,EAST,TRUE],[5,2,120,TRUE,FALSE]] call Bastion_Spawn;


null=[] call HOD_fnc_persistence;
