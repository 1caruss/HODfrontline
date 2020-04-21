


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


//________________	DAC	________________
//	This is for the DAC Script.  * You don't need to edit the DAC_Config_Unit.sqf *

GF_Missions_DAC_Pool_Infantry = [

	"rhs_pilot_combat_heli",	//	pilot	
	"rhs_pilot_combat_heli",		//	pilot	
	"rhs_msv_emr_combatcrew",	//	driver	
	"rhs_msv_emr_officer_armored",	//	group leader	
	
"rhs_msv_emr_aa","rhs_msv_emr_at","rhs_msv_emr_arifleman","rhs_msv_emr_efreitor","rhs_msv_emr_engineer",
"rhs_msv_emr_grenadier_rpg","rhs_msv_emr_strelok_rpg_assist","rhs_msv_emr_junior_sergeant","rhs_msv_emr_machinegunner",
"rhs_msv_emr_machinegunner_assistant","rhs_msv_emr_marksman","rhs_msv_emr_medic",
"rhs_msv_emr_rifleman","rhs_msv_emr_grenadier","rhs_msv_emr_LAT","rhs_msv_emr_RShG2","rhs_msv_emr_sergeant"
	];
	
GF_Missions_DAC_Pool_Land_Vehicles = [
"rhs_tigr_msv","rhs_tigr_3camo_msv","rhs_tigr_sts_msv","rhs_tigr_m_msv","rhs_tigr_m_3camo_msv",
"RHS_UAZ_MSV_01","rhs_uaz_open_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_kamaz5350_msv",
"rhs_kamaz5350_open_msv","RHS_Ural_Open_MSV_01","rhs_zil131_msv","rhs_zil131_open_msv"
	];
	
GF_Missions_DAC_Pool_Armoured_Vehicles = [
	"rhs_bmp1_tv","rhs_bmp1k_tv","rhs_bmp2e_tv","rhs_bmp2d_tv","rhs_brm1k_tv","rhs_prp3_tv",
	"rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_bmp2k_tv","rhs_t80",
	"rhs_t90a_tv","rhs_bmp3_late_msv","rhs_bmp3m_msv","rhs_bmp3_msv"
	];
	
GF_Missions_DAC_Pool_Air_Vehicles = [
	"rhs_ka60_c","RHS_Mi8AMT_vvsc","RHS_Mi8AMTSh_vvsc","RHS_Mi8mt_vvsc",
	"RHS_Mi8mt_Cargo_vvsc","RHS_Mi8MTV3_vvsc","RHS_Mi8mtv3_Cargo_vvsc",
	"RHS_Mi8MTV3_heavy_vvsc","RHS_Mi8T_vvsc"
	];

//________________	End of DAC Pool	________________	




//________________	Missions Units Pool	________________

//________________	Civilian	________________

