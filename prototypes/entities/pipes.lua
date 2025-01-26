local function color_sprites(array, tint)
    for _, dat in pairs(array) do
        if dat.layers then
            color_sprites(dat.layers, tint)
        else
            dat.tint = tint
        end
    end
    return array
end

local tint = { r = 120 / 255, g = 120 / 255, b = 120 / 255, a = 1 }

local plasma_pipe = table.deepcopy(data.raw["pipe"]["pipe"])
plasma_pipe.minable = { mining_time = 0.1, result = "plasma_pipe" }
plasma_pipe.name = "plasma_pipe"
plasma_pipe.fluid_box["filter"] = "fusion-plasma"
for _, pipe_connection in pairs(plasma_pipe.fluid_box.pipe_connections) do
    pipe_connection.connection_type = "normal"
    pipe_connection.connection_category = "fusion-plasma"
end
plasma_pipe.surface_conditions = { { property = "gravity", min = 0, max = 0 } }
plasma_pipe.pictures = color_sprites(plasma_pipe.pictures, tint)

local plasma_pipe_item = table.deepcopy(data.raw["item"]["pipe"])
plasma_pipe_item.name = "plasma_pipe"
plasma_pipe_item.icons ={
    {
        icon=plasma_pipe_item.icon,
        tint=tint
    }
} 
plasma_pipe_item.icon_size = 64
plasma_pipe_item.place_result = "plasma_pipe"
plasma_pipe_item.subgroup="space-platform"
plasma_pipe_item.order="f[plasma-pipe]"

local plasma_pipe_recipe = table.deepcopy(data.raw["recipe"]["pipe"])
plasma_pipe_recipe.enabled = lihop_debug
plasma_pipe_recipe.name = "plasma_pipe"
plasma_pipe_recipe.category = "electromagnetics"
plasma_pipe_recipe.ingredients={
    {type="item",name="lihop-titan-plate",amount=20},
    {type="item",name="lihop-electronic-circuit",amount=5},
    {type="item",name="pipe",amount=50},
}
plasma_pipe_recipe.results = { { type = "item", name = "plasma_pipe", amount = 1 } }

data:extend({ plasma_pipe_item, plasma_pipe_recipe, plasma_pipe })

-- local plasma_pipe_ground = table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"])
-- plasma_pipe_ground.minable = { mining_time = 0.1, result = "plasma_pipe-to-ground" }
-- plasma_pipe_ground.name = "plasma_pipe-to-ground"
-- plasma_pipe_ground.fluid_box["filter"] = "fusion-plasma"
-- for _, pipe_connection in pairs(plasma_pipe_ground.fluid_box.pipe_connections) do
--     pipe_connection.connection_category = "fusion-plasma"
-- end
-- plasma_pipe_ground.surface_conditions = { { property = "gravity", min = 0, max = 0 } }
-- plasma_pipe_ground.pictures = color_sprites(plasma_pipe_ground.pictures, tint)
-- plasma_pipe_ground.fluid_box.pipe_covers = color_sprites(plasma_pipe_ground.fluid_box.pipe_covers, tint)
-- plasma_pipe_ground.fluid_box.pipe_connections[2].max_underground_distance = 15

-- local plasma_pipe__ground_item = table.deepcopy(data.raw["item"]["pipe-to-ground"])
-- plasma_pipe__ground_item.name = "plasma_pipe-to-ground"
-- plasma_pipe__ground_item.icon = "__base__/graphics/icons/assembling-machine-1.png"
-- plasma_pipe__ground_item.icon_size = 64
-- plasma_pipe__ground_item.place_result = "plasma_pipe-to-ground"

-- local plasma_pipe_ground_recipe = table.deepcopy(data.raw["recipe"]["pipe-to-ground"])
-- plasma_pipe_ground_recipe.enabled = lihop_debug
-- plasma_pipe_ground_recipe.name = "plasma_pipe-to-ground"
-- plasma_pipe_ground_recipe.category="electromagnetics"
-- plasma_pipe_ground_recipe.results = { { type = "item", name = "plasma_pipe-to-ground", amount = 1 } }

