-------------------------------------------------------------------------------
--[[recipes]]--
local recipe1=nil
-------------------------------------------------------------------------------
--[[items]]--
local item1=
{
  type = "fluid",
  name = "tar",
  icon = "__pycoalprocessing__/graphics/icons/tar.png",
  default_temperature = 15,
  heat_capacity = "1KJ",
  base_color = {r = 0.066, g = 0.164, b = 0.121},
  flow_color = {r = 0.066, g = 0.164, b = 0.121},
  max_temperature = 100,
  pressure_to_speed_ratio = 0.4,
  flow_to_energy_ratio = 0.59,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1=nil
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end