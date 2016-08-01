class CfgXM8
{
	extraApps[] = {"ExAd_SB"};

	class ExAd_SB 
	{
		title = "Statsbar Settings";
		controlID = 50400;					//IDC:50300 -> 50305 || These need to be unique and out of range from each other
		config = "ExadClient\XM8\Apps\SB_Settings\config.sqf";
		logo = "ExadClient\XM8\Apps\SB_Settings\Icon_SB.paa";
		onLoad = "ExAdClient\XM8\Apps\SB_Settings\onLoad.sqf";
		onOpen = "ExAdClient\XM8\Apps\SB_Settings\onOpen.sqf";
	};
}; 