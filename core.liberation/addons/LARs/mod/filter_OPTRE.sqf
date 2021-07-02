// Add OPTRE Weapons
if ( GRLIB_OPTRE_enabled ) then {
	 GRLIB_OPTRE_Blacklist = [
	];
	(
		"
		getText (_x >> 'dlc') == 'OPTRE' &&
		toLower (configName _x) find '_coyote' < 0 &&
		!((configName _x) in GRLIB_OPTRE_Blacklist)
		"
		configClasses (configfile >> "CfgWeapons" )
	) apply { GRLIB_whitelisted_from_arsenal pushback (configName _x) } ;

	(
		"
		((configName _x) select [0,6]) == 'OPTRE_' &&
		(configName _x) find '_Tracer' < 0 &&
		!((configName _x) in GRLIB_OPTRE_Blacklist)
		"
    	configClasses (configfile >> "CfgMagazines")
	) apply { GRLIB_whitelisted_from_arsenal pushback (configName _x)} ;

    GRLIB_mod_enabled = true;
};