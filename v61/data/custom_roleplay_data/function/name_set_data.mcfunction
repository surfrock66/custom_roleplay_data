#
# Description:	Sets the data for item in-hand
# Called by:	custom_roleplay_data:name_trigger
# Entity @s:	none
#
# Change the custom model data
$item modify entity @s weapon.mainhand {"function":"minecraft:set_custom_model_data","strings":{"values":["$(model_name)"], "mode": "replace_all"}}
# Clear the global value
$title @s actionbar [{"text": "Set CustomModelData to ", "color": "green"}, {"text":"$(model_name)", "color": "aqua"}]
data modify storage custom_roleplay_data:name model_name set value null
# plays sound
execute at @s run playsound minecraft:block.anvil.use player @s ~ ~ ~ 0.4 0.6
