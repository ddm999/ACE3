#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_SpareBarrel"};
        requiredVersion = 0.60;
        requiredAddons[] = {ace_common, ace_interaction};
        version = "0.95";
        versionStr = "0.95";
        versionAr[] = {0,95,0};
        author[] = {"commy2", "KoffeinFlummi", "CAA-Picard"};
        authorUrl = "https://github.com/commy2/";
    };
};

#include "CfgEventHandlers.hpp"

class ACE_Default_Keys {
    class clearJam {
        displayName = "$STR_ACE_Overheating_UnjamWeapon";
        condition = QUOTE( [_player] call EFUNC(common,canUseWeapon) && {currentWeapon _player in (_player getVariable [ARR_2(QUOTE(QGVAR(jammedWeapons)), [])])} );
        statement = QUOTE( [ARR_3(_player, currentMuzzle _player, false)] call FUNC(clearJam); );
        key = 19;
        shift = 1;
        control = 0;
        alt = 0;
    };
};

#include "CfgSounds.hpp"

#include "CfgVehicles.hpp"

#include "CfgWeapons.hpp"
