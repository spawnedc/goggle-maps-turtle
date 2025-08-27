setfenv(1, GoggleMaps)

local hotspotOverrides = {
  -- Scarlet Enclave
  [2024] = "36^15^33^72^SCARLETENCLAVE"
}

for mapId, hotspots in pairs(hotspotOverrides) do
  -- TODO: Ability to override
  GoggleMaps.Map.Hotspots[mapId] = hotspots
end