-- data:extend({ plasma_pipe__ground_item, plasma_pipe_ground_recipe, plasma_pipe_ground })

local plasma_silo = table.deepcopy(data.raw["storage-tank"]["storage-tank"])
plasma_silo.minable = { mining_time = 0.1, result = "plasma_silo" }
plasma_silo.name = "plasma_silo"
local x = 2.5
local y = 2.5
plasma_silo.selection_box = {{-x,-y},{x,y}}
plasma_silo.collision_box = {{-x + 0.25, -y + 0.25},{x - 0.25, y - 0.25}}
plasma_silo.fluid_box.volume = 50000
plasma_silo.fluid_box.filter="fusion-plasma"
plasma_silo.fluid_box.pipe_connections =
{
    { direction = defines.direction.north, position = { -1, -2 }, connection_category = "fusion-plasma" },
    { direction = defines.direction.north, position = { 1, -2 }, connection_category = "fusion-plasma" },
    { direction = defines.direction.east,  position = { 2, -1 }, connection_category = "fusion-plasma" },
    { direction = defines.direction.east,  position = { 2, 1 }, connection_category = "fusion-plasma" },
    { direction = defines.direction.south, position = { -1, 2 }, connection_category = "fusion-plasma" },
    { direction = defines.direction.south, position = { 1, 2 }, connection_category = "fusion-plasma" },
    { direction = defines.direction.west,  position = { -2, -1 }, connection_category = "fusion-plasma" },
    { direction = defines.direction.west,  position = { -2, 1 }, connection_category = "fusion-plasma" },
}
local shift={0,0}
plasma_silo.surface_conditions = { { property = "gravity", min = 0, max = 0 } }
plasma_silo.window_bounding_box = { { -0.4, 1.23 }, { 0.2, 1.87 } }
plasma_silo.pictures = {
    picture = {
        sheets = {
            {
                filename = "__SpaceContinuum__/graphics/entity/tank/plasma-tank.png",
                frames = 1,
                scale = 0.5,
                width = 512,
                height = 384,
            },
            {
                filename = "__SpaceContinuum__/graphics/entity/tank/plasma-tank-shadow.png",
                frames = 1,
                scale = 0.5,
                width = 512,
                height = 384,
                draw_as_shadow = true,
            }
        }
    },

    fluid_background = {
        filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
        priority = "extra-high",
        width = 32,
        height = 15,
        shift=shift,
    },
    window_background = {
        filename = "__base__/graphics/entity/storage-tank/window-background.png",
        priority = "extra-high",
        width = 17,
        height = 24,
         shift=shift,
    },
    flow_sprite = {
        filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
        priority = "extra-high",
        width = 160,
        height = 20,
         shift=shift,
    },
    gas_flow = {
        filename = "__base__/graphics/entity/pipe/steam.png",
        priority = "extra-high",
        line_length = 10,
        width = 24,
        height = 15,
        frame_count = 60,
        axially_symmetrical = false,
        direction_count = 1,
        animation_speed = 0.25,
        shift=shift,
    },
}

local plasma_silo_item = table.deepcopy(data.raw["item"]["storage-tank"])
plasma_silo_item.name = "plasma_silo"
plasma_silo_item.icon = "__SpaceContinuum__/graphics/entity/tank/plasma-tank-icon.png"
plasma_silo_item.icon_size = 64
plasma_silo_item.place_result = "plasma_silo"
plasma_silo_item.subgroup="space-platform"
plasma_silo_item.order="f[plasma-silo]"

local plasma_silo_recipe = table.deepcopy(data.raw["recipe"]["storage-tank"])
plasma_silo_recipe.enabled = lihop_debug
plasma_silo_recipe.name = "plasma_silo"
plasma_silo_recipe.category = "electromagnetics"
plasma_silo_recipe.ingredients={
    {type="item",name="lihop-titan-plate",amount=100},
    {type="item",name="lihop-electronic-circuit",amount=100},
    {type="item",name="storage-tank",amount=5},
}
plasma_silo_recipe.results = { { type = "item", name = "plasma_silo", amount = 1 } }

data:extend({ plasma_silo_item, plasma_silo_recipe, plasma_silo })
