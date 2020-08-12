#include "script_component.hpp"
/*
 * Author: ddm999
 * Recoil text statement.
 *
 * Arguments:
 * 0: Stats Array (not used) <ARRAY>
 * 1: Item Config <CONFIG>
 *
 * Return Value:
 * Number
 *
 * Public: No
*/

params ["", "_config"];

private _recoilMO = (configFile >> "CfgRecoils" >> (getText (_config >> "recoil")) >> "muzzleOuter") call BIS_fnc_getCfgData;
private _recoilPermanent = (configFile >> "CfgRecoils" >> (getText (_config >> "recoil")) >> "permanent") call BIS_fnc_getCfgData;
private _recoilTemporary = (configFile >> "CfgRecoils" >> (getText (_config >> "recoil")) >> "temporary") call BIS_fnc_getCfgData;

// awful workaround for BI putting expressions into configs (and therefore not knowing if type is scalar or string)
private _recoilX, _recoilY, _recoilA, _recoilB;
_recoilX = call (compile (["_recoilMO select 0", "call (compile (_recoilMO select 0))"] select ((_recoilMO select 0) isEqualType "STRING")));
_recoilY = call (compile (["_recoilMO select 1", "call (compile (_recoilMO select 1))"] select ((_recoilMO select 1) isEqualType "STRING")));
_recoilA = call (compile (["_recoilMO select 2", "call (compile (_recoilMO select 2))"] select ((_recoilMO select 2) isEqualType "STRING")));
_recoilB = call (compile (["_recoilMO select 3", "call (compile (_recoilMO select 3))"] select ((_recoilMO select 3) isEqualType "STRING")));

_recoilPermanent = call (compile (["_recoilPermanent", "call (compile _recoilPermanent)"] select (_recoilPermanent isEqualType "STRING")));
_recoilTemporary = call (compile (["_recoilTemporary", "call (compile _recoilTemporary)"] select (_recoilTemporary isEqualType "STRING")));

// center of recoil ellipse
private _recoilMain = ((_recoilX^2)+(_recoilY^2))^(1/2);

// radius of recoil ellipse (simplifying down to a circle)
private _recoilDeviation = (_recoilA+_recoilB)/2;

// amount of temporary relative to the displayed permanent
private _recoilKickPct = ((_recoilTemporary+_recoilPermanent)/_recoilPermanent)-1;

//TRACE_2("statTextStatement_recoil (out)", _recoilMain, _recoilDeviation);
format ["%1±%2 MIL (+%3%4 kick)", (_recoilMain*_recoilPermanent*1000) toFixed 0, (_recoilDeviation*_recoilPermanent*1000) toFixed 0, (_recoilKickPct*100) toFixed 0, "%"]
