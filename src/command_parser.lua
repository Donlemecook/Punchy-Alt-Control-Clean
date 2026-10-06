--[[
    COMMAND_PARSER.LUA
    
    Parses user input, validates commands, and routes to handlers
    Manages command history and auto-complete
]]

local CommandParser = {}
CommandParser.commands = {}
CommandParser.aliases = {}

-- Register a command
function CommandParser:Register(name, handler, description, aliases)
    self.commands[name] = {
        handler = handler,
        description = description or "No description",
        name = name
    }
    
    -- Register aliases
    if aliases then
        for _, alias in pairs(aliases) do
            self.aliases[alias] = name
        end
    end
end

-- Parse user input
function CommandParser:Parse(input, prefix)
    -- Check if starts with prefix
    if not input:sub(1, #prefix) == prefix then
        return nil
    end
    
    -- Remove prefix
    local commandString = input:sub(#prefix + 1):match("^%s*(.*)")
    
    -- Split into command and args
    local parts = {}
    for word in commandString:gmatch("%S+") do
        table.insert(parts, word)
    end
    
    if #parts == 0 then
        return nil
    end
    
    local commandName = parts[1]
    local args = {}
    for i = 2, #parts do
        table.insert(args, parts[i])
    end
    
    return {
        name = commandName,
        args = args,
        raw = commandString
    }
end

-- Execute a parsed command
function CommandParser:Execute(parsed, settings, context)
    if not parsed then
        return false, "Invalid command"
    end
    
    local commandName = parsed.name
    
    -- Check if command or alias exists
    local actualCommand = self.commands[commandName] or self.commands[self.aliases[commandName]]
    
    if not actualCommand then
        return false, "Unknown command: " .. commandName
    end
    
    -- Check authorization
    local player = game.Players.LocalPlayer
    if not Config:IsAuthorized(settings, player.Name) then
        return false, "You are not authorized to use commands"
    end
    
    -- Execute command
    local success, result = pcall(function()
        return actualCommand.handler(parsed.args, settings, context)
    end)
    
    if not success then
        return false, "Command error: " .. tostring(result)
    end
    
    return true, result
end

-- Get command info
function CommandParser:GetInfo(commandName)
    local cmd = self.commands[commandName] or self.commands[self.aliases[commandName]]
    
    if not cmd then
        return nil
    end
    
    return cmd
end

-- List all commands
function CommandParser:ListAll()
    local commandList = {}
    
    for name, cmd in pairs(self.commands) do
        table.insert(commandList, {
            name = name,
            description = cmd.description
        })
    end
    
    -- Sort alphabetically
    table.sort(commandList, function(a, b)
        return a.name < b.name
    end)
    
    return commandList
end

-- Get command count
function CommandParser:GetCommandCount()
    local count = 0
    for _ in pairs(self.commands) do
        count = count + 1
    end
    return count
end

-- Auto-complete suggestions
function CommandParser:GetSuggestions(partial)
    local suggestions = {}
    local lowerPartial = partial:lower()
    
    for name, cmd in pairs(self.commands) do
        if name:sub(1, #partial):lower() == lowerPartial then
            table.insert(suggestions, name)
        end
    end
    
    table.sort(suggestions)
    return suggestions
end

-- Find player by name (fuzzy match)
function CommandParser:FindPlayer(name)
    local Players = game:GetService("Players")
    
    -- Exact match first
    for _, player in pairs(Players:GetPlayers()) do
        if player.Name == name then
            return player
        end
    end
    
    -- Case-insensitive match
    local lowerName = name:lower()
    for _, player in pairs(Players:GetPlayers()) do
        if player.Name:lower() == lowerName then
            return player
        end
    end
    
    -- Partial match
    for _, player in pairs(Players:GetPlayers()) do
        if player.Name:lower():find(lowerName, 1, true) then
            return player
        end
    end
    
    return nil
end

return CommandParser