GF_Missions_Pool_Civilian = [

	/*
	//Idap 
	"C_Man_ConstructionWorker_01_Black_F", "C_Man_ConstructionWorker_01_Blue_F", "C_Man_ConstructionWorker_01_Red_F", 
	"C_Man_ConstructionWorker_01_Vrana_F", "C_Man_Fisherman_01_F", "C_Journalist_01_War_F", "C_Man_Messenger_01_F",
	"C_Man_Paramedic_01_F","C_Man_UAV_06_F","C_Man_UAV_06_medical_F","C_Man_UtilityWorker_01_F","C_Story_Mechanic_01_F",

	"C_IDAP_Man_AidWorker_01_F", "C_IDAP_Man_AidWorker_07_F", "C_IDAP_Man_AidWorker_08_F","C_IDAP_Man_AidWorker_09_F",
	"C_IDAP_Man_AidWorker_02_F", "C_IDAP_Man_AidWorker_05_F", "C_IDAP_Man_AidWorker_06_F", "C_IDAP_Man_AidWorker_04_F",
	"C_IDAP_Man_AidWorker_03_F","C_IDAP_Man_EOD_01_F","C_IDAP_Man_Paramedic_01_F","C_IDAP_Pilot_01_F","C_IDAP_Man_UAV_06_antimine_F",
	"C_IDAP_Man_UAV_01_F", "C_IDAP_Man_UAV_06_F", "C_IDAP_Man_UAV_06_medical_F","C_Story_EOD_01_F",
	*/
	
	"C_man_1", "C_man_1_1_F", "C_man_1_2_F", "C_man_1_3_F", "C_man_polo_1_F", "C_man_polo_1_F_afro", "C_man_polo_1_F_euro", 
	"C_man_polo_1_F_asia", "C_man_polo_2_F", "C_man_polo_2_F_afro", "C_man_polo_2_F_euro", "C_man_polo_2_F_asia", "C_man_polo_3_F",
	"C_man_polo_3_F_afro", "C_man_polo_3_F_euro", "C_man_polo_3_F_asia", "C_man_polo_4_F", "C_man_polo_4_F_afro", 
	"C_man_polo_4_F_euro","C_man_polo_4_F_asia", "C_man_polo_5_F", "C_man_polo_5_F_afro", "C_man_polo_5_F_euro", 
	"C_man_polo_5_F_asia", "C_man_polo_6_F","C_man_polo_6_F_afro", "C_man_polo_6_F_euro", "C_man_polo_6_F_asia", 
	"C_man_p_fugitive_F", "C_man_p_fugitive_F_afro","C_man_p_fugitive_F_euro", "C_man_p_fugitive_F_asia", "C_man_p_beggar_F", 
	"C_man_p_beggar_F_afro", "C_man_p_beggar_F_euro","C_man_p_beggar_F_asia", "C_man_w_worker_F", "C_scientist_F",
	"C_man_hunter_1_F", "C_man_p_shorts_1_F", "C_man_p_shorts_1_F_afro","C_man_p_shorts_1_F_euro", "C_man_p_shorts_1_F_asia",
	"C_man_shorts_1_F", "C_man_shorts_1_F_afro", "C_man_shorts_1_F_euro", "C_man_shorts_1_F_asia", "C_man_shorts_2_F", 
	"C_man_shorts_2_F_afro", "C_man_shorts_2_F_euro", "C_man_shorts_2_F_asia", "C_man_shorts_3_F", "C_man_shorts_3_F_afro",
	"C_man_shorts_3_F_euro", "C_man_shorts_3_F_asia", "C_man_shorts_4_F", "C_man_shorts_4_F_afro", "C_man_shorts_4_F_euro", 
	"C_man_shorts_4_F_asia", "C_journalist_F", "C_Orestes", "C_Nikos","C_Nikos_aged"
	];

//________________	Police	________________

GF_Missions_Pool_Infantry_Police = [
	"B_officer_F"
	];
	
//________________	Infantry	________________
	
GF_Missions_Pool_Infantry = [

	"rhs_msv_emr_aa","rhs_msv_emr_at","rhs_msv_emr_arifleman","rhs_msv_emr_efreitor","rhs_msv_emr_engineer",
	"rhs_msv_emr_grenadier_rpg","rhs_msv_emr_strelok_rpg_assist","rhs_msv_emr_junior_sergeant","rhs_msv_emr_machinegunner",
	"rhs_msv_emr_machinegunner_assistant","rhs_msv_emr_marksman","rhs_msv_emr_medic",
	"rhs_msv_emr_rifleman","rhs_msv_emr_grenadier","rhs_msv_emr_LAT","rhs_msv_emr_RShG2","rhs_msv_emr_sergeant"
	];

GF_Missions_Pool_Infantry_SF = [
	"rhs_vdv_recon_efreitor","rhs_vdv_recon_marksman","rhs_vdv_recon_marksman_asval",
	"rhs_vdv_recon_marksman_vss","rhs_vdv_recon_rifleman_scout_akm","rhs_vdv_recon_rifleman_scout"
	];
	
GF_Missions_Pool_Infantry_SF_Urban = [
	"rhs_vdv_recon_efreitor","rhs_vdv_recon_marksman","rhs_vdv_recon_marksman_asval",
	"rhs_vdv_recon_marksman_vss","rhs_vdv_recon_rifleman_scout_akm","rhs_vdv_recon_rifleman_scout"
	];
	
GF_Missions_Pool_Infantry_Recon = [
	"rhs_vdv_recon_efreitor","rhs_vdv_recon_marksman","rhs_vdv_recon_marksman_asval",
	"rhs_vdv_recon_marksman_vss","rhs_vdv_recon_rifleman_scout_akm","rhs_vdv_recon_rifleman_scout"
	];
	
