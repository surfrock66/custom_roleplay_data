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
# Set the global custom model name value to use
data modify storage custom_roleplay_data:name model_name set string entity @s SelectedItem.components."minecraft:custom_name"
# Sets the Custom Model Data for the item
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{CustomRoleplayData:1b}] run \
    function custom_roleplay_data:name_set_data with storage custom_roleplay_data:name
