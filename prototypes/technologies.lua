 data:extend {
    {
      type = "technology",
      name = "lihop-dyson-sphere-realisation",
      icon = "__SpaceContinuum__/graphics/technology/lihop-dyson-sphere-realisation.png",
      icon_size = 256,
      essential = true,
      effects = {
        -- {
        --   type="nothing",
        --   effect_description={"technology-description.dyson"},
        --   icon = "__SpaceContinuum__/graphics/technology/lihop-dyson-sphere-realisation.png",
        --   icon_size = 256,
        -- }, 
        {
        type = "unlock-space-location",
        space_location = "lihop-wormhole",
        use_icon_overlay_constant = true
        }
      },
      prerequisites = { "lihop-dyson-scaffold" },
      research_trigger={
          type="craft-item",
          count=(lihop_debug and 10) or 10000,
          item={name="lihop-dyson-scaffold-result"}
        }
    },
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------  Progress tree --------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
  {
      type = "technology",
      name = "lihop-rocket-silo",
      icon = "__SpaceContinuum__/graphics/technology/lihop-rocket-silo.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
        type = "unlock-recipe",
        recipe = "wc-rocket-silo"
        },
        {
        type = "unlock-recipe",
        recipe = "lihop-rocket"
        },
         {
        type = "unlock-recipe",
        recipe = "wc-cargo-landing-pad"
        },
        {
        type = "unlock-recipe",
        recipe = "lihop-satellite"
        },
      },
      prerequisites = { "space-platform-thruster" },
      unit =
      {
        count = 1000,
        ingredients =
        {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   1 },
          { "space-science-pack",      1 }
        },
        time = 60
      }
    },
    {
      type = "technology",
      name = "lihop-titan-ore",
      icon = "__SpaceContinuum__/graphics/technology/lihop-titan-ore.png",
      icon_size = 256,
      essential = true,
      effects = {
         {
        type = "unlock-recipe",
        recipe = "lihop-chemical-catalyst"
        },
        {
        type = "unlock-recipe",
        recipe = "lihop-titan-catalyseur"
        },
        {
        type = "unlock-recipe",
        recipe = "lihop-titan-plate"
        },
      },
      prerequisites = { "lihop-rocket-silo" },
      unit =
      {
        count = 1000,
        ingredients =
        {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   1 },
          { "space-science-pack",      1 }
        },
        time = 60
      }
    },
    {
      type = "technology",
      name = "lihop-harvester-l",
      icon = "__SpaceContinuum__/graphics/technology/lihop-harvester-l.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
        type = "unlock-recipe",
        recipe = "lihop-harvester"
        },
      },
      prerequisites = { "lihop-titan-ore","lihop-titan-util" },
      unit =
      {
        count = 1000,
        ingredients =
        {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   1 },
          { "space-science-pack",      1 }
        },
        time = 60
      }
    },
      {
      type = "technology",
      name = "lihop-superbarrel",
      icon = "__SpaceContinuum__/graphics/technology/lihop-superbarrel.png",
      icon_size = 256,
      essential = true,
      effects = {},
      prerequisites = { "lihop-harvester-l" },
      unit =
      {
        count = 1000,
        ingredients =
        {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   1 },
          { "space-science-pack",      1 }
        },
        time = 60
      }
    },
     {
      type = "technology",
      name = "lihop-titan-util",
      icon = "__SpaceContinuum__/graphics/technology/lihop-titan-util.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
        type = "unlock-recipe",
        recipe = "lihop-titan-rod"
        },
        {
        type = "unlock-recipe",
        recipe = "lihop-titan-mesh"
        },
      },
      prerequisites = { "lihop-rocket-silo","lihop-titan-ore" },
      unit =
      {
        count = 1000,
        ingredients =
        {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   1 },
          { "space-science-pack",      1 }
        },
        time = 60
      }
    },
     {
      type = "technology",
      name = "lihop-titan-pipe",
      icons = util.technology_icon_constant_planet("__space-age__/graphics/technology/vulcanus.png"),
      icon_size = 256,
      essential = true,
      effects = {
        {
        type = "unlock-recipe",
        recipe = "plasma_silo"
        },
        {
        type = "unlock-recipe",
        recipe = "plasma_pipe"
        },
        -- {
        -- type = "unlock-recipe",
        -- recipe = "plasma_pipe-to-ground"
        -- },
      },
      prerequisites = { "lihop-rocket-silo","lihop-titan-ore" },
      unit =
      {
        count = 1000,
        ingredients =
        {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   1 },
          { "space-science-pack",      1 }
        },
        time = 60
      }
    },
    {
      type = "technology",
      name = "lihop-harvester-h",
      icon = "__SpaceContinuum__/graphics/technology/lihop-harvester-h.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
        type = "unlock-recipe",
        recipe = "lihop-harvesting-fusion-plasma"
        },
        {
        type = "unlock-recipe",
        recipe = "lihop-plasma-thruster"
        },

      },
      prerequisites = { "lihop-harvester-l","lihop-titan-pipe" },
      unit =
      {
        count = 1000,
        ingredients =
        {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   1 },
          { "space-science-pack",      1 }
        },
        time = 60
      }
    },
    {
      type = "technology",
      name = "lihop-dyson-scaffold",
      icon = "__SpaceContinuum__/graphics/technology/lihop-dyson-scaffold.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
        type = "unlock-recipe",
        recipe = "lihop-dyson-scaffold"
        },
      },
      prerequisites = { "lihop-titan-util" },
      unit =
      {
        count = 1000,
        ingredients =
        {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   1 },
          { "space-science-pack",      1 }
        },
        time = 60
      }
    },
  }