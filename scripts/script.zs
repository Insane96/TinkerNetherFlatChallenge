import mods.jei.JEI;
import crafttweaker.api.tag.MCTag;
import crafttweaker.api.item.ItemDefinition;
import crafttweaker.api.recipe.Replacer;
import crafttweaker.api.text.TextComponent;
import crafttweaker.api.text.Style;
import crafttweaker.api.events.CTEventManager;
import crafttweaker.api.event.block.BlockBreakEvent;
import crafttweaker.api.block.BlockState;

//var tagsToRemoveAndHide = [] as KnownTag<ItemDefinition>[];

var itemsToRemoveAndHide = [
    <item:minecraft:bookshelf>, <item:minecraft:chest>, 
    <item:minecraft:wooden_sword>, <item:minecraft:wooden_shovel>, <item:minecraft:wooden_pickaxe>, <item:minecraft:wooden_axe>, <item:minecraft:wooden_hoe>, 
    <item:minecraft:stone_sword>, <item:minecraft:stone_shovel>, <item:minecraft:stone_pickaxe>, <item:minecraft:stone_axe>, <item:minecraft:stone_hoe>, 
    <item:minecraft:golden_sword>, <item:minecraft:golden_shovel>, <item:minecraft:golden_pickaxe>, <item:minecraft:golden_axe>, <item:minecraft:golden_hoe>, 
    <item:minecraft:iron_sword>, <item:minecraft:iron_shovel>, <item:minecraft:iron_pickaxe>, <item:minecraft:iron_axe>, <item:minecraft:iron_hoe>, 
    <item:minecraft:diamond_sword>, <item:minecraft:diamond_shovel>, <item:minecraft:diamond_pickaxe>, <item:minecraft:diamond_axe>, <item:minecraft:diamond_hoe>, 
    <item:minecraft:netherite_sword>, <item:minecraft:netherite_shovel>, <item:minecraft:netherite_pickaxe>, <item:minecraft:netherite_axe>, <item:minecraft:netherite_hoe>, 
    <item:minecraft:leather_helmet>, <item:minecraft:leather_chestplate>, <item:minecraft:leather_leggings>, <item:minecraft:leather_boots>, 
    <item:minecraft:chainmail_helmet>, <item:minecraft:chainmail_chestplate>, <item:minecraft:chainmail_leggings>, <item:minecraft:chainmail_boots>, 
    <item:minecraft:golden_helmet>, <item:minecraft:golden_chestplate>, <item:minecraft:golden_leggings>, <item:minecraft:golden_boots>, 
    <item:minecraft:iron_helmet>, <item:minecraft:iron_chestplate>, <item:minecraft:iron_leggings>, <item:minecraft:iron_boots>, 
    <item:minecraft:diamond_helmet>, <item:minecraft:diamond_chestplate>, <item:minecraft:diamond_leggings>, <item:minecraft:diamond_boots>, 
    <item:minecraft:netherite_helmet>, <item:minecraft:netherite_chestplate>, <item:minecraft:netherite_leggings>, <item:minecraft:netherite_boots>, <item:minecraft:shears>, <item:minecraft:bow>, <item:minecraft:crossbow>, 
    <item:tconstruct:efln_ball>, 
    <item:tconstruct:earth_slime_crystal_cluster>, <item:tconstruct:budding_earth_slime_crystal>, <item:tconstruct:small_earth_slime_crystal_bud>, <item:tconstruct:medium_earth_slime_crystal_bud>, <item:tconstruct:large_earth_slime_crystal_bud>, 
    <item:tconstruct:sky_slime_crystal_cluster>, <item:tconstruct:budding_sky_slime_crystal>, <item:tconstruct:small_sky_slime_crystal_bud>, <item:tconstruct:medium_sky_slime_crystal_bud>, <item:tconstruct:large_sky_slime_crystal_bud>, 
    <item:tconstruct:ichor_slime_crystal_cluster>, <item:tconstruct:budding_ichor_slime_crystal>, <item:tconstruct:small_ichor_slime_crystal_bud>, <item:tconstruct:medium_ichor_slime_crystal_bud>, <item:tconstruct:large_ichor_slime_crystal_bud>, 
    <item:tconstruct:ender_slime_crystal_cluster>, <item:tconstruct:budding_ender_slime_crystal>, <item:tconstruct:small_ender_slime_crystal_bud>, <item:tconstruct:medium_ender_slime_crystal_bud>, <item:tconstruct:large_ender_slime_crystal_bud>] as ItemDefinition[];

var itemsToRemove = [] as ItemDefinition[];

/*for tag in tagsToRemoveAndHide {
    removeAndHideTag(tag);
}*/
for item in itemsToRemoveAndHide {
    removeAndHideItem(item);
}
for item in itemsToRemove {
    craftingTable.remove(item.defaultInstance);
}

