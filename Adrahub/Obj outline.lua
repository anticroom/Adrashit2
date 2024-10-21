local Players = game:GetService("Players")

-- Function to create a notification
local function createNotification()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Script Loaded! Enjoy!",
        Text = "Made by “@Anticroom.” on Discord!", 
        Button1 = "Okay sexy",
        Button2 = "Nuh uh",
        Duration = 5
    })
end

local function createSelectionBox(part)
    local selectionBox = Instance.new("SelectionBox")
    selectionBox.Adornee = part
    selectionBox.LineThickness = 0.05
    selectionBox.SurfaceTransparency = 1
    selectionBox.Color3 = Color3.new(1, 1, 1)
    selectionBox.Name = "ThickOutline"
    selectionBox.Parent = part
end

local function applyHighlightToPart(part)
    if part:IsA("BasePart") and not part:FindFirstChild("ThickOutline") then
        local player = Players:GetPlayerFromCharacter(part.Parent)

        if not player or (player and not part:IsDescendantOf(player.Character)) then
            createSelectionBox(part)

            local highlightEffect = Instance.new("Highlight")
            highlightEffect.Adornee = part
            highlightEffect.FillColor = Color3.new(1, 0, 0)
            highlightEffect.OutlineColor = Color3.new(1, 1, 1)
            highlightEffect.Parent = part
        end
    end
end

local function applyRainbowHighlights()
    local Workspace = game:GetService("Workspace")
    for _, part in ipairs(Workspace:GetDescendants()) do
        applyHighlightToPart(part)
    end
end

local function rainbowCycle()
    while true do
        for i = 0, 255 do
            local hue = i / 255
            local color = Color3.fromHSV(hue, 1, 1)

            for _, highlight in ipairs(workspace:GetDescendants()) do
                if highlight:IsA("Highlight") then
                    highlight.FillColor = color
                    highlight.OutlineColor = Color3.new(1, 1, 1)
                end
            end

            for _, selectionBox in ipairs(workspace:GetDescendants()) do
                if selectionBox:IsA("SelectionBox") then
                    selectionBox.Color3 = color
                end
            end

            wait(0.05)
        end
    end
end

local function listenForNewParts()
    local Workspace = game:GetService("Workspace")

    Workspace.DescendantAdded:Connect(function(descendant)
        applyHighlightToPart(descendant)
    end)
end

-- Initialize notification and features
createNotification()
applyRainbowHighlights()
listenForNewParts()
rainbowCycle()
