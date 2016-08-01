ExAd_SB_Dialog_CtrlBar_IDC = 1100;

ExAd_SB_Update_Rate = profileNamespace getVariable ["ExAd_SB_Update_Rate", 1];
ExAd_SB_Active = profileNamespace getVariable ["ExAd_SB_Active", true];

ExAd_SB_GUI_POS = profileNamespace getVariable ["ExAd_SB_GUI_POS", [safeZoneX, safeZoneY + safeZoneH - 32 * pixelH, safeZoneW, 30 * pixelH]];
ExAd_SB_GUI_TextColor = profileNamespace getVariable ["ExAd_SB_GUI_TextColor", [0,0,0,1]];
ExAd_SB_GUI_BgColor = profileNamespace getVariable ["ExAd_SB_GUI_BgColor", [0.6,0.05,0,1]];

ExAd_SB_Text_Margin = profileNamespace getVariable ["ExAd_SB_Text_Margin", " "];
ExAd_SB_Text_InnerMargin = profileNamespace getVariable ["ExAd_SB_Text_InnerMargin", ""];
ExAd_SB_Text_Font = profileNamespace getVariable ["ExAd_SB_Text_Font", "OrbitronLight"];
ExAd_SB_Text_Align = profileNamespace getVariable ["ExAd_SB_Text_Align", "center"];
ExAd_SB_Text_Size = profileNamespace getVariable ["ExAd_SB_Text_Size", 1];

ExAd_SB_Show_KD = profileNamespace getVariable ["ExAd_SB_Show_KD", true];
ExAd_SB_Show_HP = profileNamespace getVariable ["ExAd_SB_Show_HP", true];
ExAd_SB_Show_Thirst = profileNamespace getVariable ["ExAd_SB_Show_Thirst", true];
ExAd_SB_Show_Hunger = profileNamespace getVariable ["ExAd_SB_Show_Hunger", true];
ExAd_SB_Show_Wallet = profileNamespace getVariable ["ExAd_SB_Show_Wallet", true];
ExAd_SB_Show_Bank = profileNamespace getVariable ["ExAd_SB_Show_Bank", true];
ExAd_SB_Show_Respect = profileNamespace getVariable ["ExAd_SB_Show_Respect", true];
ExAd_SB_Show_FPS = profileNamespace getVariable ["ExAd_SB_Show_FPS", true];
ExAd_SB_Show_Time = profileNamespace getVariable ["ExAd_SB_Show_Time", true];
ExAd_SB_Show_Temp = profileNamespace getVariable ["ExAd_SB_Show_Temp", true];
ExAd_SB_Show_Grid = profileNamespace getVariable ["ExAd_SB_Show_Grid", true];
ExAd_SB_Show_Compass = profileNamespace getVariable ["ExAd_SB_Show_Compass", true];
ExAd_SB_Show_PlayerCount = profileNamespace getVariable ["ExAd_SB_Show_PlayerCount", true];
ExAd_SB_Show_ClanCount = profileNamespace getVariable ["ExAd_SB_Show_ClanCount", true];
	
ExAd_SB_fnc_thread = compile preprocessFileLineNumbers "StatsBar\thread.sqf";
ExAd_SB_fnc_load = compile preprocessFileLineNumbers "StatsBar\load.sqf";


ExAd_SB_fnc_getKDRatioStr = {
	_death = if(ExileClientPlayerDeaths == 0)then{0.001}else{ExileClientPlayerDeaths};
	_kd = [ExileClientPlayerKills / _death, 2] call ExileClient_util_math_round;
	[[["\a3\ui_f\data\gui\cfg\respawnroles\recon_ca.paa"] call ExAd_SB_fnc_formatImage, _kd]] call ExAd_SB_fnc_formatOutput
};

ExAd_SB_fnc_getHealthStr = {
	[[["exile_assets\texture\ui\xm8_app_health_scanner_ca.paa"] call ExAd_SB_fnc_formatImage,round (ExileClientPlayerAttributes select 0)]] call ExAd_SB_fnc_formatOutput
};

ExAd_SB_fnc_getThirstStr = {
	[[["StatsBar\icons\thirst.paa",1.25] call ExAd_SB_fnc_formatImage,round (ExileClientPlayerAttributes select 3)]] call ExAd_SB_fnc_formatOutput
};

