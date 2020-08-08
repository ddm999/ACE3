// This config accepts both item type numbers and item class names
// Item type numbers need the prefix ItemType_, so for example ItemType_401
// Class names need no special prefix
class EGVAR(medical,replacementItems) {
    DOUBLES(ItemType,TYPE_FIRST_AID_KIT)[] = {
        {"ACE_packingBandage", 3},
        {"ACE_morphine", 2},
        {"ACE_tourniquet", 1},
        {"ACE_splint", 1}
    };
    DOUBLES(ItemType,TYPE_MEDIKIT)[] = {
        {"ACE_packingBandage", 10},
        {"ACE_elasticBandage", 10},
        {"ACE_morphine", 5},
        {"ACE_tourniquet", 5},
        {"ACE_splint", 5},
        {"ACE_epinephrine", 5},
        {"ACE_salineIV_250", 4},
        {"ACE_personalAidKit", 1},
        {"ACE_surgicalKit", 1}
    };
    ACE_atropine[] = {
        {"ACE_adenosine", 1}
    };
};
