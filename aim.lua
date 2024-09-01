local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")

local CurrentCamera = Workspace.CurrentCamera
local Playersaimbot = nil
local mouse = LocalPlayer:GetMouse()

-- Xóa bỏ GUI trước đó nếu có
if CoreGui:FindFirstChild("infoplayers") then
    CoreGui.infoplayers:Destroy()
end

-- Tạo GUI
local infoplayers = Instance.new("ScreenGui")
infoplayers.Name = "infoplayers"
infoplayers.Parent = CoreGui
infoplayers.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Parent = infoplayers
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.BackgroundTransparency = 0.7
Main.Position = UDim2.new(0.5, -131.5, 0, 10)  -- Centered horizontally, near the top
Main.Size = UDim2.new(0, 263, 0, 80)

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = Main

local MainBorder = Instance.new("UIStroke")
MainBorder.Color = Color3.fromRGB(255, 255, 255)
MainBorder.Thickness = 2
MainBorder.Parent = Main

local Profile = Instance.new("Frame")
Profile.Name = "Profile"
Profile.Parent = Main
Profile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Profile.BackgroundTransparency = 0.5
Profile.Position = UDim2.new(0, 0, 0, 0)
Profile.Size = UDim2.new(1, 0, 1, 0)

local ProfileCorner = Instance.new("UICorner")
ProfileCorner.CornerRadius = UDim.new(0, 10)
ProfileCorner.Parent = Profile

local HealthPlayers = Instance.new("TextLabel")
HealthPlayers.Name = "HealthPlayers"
HealthPlayers.Parent = Profile
HealthPlayers.BackgroundTransparency = 1.0
HealthPlayers.Position = UDim2.new(0.1, 0, 0.3, 0)
HealthPlayers.Size = UDim2.new(0, 200, 0, 22)
HealthPlayers.Font = Enum.Font.FredokaOne
HealthPlayers.Text = "Health: N/A"
HealthPlayers.TextColor3 = Color3.fromRGB(255, 255, 255)
HealthPlayers.TextSize = 19.0
HealthPlayers.TextXAlignment = Enum.TextXAlignment.Left

local LockPlayersLabel = Instance.new("TextLabel")
LockPlayersLabel.Name = "LockPlayersLabel"
LockPlayersLabel.Parent = Profile
LockPlayersLabel.BackgroundTransparency = 1.0
LockPlayersLabel.Position = UDim2.new(0.1, 0, 0.6, 0)
LockPlayersLabel.Size = UDim2.new(0, 200, 0, 22)
LockPlayersLabel.Font = Enum.Font.FredokaOne
LockPlayersLabel.Text = "Lock Players: OFF"
LockPlayersLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
LockPlayersLabel.TextSize = 19.0
LockPlayersLabel.TextXAlignment = Enum.TextXAlignment.Left

local NamePlayers = Instance.new("TextLabel")
NamePlayers.Name = "NamePlayers"
NamePlayers.Parent = Profile
NamePlayers.BackgroundTransparency = 1.0
NamePlayers.Position = UDim2.new(0.1, 0, 0.1, 0)
NamePlayers.Size = UDim2.new(0, 200, 0, 22)
NamePlayers.Font = Enum.Font.FredokaOne
NamePlayers.Text = "Name: N/A"
NamePlayers.TextColor3 = Color3.fromRGB(255, 255, 255)
NamePlayers.TextSize = 19.0
NamePlayers.TextXAlignment = Enum.TextXAlignment.Left

local Healthbar = Instance.new("Frame")
Healthbar.Name = "Healthbar"
Healthbar.Parent = Profile
Healthbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Healthbar.Position = UDim2.new(0.1, 0, 0.8, 0)
Healthbar.Size = UDim2.new(0, 155, 0, 8)

local HealthbarCorner = Instance.new("UICorner")
HealthbarCorner.Parent = Healthbar

