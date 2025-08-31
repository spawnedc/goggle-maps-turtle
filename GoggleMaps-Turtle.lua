local defaultTextureBase = "Interface\\WorldMap"
local textureBase = "Interface\\AddOns\\GoggleMaps-Turtle\\" .. defaultTextureBase
local TURTLE_PREFIX = "TURTLE"
local PREFIX_LENGTH = string.len(TURTLE_PREFIX)
local TEXTURE_START_INDEX = PREFIX_LENGTH + 1

local originalGetFullTexturePath = GoggleMaps.Overlay.GetFullTexturePath

GoggleMaps.Overlay.GetFullTexturePath = function(textureFolder, textureName, textureIndex)
  if string.sub(textureName, 1, PREFIX_LENGTH) == TURTLE_PREFIX then -- Turtle WoW extra areas
    textureName = string.sub(textureName, TEXTURE_START_INDEX)
    local partialTexturePath = textureFolder .. "\\" .. textureName .. textureIndex
    return textureBase .. "\\" .. partialTexturePath
  end

  return originalGetFullTexturePath(textureFolder, textureName, textureIndex)
end

-- Disable Atlas compat. Turtle provides own maps and zones
function GoggleMaps.compat.atlas:Init() end

function GoggleMaps.compat.atlas:Start() end
