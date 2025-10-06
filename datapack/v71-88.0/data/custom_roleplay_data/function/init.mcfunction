#
# Description:	Sets up datapack
# Called by:	#minecraft:init
# Entity @s:	none
#
# adds trigger scoreboard for int/float models
scoreboard objectives add CustomModelData trigger
scoreboard players set @a CustomModelData -2147483648
scoreboard players enable @a CustomModelData

# adds trigger for string based models
scoreboard objectives add CustomModelName trigger
scoreboard players set @a CustomModelName 0
scoreboard players enable @a CustomModelName

# Initializes data
data modify storage custom_roleplay_data:name model_name set value null

# xp level
scoreboard objectives add crd_xp level
scoreboard objectives add crd_xp_dummy dummy

# min xp required
execute unless score #min_level crd_xp_dummy matches 0.. run scoreboard players set #min_level crd_xp_dummy 1

# initializes second function
function custom_roleplay_data:second
