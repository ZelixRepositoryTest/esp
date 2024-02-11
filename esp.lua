local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local camera = game.Workspace.CurrentCamera

local aimRadius = 50 -- Sesuaikan radius aim sesuai dengan kebutuhan

-- Fungsi untuk mendeteksi target dalam radius
function findTarget()
    local closest = nil
    local shortestDistance = aimRadius
    for _, target in pairs(game.Workspace:GetChildren()) do
        if target:IsA("Model") and target ~= player.Character then -- Pastikan untuk menyesuaikan kondisi ini dengan target yang kamu inginkan
            local distance = (target.Position - camera.CFrame.p).magnitude
            if distance < shortestDistance then
                closest = target
                shortestDistance = distance
            end
        end
    end
    return closest
end

-- Event untuk auto-aim
mouse.Move:Connect(function()
    local target = findTarget()
    if target then
        -- Logika untuk mengarahkan senjata atau kamera ke target
        -- Ini bisa berupa pengaturan CFrame kamera atau objek lainnya
    end
end)
