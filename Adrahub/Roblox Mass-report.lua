--[[
                 THIS IS ONLY TESTED ON XENO!
            THIS MAY NOT WORK ON ANY OTHER EXECUTORS
]]--
repeat
    task.wait()
until game:IsLoaded()

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Mass-Reporter",
        Text = "Made by anticroom!",
        Duration = 6
    })
end)


print("Mass-Reporter loaded successfully")

local function reportPlayer(player)
    if player and player ~= localPlayer then
        local success, errorMessage = pcall(function()
            players:ReportAbuse(player, "Bullying", "Test report reason")
        end)
        if success then
            print("[Mass-Report] Reported:", player.Name)
        else
            warn("[Mass-Report] Failed to report:", player.Name, errorMessage)
        end
    end
end

while true do
    for _, player in ipairs(players:GetPlayers()) do
        reportPlayer(player)
    end
    task.wait(0.5) -- Adjust for report speed
end
