#
# Description:	trigger to set CustomModelData
# Called by:	custom_roleplay_data:second
# Entity @s:	none
#
# Sets a tag marker for items so they don't overwrite existing CustomModelData
execute if items entity @s weapon.mainhand *\
    [\
        !minecraft:custom_model_data,\
        !minecraft:custom_data~{CustomRoleplayData:1b}\
    ] run \
    item modify entity @s weapon.mainhand custom_roleplay_data:marker_nbt
execute if items entity @s weapon.mainhand *\
    [\
        minecraft:custom_model_data,\
        !minecraft:custom_data={CustomRoleplayData:1b}\
    ] run \
    title @s actionbar \
        {\
            "text": "Can't set CustomModelData for this item!", \
            "color": "red"\
        }
# checks for xp
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{CustomRoleplayData:1b}] \
    unless score @s crd_xp >= #min_level crd_xp_dummy run \
    title @s actionbar \
        [\
            {\
                "text": "Requires at least ",\
                "color": "red"\
            },\
            {\
                "score": { \
                    "name": "#min_level", \
                    "objective": "crd_xp_dummy" \
                }, \
                "color": "aqua"\
            }, \
            {\
                "text": " level(s)!", \
                "color": "red"\
            }\
        ]
# Sets the CustomModelData for the item
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{CustomRoleplayData:1b}] \
    if score @s crd_xp >= #min_level crd_xp_dummy run \
    function custom_roleplay_data:num_set_data
