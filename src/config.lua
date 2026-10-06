--[[
    CONFIG.LUA
    
    Configuration system for Punchy Alt Control
    Loads and validates user settings, manages defaults
]]

local Config = {}

-- Default settings
local DEFAULT_SETTINGS = {
    prefix = "/",
    mainAccount = "",
    fpslimit = 30,
    altAccounts = {},
    authorizedUsers = {},
    
    -- Movement defaults
    orbitSpeed = 5,
    orbitRadius = 15,
    spiralSpeed = 3,
    spiralRadius = 20,
    helicopterSpeed = 4,
    helicopterRadius = 10,
    
    -- Chat defaults
    spamSpeed = 1.0,
    
    -- Anti-AFK defaults
    antiAfkEnabled = true,
    antiAfkInterval = 300,  -- seconds
};

-- Load settings from getgenv
function Config:Load()
    local userSettings = getgenv().Settings or {}
    
    -- Merge user settings with defaults
    local finalSettings = {}
    
    for key, value in pairs(DEFAULT_SETTINGS) do
        finalSettings[key] = userSettings[key] ~= nil and userSettings[key] or value
    end
    
    return finalSettings
end

-- Validate settings
function Config:Validate(settings)
    local errors = {}
    
    -- Check main account
    if not settings.mainAccount or settings.mainAccount == "" then
        table.insert(errors, "mainAccount must be set in config")
    end
    
    -- Check prefix
    if not settings.prefix or settings.prefix == "" then
        table.insert(errors, "prefix must be set in config")
    end
    
    -- Check FPS limit
    if settings.fpslimit < 10 then
        settings.fpslimit = 10
        warn("FPS limit too low, set to minimum 10")
    end
    
    -- Check alt accounts
    if type(settings.altAccounts) ~= "table" then
        table.insert(errors, "altAccounts must be a table")
    end
    
    return errors
end

-- Get current player
function Config:GetCurrentPlayer()
    return game.Players.LocalPlayer
end

-- Check if current player is main account
function Config:IsMainAccount(settings)
    local player = self:GetCurrentPlayer()
    return player and player.Name == settings.mainAccount
end

-- Check if current player is alt account
function Config:IsAltAccount(settings)
    local player = self:GetCurrentPlayer()
    return player and settings.altAccounts[player.Name] == true
end

-- Check if player is authorized
function Config:IsAuthorized(settings, playerName)
    return playerName == settings.mainAccount or settings.authorizedUsers[playerName] == true
end

-- Add authorized user
function Config:AddAuthorizedUser(settings, playerName)
    settings.authorizedUsers[playerName] = true
end

-- Remove authorized user
function Config:RemoveAuthorizedUser(settings, playerName)
    settings.authorizedUsers[playerName] = nil
end

-- Get list of all alts
function Config:GetAllAlts(settings)
    local alts = {}
    for altName, enabled in pairs(settings.altAccounts) do
        if enabled then
            table.insert(alts, altName)
        end
    end
    return alts
end

-- Get number of connected alts
function Config:GetConnectedAltCount(settings)
    local Players = game:GetService("Players")
    local count = 0
    
    for _, player in pairs(Players:GetPlayers()) do
        if settings.altAccounts[player.Name] == true then
            count = count + 1
        end
    end
    
    return count
end

-- Print config info
function Config:PrintInfo(settings)
    print("\n=== PUNCHY ALT CONTROL - CONFIG ===")
    print("Main Account: " .. settings.mainAccount)
    print("Command Prefix: " .. settings.prefix)
    print("FPS Limit: " .. settings.fpslimit)
    print("Alt Accounts: " .. #self:GetAllAlts(settings))
    print("Authorized Users: " .. CountTable(settings.authorizedUsers))
    print("===================================\n")
end

-- Helper function to count table entries
function CountTable(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

return Config
