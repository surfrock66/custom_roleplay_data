# custom_roleplay_data
 A datapack that allows you to easily change the CustomModelData of items to change the look of items using resource packs.

## Description
 This datapack allows users to trigger changing the custom model of an item held in their hand.  This has undergone a major rework to support changes in datapack v61 (for 1.21.4) which not only changes how resourcepacks have to be formatted, but also supports changing custom models with a name (as opposed to number).  This leads us to the following conditions:

- Resource Pack Version 42 or less (1.21.3 or less) and Data Pack version 57 or less (1.21.3 or less): Resource packs must reference custom models by integers.
    - The command would be "/trigger CustomModelData set #" and might require a number of levels (default 1 but configurable)
- Resource Pack Version 46 (1.21.4) supporting models referenced by numbers and Data Pack version 61 (1.21.4): Resource packs must reference custom models by range_dispatch and threshholds
    - The command would be "/trigger CustomModelData set #" and might require a number of levels (default 1 but configurable)
- Resource Pack Version 46 (1.21.4) supporting models referenced by strings and Data Pack version 61 (1.21.4): Resource packs must reference custom models by select and string
    - The item should be renamed in an anvil to the exact string that references the model
    - The command would be "/trigger CustomModelName" and does not require levels other than those needed to rename the item
 
To support this, the following examples are meant to assist in formatting resource packs:

- Resource Pack Version 42 (1.21.3) or less (in assets/minecraft/models/item/carved_pumpkin.json)
```
{
  "parent": "minecraft:block/carved_pumpkin",
  "overrides": [
    { "predicate": {"custom_model_data": 1}, "model": "item/pinball_helmet" },
    { "predicate": {"custom_model_data": 2}, "model": "item/pinball_helmet_2" },
    ...
    { "predicate": {"custom_model_data": 3}, "model": "item/pinball_scale" }
  ]
}
```
- Resource Pack Version 61 (1.21.4) using numbers/floats (in assets/minecraft/models/item/carved_pumpkin.json)
```
{
  "model": {
    "type": "range_dispatch",
    "property": "custom_model_data",
    "fallback": {
      "type": "model",
      "model": "block/carved_pumpkin"
    },
    "index": 0,
    "entries": [
      { "threshold": 1, "model": { "type": "model", "model": "teh3l3m3nts:item/pinball_helmet" } },
      { "threshold": 2, "model": { "type": "model", "model": "teh3l3m3nts:item/pinball_helmet_2" } },
      ...
      { "threshold": 3, "model": { "type": "model", "model": "teh3l3m3nts:item/pinball_scale" } }
    ]
  }
}
```
- Resource Pack Version 61 (1.21.4) using strings/names (in assets/minecraft/models/item/carved_pumpkin.json)
```
{
  "model": {
    "type": "select",
    "property": "custom_model_data",
    "fallback": {
      "type": "model",
      "model": "block/carved_pumpkin"
    },
    "cases": [
      { "when": "pinball_helmet", "model": { "type": "model", "model": "teh3l3m3nts:item/pinball_helmet" } },
      { "when": "pinball_helmet_2", "model": { "type": "model", "model": "teh3l3m3nts:item/pinball_helmet_2" } },
      ...
      { "when": "pinball_scale", "model": { "type": "model", "model": "teh3l3m3nts:item/pinball_scale" } }
    ]
  }
}
```
