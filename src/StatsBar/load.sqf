disableSerialization;

101 cutRsc ["ExAd_STATSBAR", "PLAIN", 1];
	
_display = uiNameSpace getVariable ["ExAd_STATSBAR",displayNull];	
_statsBarCtrl = _display displayCtrl ExAd_SB_Dialog_CtrlBar_IDC;

_statsBarCtrl ctrlSetPosition ExAd_SB_GUI_POS;
_statsBarCtrl ctrlSetBackgroundColor ExAd_SB_GUI_BgColor;
_statsBarCtrl ctrlSetTextColor ExAd_SB_GUI_TextColor;
_statsBarCtrl ctrlCommit 0;	

ExAd_SB_Thread = [ExAd_SB_Update_Rate, ExAd_SB_fnc_thread, [], true] call ExileClient_system_thread_addtask;

true