var itemsToHide = [<item:minecraft:trident>] as ItemDefinition[];

for item in itemsToHide {
    JEI.hideIngredient(item.defaultInstance);
}

var tools = [<item:minecraft:wooden_sword>, <item:minecraft:wooden_shovel>, <item:minecraft:wooden_pickaxe>, <item:minecraft:wooden_axe>, <item:minecraft:wooden_hoe>, <item:minecraft:stone_sword>, <item:minecraft:stone_shovel>, <item:minecraft:stone_pickaxe>, <item:minecraft:stone_axe>, <item:minecraft:stone_hoe>, <item:minecraft:golden_sword>, <item:minecraft:golden_shovel>, <item:minecraft:golden_pickaxe>, <item:minecraft:golden_axe>, <item:minecraft:golden_hoe>, <item:minecraft:iron_sword>, <item:minecraft:iron_shovel>, <item:minecraft:iron_pickaxe>, <item:minecraft:iron_axe>, <item:minecraft:iron_hoe>, <item:minecraft:diamond_sword>, <item:minecraft:diamond_shovel>, <item:minecraft:diamond_pickaxe>, <item:minecraft:diamond_axe>, <item:minecraft:diamond_hoe>, <item:minecraft:netherite_sword>, <item:minecraft:netherite_shovel>, <item:minecraft:netherite_pickaxe>, <item:minecraft:netherite_axe>, <item:minecraft:netherite_hoe>, <item:minecraft:leather_helmet>, <item:minecraft:leather_chestplate>, <item:minecraft:leather_leggings>, <item:minecraft:leather_boots>, <item:minecraft:chainmail_helmet>, <item:minecraft:chainmail_chestplate>, <item:minecraft:chainmail_leggings>, <item:minecraft:chainmail_boots>, <item:minecraft:golden_helmet>, <item:minecraft:golden_chestplate>, <item:minecraft:golden_leggings>, <item:minecraft:golden_boots>, <item:minecraft:iron_helmet>, <item:minecraft:iron_chestplate>, <item:minecraft:iron_leggings>, <item:minecraft:iron_boots>, <item:minecraft:diamond_helmet>, <item:minecraft:diamond_chestplate>, <item:minecraft:diamond_leggings>, <item:minecraft:diamond_boots>, <item:minecraft:netherite_helmet>, <item:minecraft:netherite_chestplate>, <item:minecraft:netherite_leggings>, <item:minecraft:netherite_boots>, <item:minecraft:shears>, <item:minecraft:bow>, <item:minecraft:crossbow>] as ItemDefinition[];
var useless = "It's useless like a golden tool. Maybe can be recycled" as TextComponent;

for item in tools {
    item.defaultInstance.anyDamage().addTooltip(useless.setStyle(Style.empty().withColor(<constant:minecraft:formatting:dark_red>)));
}

var netherPortal = "It breaks easily. But can light up a Nether portal. Better upgrade to a Flint and Brick ASAP" as TextComponent;
<item:minecraft:flint_and_steel>.anyDamage().addTooltip(netherPortal.setStyle(Style.empty().withColor(<constant:minecraft:formatting:light_purple>)));

var elytraTooltip = "It breaks easily. You should upgrade it to a Slimelytra ASAP" as TextComponent;
<item:minecraft:elytra>.anyDamage().addTooltip(elytraTooltip.setStyle(Style.empty().withColor(<constant:minecraft:formatting:light_purple>)));

/*function removeAndHideTag(tag as MCTag<ItemDefinition>) as void {
    for item in tag {
        removeAndHideItem(item);
    }
}*/

function removeAndHideItem(item as ItemDefinition) as void {
    craftingTable.remove(item.defaultInstance);
    JEI.hideIngredient(item.defaultInstance);
}

var blocksNoExp = [<blockstate:minecraft:coal_ore>, <blockstate:minecraft:copper_ore>, <blockstate:minecraft:diamond_ore>, <blockstate:minecraft:emerald_ore>, <blockstate:minecraft:gold_ore>, <blockstate:minecraft:iron_ore>, <blockstate:minecraft:lapis_ore>, <blockstate:minecraft:redstone_ore>, <blockstate:minecraft:deepslate_coal_ore>, <blockstate:minecraft:deepslate_copper_ore>, <blockstate:minecraft:deepslate_diamond_ore>, <blockstate:minecraft:deepslate_emerald_ore>, <blockstate:minecraft:deepslate_gold_ore>, <blockstate:minecraft:deepslate_iron_ore>, <blockstate:minecraft:deepslate_lapis_ore>, <blockstate:minecraft:deepslate_redstone_ore>, <blockstate:minecraft:nether_quartz_ore>] as BlockState[];

CTEventManager.register<BlockBreakEvent>((event) => {
    for block in blocksNoExp {
        if (event.getBlockState() == block) {
            event.expToDrop = 0;
            break;
        }
    }
});