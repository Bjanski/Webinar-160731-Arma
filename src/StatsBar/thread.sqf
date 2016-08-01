disableSerialization;

_display = uiNameSpace getVariable ["ExAd_STATSBAR",displayNull];	
_statsBarCtrl = _display displayCtrl 1100;

_text = format[
	"<t align='%2' valign='middle' font='%1' size='%3'>%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%4</t>",
	ExAd_SB_Text_Font,
	ExAd_SB_Text_Align,
	ExAd_SB_Text_Size,
	ExAd_SB_Text_Margin,
	(if(ExAd_SB_Show_KD)then{call ExAd_SB_fnc_getKDRatioStr}else{""}),
	(if(ExAd_SB_Show_HP)then{call ExAd_SB_fnc_getHealthStr}else{""}),
	(if(ExAd_SB_Show_Thirst)then{call ExAd_SB_fnc_getThirstStr}else{""}),
	(if(ExAd_SB_Show_Hunger)then{call ExAd_SB_fnc_getHungerStr}else{""}),
	(if(ExAd_SB_Show_Wallet)then{call ExAd_SB_fnc_getWalletStr}else{""}),
	(if(ExAd_SB_Show_Bank)then{call ExAd_SB_fnc_getBankStr}else{""}),
	(if(ExAd_SB_Show_Respect)then{call ExAd_SB_fnc_getRespectStr}else{""}),
	(if(ExAd_SB_Show_FPS)then{call ExAd_SB_fnc_getFPSStr}else{""}),
	(if(ExAd_SB_Show_Time)then{call ExAd_SB_fnc_getTimerStr}else{""}),
	(if(ExAd_SB_Show_Temp)then{call ExAd_SB_fnc_getTempStr}else{""}),
	(if(ExAd_SB_Show_Grid)then{call ExAd_SB_fnc_getGridStr}else{""}),
	(if(ExAd_SB_Show_Compass)then{call ExAd_SB_fnc_getCompassStr}else{""}),
	(if(ExAd_SB_Show_PlayerCount)then{call ExAd_SB_fnc_getPlayersStr}else{""}),
	(if(ExAd_SB_Show_ClanCount)then{call ExAd_SB_fnc_getFamilyStr}else{""})
];

_statsBarCtrl ctrlSetStructuredText parseText _text;

true