ExAd_SB_fnc_getHungerStr = {
	[[["StatsBar\icons\hunger.paa",1.25] call ExAd_SB_fnc_formatImage,round (ExileClientPlayerAttributes select 2)]] call ExAd_SB_fnc_formatOutput
};

ExAd_SB_fnc_getWalletStr = {
	[[["exile_assets\texture\ui\poptab_ca.paa"] call ExAd_SB_fnc_formatImage,player getVariable ["ExileMoney", 0]]] call ExAd_SB_fnc_formatOutput
};

ExAd_SB_fnc_getBankStr = {
	[[["exile_assets\texture\ui\map_safe_ca.paa"] call ExAd_SB_fnc_formatImage, player getVariable["ExileLocker",0]]] call ExAd_SB_fnc_formatOutput
};

ExAd_SB_fnc_getRespectStr = {
	[[["StatsBar\icons\respect.paa",0.75] call ExAd_SB_fnc_formatImage,ExileClientPlayerScore]] call ExAd_SB_fnc_formatOutput
};

ExAd_SB_fnc_getFPSStr = {
	[["FPS", floor diag_fps]] call ExAd_SB_fnc_formatOutput
};

ExAd_SB_fnc_getTimerStr = {
	_time = serverTime;
	_hours = 2 - floor (_time / 3600);
	_minutes = 59 - floor ((_time % 3600) / 60);
	[[["StatsBar\icons\restart.paa"] call ExAd_SB_fnc_formatImage, format["%1:%2", _hours,_minutes]]] call ExAd_SB_fnc_formatOutput
};

ExAd_SB_fnc_getTempStr = {
	_temp = [ExileClientPlayerAttributes select 5, 1] call ExileClient_util_math_round;
	[[["StatsBar\icons\thermostat.paa"] call ExAd_SB_fnc_formatImage, _temp, "°C"]] call ExAd_SB_fnc_formatOutput
};

ExAd_SB_fnc_getGridStr = {
	_grid = mapGridPosition player;
	[[["\a3\ui_f\data\gui\rsc\rscdisplayarsenal\compass_ca.paa",1.4] call ExAd_SB_fnc_formatImage, format["%1|%2",(_grid select [0,3]),(_grid select [3,3])]]] call ExAd_SB_fnc_formatOutput
};

ExAd_SB_fnc_getCompassStr = {
	_dir = direction player;
	try
	{
		if(_dir >= 337.5 || _dir < 22.5 )then{throw "N"};
		if(_dir >= 22.5 && _dir < 67.5 )then{throw "NE"};
		if(_dir >= 67.5 && _dir < 112.5 )then{throw "E"};
		if(_dir >= 112.5 && _dir < 157.5 )then{throw "SE"};
		if(_dir >= 157.5 && _dir < 202.5 )then{throw "S"};
		if(_dir >= 202.5 && _dir < 247.5 )then{throw "SW"};
		if(_dir >= 247.5 && _dir < 292.5 )then{throw "W"};
		if(_dir >= 292.5 && _dir < 337.5 )then{throw "NW"};

		throw "N/A"
	} 
	catch 
	{
		[[["StatsBar\icons\compass.paa",0.75] call ExAd_SB_fnc_formatImage, _exception, round _dir ]] call ExAd_SB_fnc_formatOutput
	}
};

ExAd_SB_fnc_getPlayersStr = {
	[[["StatsBar\icons\players.paa"] call ExAd_SB_fnc_formatImage, count playableUnits]] call ExAd_SB_fnc_formatOutput
};

ExAd_SB_fnc_getFamilyStr = {
	[[["exile_assets\texture\ui\xm8_app_clan_ca.paa"] call ExAd_SB_fnc_formatImage, "1/1"]] call ExAd_SB_fnc_formatOutput
};


ExAd_SB_fnc_formatOutput = {
	params [["_elements", [], [[]]], ["_text",""]];
	{
		_text = format["%1%3%2", _text, _x, ExAd_SB_Text_InnerMargin];
	}forEach _elements;
	format["%1%2%1", ExAd_SB_Text_Margin , _text ];
};

ExAd_SB_fnc_formatImage = {
	params [["_src","",[""]],["_size",1,[0]]];
	format["<img size='%2' image='%1' />", _src,_size];
};