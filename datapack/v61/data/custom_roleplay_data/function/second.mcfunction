#
# Description:	Function that repeats every second
# Called by:	custom_roleplay_data:init
# Entity @s:	none
#
# reschedules
schedule function custom_roleplay_data:second 1s
#
# trigger detection
#
execute as @a[scores={CustomModelData=0..}] if data entity @s SelectedItem.id run function custom_roleplay_data:num_trigger
execute as @a[scores={CustomModelName=1}] if data entity @s SelectedItem.id run function custom_roleplay_data:name_trigger
# resets trigger
execute as @a run function custom_roleplay_data:enable
