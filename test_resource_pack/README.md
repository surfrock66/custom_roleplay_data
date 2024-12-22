# Test Resource Packs

These resource packs serve as tests to help you understand how to format a resource pack for different versions to support custom models.  These are examples of using custom namespaces to separate out your textures and models from the vanilla versions.

There are some important notes:

- The "Supported Formats" selector in pack.mcmeta doesn't work before 1.20.2 and your resource packs will show up as incompatible, and worst of all even if you bypass the warning, custom models load inconistently.  By directly targeting the pack format, it will work.
- For versions before 1.21.4, you must use the "predicate" syntax to indicate a numerical entry for your custom model, in a custom item/block definition under the minecraft namespace.  See "carved_pumpkin" as an example.
    - To demonstrate changing the model to "Test 1", with the item selected in your hotbar run "/trigger CustomModelData set 1"
- For versions starting with 1.21.4, if you want to refer to your models by name (which is NOT backwards compatible) you must use the "select" syntax to indicate a name for your custom model, in a custom item/block definition under the minecraft namespace.  See "carved_pumpkin" as an example.
    - To demonstrate changing the model to "Test 2", use an anvil to rename the item to exactly "test2" and then with the item selected in your hotbar run "/trigger CustomModelName"
- For versions starting with 1.21.4, if you want to refer to your models by number (which supports backwards compatability) you must use the "range_dispatch" syntax to indicate a number for your custom model, in a custom item/block definition under the minecraft namespace.  See "dirt" as an example.
    - To demonstrate changing the model to "Test 3", with the item selected in your hotbar run "/trigger CustomModelData set 3"
