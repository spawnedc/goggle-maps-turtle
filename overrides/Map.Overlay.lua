setfenv(1, GoggleMaps)
local defaultTextureBase = "Interface\\WorldMap"
local textureBase = "Interface\\AddOns\\GoggleMaps-Turtle\\" .. defaultTextureBase
local TURTLE_PREFIX = "TURTLE"
local PREFIX_LENGTH = string.len(TURTLE_PREFIX)
local TEXTURE_START_INDEX = PREFIX_LENGTH + 1

local overlayOverrides = {
  arathi = {
    ruinsofzulrasaz = "256,0,512,256",
  },
  dunmorogh = {
    ironforgeairfields = "512,0,512,512",
    gnomereganreclamationfacility = "0,0,512,512",
    rugfordsmountainrest = "512, 256, 512, 256"
  },
  feralas = {
    feralas8 = "768,256,256,256",
  },
  scarletenclave = {
    scarletenclave2 = "256,0,256,256",
    scarletenclave3 = "512,0,256,256",
    scarletenclave6 = "256,256,256,256",
    scarletenclave7 = "512,256,256,256",
    scarletenclave10 = "256,512,256,256",
    scarletenclave11 = "512,512,256,256",
  },
  tirisfal = {
    tirisfal5 = "0,256,256,256",
    tirisfal6 = "256,256,256,256",
    tirisfal9 = "0,512,256,256",
    tirisfal10 = "256,512,256,256",
  },
  teldrassil = {
    ursanheights = "256,256,256,512",
  },
  wetlands = {
    wetlands5 = "0,256,256,256",
    wetlands6 = "256,256,256,256",
  },
}

for textureFolder, overlays in pairs(overlayOverrides) do
  for overlay, overlayData in pairs(overlays) do
    if not GoggleMaps.Map.Overlay[textureFolder] then
      GoggleMaps.Map.Overlay[textureFolder] = {}
    end
    GoggleMaps.Map.Overlay[textureFolder][TURTLE_PREFIX .. overlay] = overlayData
  end
end



local originalGetFullTexturePath = GoggleMaps.Overlay.GetFullTexturePath

GoggleMaps.Overlay.GetFullTexturePath = function(textureFolder, textureName, textureIndex)
  if string.sub(textureName, 1, PREFIX_LENGTH) == TURTLE_PREFIX then -- Turtle WoW extra areas
    textureName = string.sub(textureName, TEXTURE_START_INDEX)
    local partialTexturePath = textureFolder .. "\\" .. textureName .. textureIndex
    return textureBase .. "\\" .. partialTexturePath
  end

  return originalGetFullTexturePath(textureFolder, textureName, textureIndex)
end
