[
    QGVAR(showClearGlasses),
    "CHECKBOX",
    [LSTRING(SettingShowClearGlasses), LELSTRING(common,showActionInSelfInteraction)],
    localize LSTRING(SettingsName),
    false, // default value
    0 // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(useContactBlindfold),
    "CHECKBOX",
    [LSTRING(SettingUseContactBlindfold_DisplayName), LSTRING(SettingUseContactBlindfold_Description)],
    localize LSTRING(SettingsName),
    false, // default value
    2 // the Contact blindfold is probably harder to see through, so enforce this on clients
] call CBA_fnc_addSetting;