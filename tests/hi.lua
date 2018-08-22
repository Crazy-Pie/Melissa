return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.6",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 25,
  height = 18,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 13,
  properties = {},
  tilesets = {
    {
      name = "countryside",
      firstgid = 1,
      filename = "countryside.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "countryside.png",
      imagewidth = 64,
      imageheight = 64,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 4,
      tiles = {
        {
          id = 1,
          objectGroup = {
            type = "objectgroup",
            name = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            draworder = "index",
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "rectangle",
                x = 0,
                y = 0,
                width = 32,
                height = 32,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        },
        {
          id = 3,
          objectGroup = {
            type = "objectgroup",
            name = "",
            visible = true,
            opacity = 1,
            offsetx = 0,
            offsety = 0,
            draworder = "index",
            properties = {},
            objects = {
              {
                id = 1,
                name = "",
                type = "",
                shape = "rectangle",
                x = 0,
                y = 0,
                width = 32,
                height = 32,
                rotation = 0,
                visible = true,
                properties = {}
              }
            }
          }
        }
      }
    },
    {
      name = "player",
      firstgid = 5,
      filename = "player.tsx",
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "purple.png",
      imagewidth = 32,
      imageheight = 32,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 1,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Grass",
      x = 0,
      y = 0,
      width = 25,
      height = 18,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = false,
        ["sensor"] = false
      },
      encoding = "base64",
      compression = "zlib",
      data = "eJyVk1sKwCAQAy17/zu3hQpl2WTih2jrKyaztda6nlZfv8f1+9fnej+tLbOvz033unNIw6RTNfVG5wf54M460ec87fvIV3e28ru/Kc1e6SM/U6ZUFo5V5Y9b73xOxgm7jmligjxzelyuxO2JBtrvfFTfCU9Uyyk30x1pPVBuxEjKX8L8SW1N3KV8OP8oF6o9ypvyUjre/gaWyAOP"
    },
    {
      type = "objectgroup",
      name = "Player Spawn",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {
      },
      objects = {
        {
          id = 4,
          name = "SpawnPoint",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 128,
          width = 32,
          height = 32,
          rotation = 0,
          visible = false,
          properties = {}
        }
      }
    },
    {
      type = "tilelayer",
      name = "Boxes",
      x = 0,
      y = 0,
      width = 25,
      height = 18,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true,
        ["sensor"] = true
      },
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYBgF9AIsVNbLgkWO2nYwQcWZaGgHzB5i1BFrBzIm1S3E2sHEgAgfXGZSK6wG2g70+KGFHZQAJiLY2PILtQG2/EIre0YB9QAAODYAmQ=="
    },
    {
      type = "tilelayer",
      name = "Border",
      x = 0,
      y = 0,
      width = 25,
      height = 18,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true,
        ["sensor"] = false
      },
      encoding = "base64",
      compression = "zlib",
      data = "eJxjYWBgYKIhZoFiWoJRO0btGLVj1I5RO4anHbSsn2AYAEXtAOk="
    }
  }
}
