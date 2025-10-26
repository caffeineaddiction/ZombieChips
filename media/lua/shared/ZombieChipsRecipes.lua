-- Zombie Apoca-Chips Recipe Callbacks
-- Handles special recipe logic like returning the baking tray

-- Return baking tray when packaging cooked chips
function ReturnBakingTray_OnCreate(items, result, player)
    -- Add a baking tray back to the player's inventory
    player:getInventory():AddItem("Base.BakingTray")
end
