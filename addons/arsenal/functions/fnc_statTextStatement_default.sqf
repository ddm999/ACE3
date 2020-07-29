#include "script_component.hpp"
/*
 * Author: ddm999
 * Generic text statement for stats.
 *
 * Arguments:
 * 0: stat (STRING)
 * 1: item config path (CONFIG)
 * 2: multiplier (SCALAR)
 * 3: number of decimals to show (SCALAR)
 * 4: suffix to add (STRING)
 *
 * Return Value:
 * String to display
 *
 * Public: Yes
*/

params ["_stat", "_config", "_multiplier", "_decimals", "_suffix"];

private _statValues = [
    [_config],
    [_stat],
    [false],
    [0]
] call BIS_fnc_configExtremes;

format ["%1%2", (((_statValues select 1) select 0)*_multiplier) toFixed _decimals, _suffix];
