repeat
    task.wait()
until game:IsLoaded()

local players = game:GetService('Players')
local localPlayer = players.LocalPlayer

local function reportPlayer(player)
    if player and player ~= localPlayer then
        local success, errorMessage = pcall(function()
            players:ReportAbuse(player, "Bullying", "He bypassed chat filter and said cuss word") -- this sets what type of report and report note is being sent
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
    task.wait(0.1)
end