local Healthgreen = Instance.new("Frame")
Healthgreen.Name = "Healthgreen"
Healthgreen.Parent = Healthbar
Healthgreen.BackgroundColor3 = Color3.fromRGB(0, 227, 110)
Healthgreen.Size = UDim2.new(0, 155, 0, 8)

local HealthgreenCorner = Instance.new("UICorner")
HealthgreenCorner.Parent = Healthgreen

-- Function to show notification
local function showNotification()
    local notification = Instance.new("TextLabel")
    notification.Name = "Notification"
    notification.Parent = CoreGui
    notification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    notification.BackgroundTransparency = 0.5
    notification.Size = UDim2.new(0.5, 0, 0.1, 0)
    notification.Position = UDim2.new(0.25, 0, 0.45, 0)
    notification.Text = "Aimbot made by Tùng Dương"
    notification.TextColor3 = Color3.fromRGB(0, 0, 0)
    notification.TextSize = 24
    notification.Font = Enum.Font.FredokaOne
    notification.TextStrokeTransparency = 0.5

    -- Animation for notification
    notification:TweenSize(UDim2.new(0.5, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
    wait(3)
    notification:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.5, true)
    wait(0.5)
    notification:Destroy()
end

-- Function to update the aimbot
local function updateAimbot()
    while wait(0.1) do  -- Update every 0.1 seconds
        local closestPlayer = nil
        local closestMagnitude = math.huge
        for _, v in pairs(Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild('HumanoidRootPart') and v.Name ~= LocalPlayer.Name then
                local pos = CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                if (v.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1000 then
                    if magnitude < closestMagnitude then
                        closestMagnitude = magnitude
                        closestPlayer = v
                    end
                end
            end
        end
        if closestPlayer then
            Playersaimbot = closestPlayer.Name
            PlayersPosition = closestPlayer.Character.HumanoidRootPart.Position
            closestPlayer.Character.HumanoidRootPart.Size = Vector3.new(100, 100, 100)
        end
    end
end

-- Function to update UI with player information
local function updatePlayerInfo()
    while wait(0.1) do  -- Update every 0.5 seconds
        if Playersaimbot then
            local player = Players:FindFirstChild(Playersaimbot)
            if player and player.Character then
                NamePlayers.Text = "Name: " .. player.Name
                HealthPlayers.Text = "Health: " .. math.floor(player.Character.Humanoid.Health) .. "/" .. player.Character.Humanoid.MaxHealth
                local hp = player.Character.Humanoid.Health / player.Character.Humanoid.MaxHealth
                pcall(function()
                    Healthgreen:TweenSize(UDim2.new(hp, 0, 0, 8), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15)
                end)
            end
        end
    end
end

-- Function to clear game effects
local function clearGameEffects()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") and obj.Name == "Dash" then
            obj:Destroy()
        end
    end
end

-- Update aimbot
spawn(updateAimbot)

-- Update player info
spawn(updatePlayerInfo)

-- Show notification
spawn(showNotification)

-- Clear game effects
spawn(clearGameEffects)

-- Handle server communication
spawn(function()
    local gg = getrawmetatable(game)
    local old = gg.__namecall
    setreadonly(gg, false)
    gg.__namecall = newcclosure(function(...)
        local method = getnamecallmethod()
        local args = {...}
        if tostring(method) == "FireServer" then
            if tostring(args[1]) == "RemoteEvent" then
                if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
                    if Playersaimbot then
                        args[2] = PlayersPosition
                        return old(unpack(args))
                    end
                end
            end
        end
        return old(...)
    end)
end)

-- Handle mouse click for aimbot
mouse.Button1Down:Connect(function()
    pcall(function()
        if Playersaimbot then
            local args = {
                [1] = PlayersPosition,
                [2] = Players:FindFirstChild(Playersaimbot).Character.HumanoidRootPart
            }
            LocalPlayer.Character[LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteFunctionShoot:InvokeServer(unpack(args))
        end
    end)
end)
