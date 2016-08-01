call compile preprocessFileLineNumbers "StatsBar\init.sqf";

if(!ExAd_SB_Active)exitWith{false};

[] spawn {
	waituntil {!isnil "bis_fnc_init" && !isNull findDisplay 46 && alive player};

	//Debug purpose 
	ExileClientLoadedIn = true;
	call ExileClient_system_thread_initialize;
	//End debug

	call ExAd_SB_fnc_load;
};