local HttpService = game:GetService("HttpService")

local success, response = pcall(function()
    return game:HttpGet("https://YOUR-USERNAME.github.io/YOUR-REPO/games.json")
end)

if not success then
    warn("Failed to fetch game list")
    return
end

local games = HttpService:JSONDecode(response)

local gameId = tostring(game.PlaceId)
local scriptInfo = games[gameId]

if not scriptInfo then
    warn("No script for this game")
    return
end

if scriptInfo.type == "link" then
    loadstring(game:HttpGet(scriptInfo.content))()
elseif scriptInfo.type == "paste" then
    loadstring(scriptInfo.content)()
end
