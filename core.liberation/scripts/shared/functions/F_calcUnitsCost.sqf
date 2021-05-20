[] call compileFinal preprocessFileLineNumbers "scripts\loadouts\init_loadouts.sqf";
private _grp = createGroup [GRLIB_side_friendly, true];
{
	_unit_class = _x select 0;
	_unit_mp = _x select 1;
	_unit_rank = _x select 4;
	_unit = _grp createUnit [_unit_class, [0,0,0], [], 0, "NONE"];
	if (typeOf _unit in units_loadout_overide) then {
		private _loadouts_folder = format ["scripts\loadouts\forced\%1\%2.sqf", GRLIB_side_friendly, typeOf _unit];
		[_unit] call compileFinal preprocessFileLineNUmbers _loadouts_folder;
	};
	_price = [_unit] call F_loadoutPrice;
	infantry_units set [_forEachIndex, [_unit_class, _unit_mp, _price, 0,_unit_rank]];
	deleteVehicle _unit;
} foreach infantry_units;