GF_Missions_Pool_Infantry_Recon_SF = [
	"rhs_vdv_recon_efreitor","rhs_vdv_recon_marksman","rhs_vdv_recon_marksman_asval",
	"rhs_vdv_recon_marksman_vss","rhs_vdv_recon_rifleman_scout_akm","rhs_vdv_recon_rifleman_scout"
	];
	
GF_Missions_Pool_Infantry_Snipers = [
	"rhs_vdv_recon_marksman","rhs_vdv_recon_marksman_asval"

	];
	
GF_Missions_Pool_Infantry_Divers = [
	"O_diver_TL_F","O_diver_exp_F","O_diver_F"
	];
	
GF_Missions_Pool_Infantry_Helicopters = [

	"rhs_pilot_combat_heli"
	];
	
GF_Missions_Pool_Infantry_Crew = [
	"rhs_msv_emr_combatcrew"
	];
	
GF_Missions_Pool_Infantry_Planes = [
	"rhs_pilot_combat_heli"
	];

	
//________________	Vehicles	________________
	
GF_Missions_Pool_Land_Vehicles = [


"rhs_tigr_msv","rhs_tigr_3camo_msv","rhs_tigr_sts_msv","rhs_tigr_m_msv","rhs_tigr_m_3camo_msv",
"RHS_UAZ_MSV_01","rhs_uaz_open_MSV_01","rhs_gaz66_msv","rhs_gaz66o_msv","rhs_kamaz5350_msv",
"rhs_kamaz5350_open_msv","RHS_Ural_Open_MSV_01","rhs_zil131_msv","rhs_zil131_open_msv"
	];
	
GF_Missions_Pool_Armoured_Vehicles = [
	"rhs_bmp1_tv","rhs_bmp1k_tv","rhs_bmp2e_tv","rhs_bmp2d_tv","rhs_brm1k_tv","rhs_prp3_tv",
	"rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_bmp2k_tv","rhs_t80",
	"rhs_t90a_tv","rhs_bmp3_late_msv","rhs_bmp3m_msv","rhs_bmp3_msv"
	];
	
GF_Missions_Pool_Helicopters = [
	"rhs_ka60_c","RHS_Mi8AMT_vvsc","RHS_Mi8AMTSh_vvsc","RHS_Mi8mt_vvsc",
	"RHS_Mi8mt_Cargo_vvsc","RHS_Mi8MTV3_vvsc","RHS_Mi8mtv3_Cargo_vvsc",
	"RHS_Mi8MTV3_heavy_vvsc","RHS_Mi8T_vvsc"
	];
	
GF_Missions_Pool_Helicopters_Attack = [
"RHS_Ka52_vvsc","RHS_Mi24P_vvsc","RHS_Mi24V_vvsc","RHS_Mi24Vt_vvsc"
	];
	
GF_Missions_Pool_Helicopters_Transport = [
	"rhs_ka60_c","RHS_Mi8AMT_vvsc","RHS_Mi8AMTSh_vvsc","RHS_Mi8mt_vvsc",
	"RHS_Mi8mt_Cargo_vvsc","RHS_Mi8MTV3_vvsc","RHS_Mi8mtv3_Cargo_vvsc",
	"RHS_Mi8MTV3_heavy_vvsc","RHS_Mi8T_vvsc"
	];
	
GF_Missions_Pool_Static_Weapons = [
"rhs_Metis_9k115_2_msv","rhs_Kornet_9M133_2_msv","rhs_Igla_AA_pod_msv",
"RHS_AGS30_TriPod_MSV","rhs_KORD_MSV","rhs_KORD_high_MSV","RHS_NSV_TriPod_MSV",
"rhs_SPG9M_MSV","RHS_ZU23_MSV","rhs_2b14_82mm_msv"
	];

GF_Missions_Pool_Boats  = [
	"O_Boat_Armed_01_hmg_F","O_G_Boat_Transport_01_F"
	];
		
GF_Missions_Pool_UAV  = [
	"rhs_pchela1t_vvsc"
	];
	
GF_Missions_Pool_Planes = [
	"rhs_mig29s_vvs","rhs_mig29sm_vvs","RHS_Su25SM_vvs"
	];