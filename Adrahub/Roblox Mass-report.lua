repeat
    task.wait()
until game:IsLoaded()

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

game.StarterGui:SetCore("SendNotification", {
    Title = "Mass-Reporter",
    Text = "Made by anticroom!",
    Button1 = "Dismiss",
    Icon = "rbxassetid://5430597569",
    Duration = 6
})

task.wait(0.5)

game.StarterGui:SetCore("SendNotification", {
    Title = "Discord.gg/flicker",
    Button1 = "I don't wanna",
    Duration = 5
})

local function reportPlayer(player)
    if player and player ~= localPlayer then
        local success, errorMessage = pcall(function()
            players:ReportAbuse(player, "Bullying", "He bypassed chat filter and said cuss word") -- Report type and note
        end)
        if success then
            print("[Mass-Report] Reported " .. player.Name .. " for Bullying.")
        else
            warn("[Mass-Report] Failed to report " .. player.Name .. ": " .. errorMessage)
        end
    end
end

while true do
    for _, player in ipairs(players:GetPlayers()) do
        reportPlayer(player)
    end
    task.wait(0.1) -- Adjust for report speed
end
