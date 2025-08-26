local Shared = require("shared")

-- script.on_event(defines.events.on_script_trigger_effect, function(event)
--   if event.effect_id ~= mod_name_prefix .. "fuel-processor" then return end
--   local reg_id = script.register_for_deconstruction(event.source_entity) -- use this as a key to store everything in global
--   -- spawn in things here, do whatever you want
-- end)

-- script.on_event(defines.events.on_entity_destroyed, function(event)
--   local reg_id = event.registration_number -- here's that same reg_id from earlier
--   -- destroy the other related entities here, and clean up your global table
-- end)

for _, event in ipairs({
  defines.events.on_built_entity,
  defines.events.on_robot_built_entity,
  defines.events.on_space_platform_built_entity,
  defines.events.script_raised_built,
  defines.events.script_raised_revive,
  defines.events.on_entity_cloned,
}) do
  script.on_event(event, on_created_entity, {
    {filter = "name", name = Shared.base_portal_entity},
  })
end

function on_created_entity(event)

end