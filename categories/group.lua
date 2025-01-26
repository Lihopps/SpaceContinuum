data:extend({
    {
        name = "planet_size",
        type = "noise-expression",
        expression = "-1"
    },
    {
        type = "surface-property",
        name = "size_surface",
        default_value = 90
    },
    {
        type = "surface-property",
        name = "dyson_sphere_site",
        default_value = 0
    },
    {
        type = "item-group",
        name = "planets",
        order = "da",
        icon = "__SpaceContinuum__/graphics/icons/galaxy.png",
        icon_size = 128,
    },
    {
        type = "item-subgroup",
        name = "lihop-system-Calidus",
        group = "planets",
        order = "0",
    },
    {
        type = "item-subgroup",
        name = "sc-item",
        group = "intermediate-products",
        order = "pq",
    },
    {
        type = "recipe-category",
        name = "lihop-harvesting"
    },
    {
        type = "item-subgroup",
        name = "fill-superbarrel",
        group = "intermediate-products",
        order = "ea",
    },
    -- {
    --     type = "item-subgroup",
    --     name = "sc-fill-superbarrel",
    --     group = "intermediate-products",
    --     order = "pq",
    -- },
    {
        type = "item-subgroup",
        name = "empty-superbarrel",
        group = "intermediate-products",
        order = "fa",
    },
})
