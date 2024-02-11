local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local camera = game.Workspace.CurrentCamera

-- Function to find the nearest player
local function getNearestPlayer()
    local nearestPlayer
    local shortestDistance = math.huge
    
    for _, otherPlayer in ipairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (character.HumanoidRootPart.Position - otherPlayer.Character.HumanoidRootPart.Position).magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                nearestPlayer = otherPlayer
            end
        end
    end
    
    return nearestPlayer
end

-- Function to aim at the nearest player
local function aimAtNearestPlayer()
    local nearestPlayer = getNearestPlayer()
    if nearestPlayer and nearestPlayer.Character then
        local targetPosition = nearestPlayer.Character.HumanoidRootPart.Position
        camera.CFrame = CFrame.lookAt(camera.CFrame.Position, targetPosition)
    end
end

-- Continuously aim at the nearest player
RunService.RenderStepped:Connect(aimAtNearestPlayer)
