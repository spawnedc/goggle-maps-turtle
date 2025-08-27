setfenv(1, GoggleMaps)
local defaultTextureBase = "Interface\\WorldMap"
local textureBase = "Interface\\AddOns\\GoggleMaps-Turtle\\" .. defaultTextureBase
local TURTLE_PREFIX = "TURTLE"
local PREFIX_LENGTH = string.len(TURTLE_PREFIX)
local TEXTURE_START_INDEX = PREFIX_LENGTH + 1

local overlayOverrides = {
  arathi = {
    TURTLEarathi2 = "256,0,256,256",
    TURTLEarathi3 = "512,0,256,256",
  },
  dunmorogh = {
    TURTLEdunmorogh1 = "0,0,256,256",
    TURTLEdunmorogh2 = "256,0,256,256",
    TURTLEdunmorogh3 = "512,0,256,256",
    TURTLEdunmorogh4 = "768,0,256,256",
    TURTLEdunmorogh5 = "0,256,256,256",
    TURTLEdunmorogh7 = "512,256,256,256",
    TURTLEdunmorogh8 = "768,256,256,256",
  },
  feralas = {
    TURTLEferalas8 = "768,256,256,256",
  },
  scarletenclave = {
    TURTLEscarletenclave2 = "256,0,256,256",
    TURTLEscarletenclave3 = "512,0,256,256",
    TURTLEscarletenclave6 = "256,256,256,256",
    TURTLEscarletenclave7 = "512,256,256,256",
    TURTLEscarletenclave10 = "256,512,256,256",
    TURTLEscarletenclave11 = "512,512,256,256",
  },
  tirisfal = {
    TURTLEtirisfal5 = "0,256,256,256",
    TURTLEtirisfal6 = "256,256,256,256",
    TURTLEtirisfal9 = "0,512,256,256",
    TURTLEtirisfal10 = "256,512,256,256",
  },
  wetlands = {
    TURTLEwetlands5 = "0,256,256,256",
    TURTLEwetlands6 = "256,256,256,256",
  },
}

for textureFolder, overlays in pairs(overlayOverrides) do
  for overlay, overlayData in pairs(overlays) do
    if not GoggleMaps.Map.Overlay[textureFolder] then
      GoggleMaps.Map.Overlay[textureFolder] = {}
    end
    GoggleMaps.Map.Overlay[textureFolder][overlay] = overlayData
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
