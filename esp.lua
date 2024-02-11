-- Script to highlight all players in the game

local players = game:GetService("Players")

-- Function to add highlight effect to a player's character
local function highlightPlayer(player)
    player.CharacterAdded:Connect(function(character)
        local highlight = Instance.new("Highlight")
        highlight.Adornee = character
        highlight.FillColor = Color3.new(1, 0, 0) -- Red color
        highlight.FillTransparency = 0.5 -- Semi-transparent
        highlight.OutlineColor = Color3.new(0, 1, 0) -- Green color
        highlight.Parent = character
    end)
end

-- Connect the highlightPlayer function to the PlayerAdded event
players.PlayerAdded:Connect(highlightPlayer)
