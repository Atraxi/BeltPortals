-- Composite Entity Manager
local CompositeEntityManager = {}

-- Initialize a new composite entity, storing its parts
function CompositeEntityManager.create_composite_entity(main_entity, sub_entities)
  local composite_id = main_entity.unit_number
  storage.composite_entities = storage.composite_entities or {}
  storage.composite_entities[composite_id] = { main = main_entity, parts = sub_entities }
end

-- Destroy a composite entity and all its parts
function CompositeEntityManager.destroy_composite_entity(composite_id)
  local composite = storage.composite_entities and storage.composite_entities[composite_id]
  if not composite then return end

  -- Destroy sub-entities
  for _, entity in pairs(composite.parts) do
    if entity.valid then entity.destroy() end
  end

  -- Optionally destroy the main entity
  if composite.main.valid then composite.main.destroy() end

  -- Remove from global storage
  storage.composite_entities[composite_id] = nil
end

-- Verify a composite entity is still correctly set up
function CompositeEntityManager.verify_composite_entity(composite_id)
  local composite = storage.composite_entities and storage.composite_entities[composite_id]
  if not composite then return false end

  if not composite.main.valid then return false end

  for _, entity in pairs(composite.parts) do
    if not entity.valid then return false end
  end

  return true
end

-- Utility to clean up invalid composites (run periodically if needed)
-- function CompositeEntityManager.clean_invalid_composites()
--   if not global.composite_entities then return end

--   for composite_id, _ in pairs(global.composite_entities) do
--     if not CompositeEntityManager.verify_composite_entity(composite_id) then
--       CompositeEntityManager.destroy_composite_entity(composite_id)
--     end
--   end
-- end

return CompositeEntityManager
