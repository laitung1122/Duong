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
Main.BackgroundTransparency = 0.5  -- Làm mờ nền hơn
Main.Position = UDim2.new(0, 70, 0, 10)  -- Di chuyển menu sang phải thêm một chút
Main.Size = UDim2.new(0, 260, 0, 70)  -- Kích thước menu gần giống như ban đầu

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)  -- Bo cong nhẹ
MainCorner.Parent = Main

-- Xóa phần đường kẻ viền
-- local MainBorder = Instance.new("UIStroke")
-- MainBorder.Color = Color3.fromRGB(255, 255, 255)
-- MainBorder.Thickness = 2
-- MainBorder.Parent = Main

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

local ImageProfile = Instance.new("ImageLabel")
ImageProfile.Name = "ImageProfile"
ImageProfile.Parent = Profile
ImageProfile.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ImageProfile.BackgroundTransparency = 0.5
ImageProfile.Position = UDim2.new(0, 10, 0, 10)
ImageProfile.Size = UDim2.new(0, 60, 0, 60)
ImageProfile.Image = ''

local ImageProfileCorner = Instance.new("UICorner")
ImageProfileCorner.CornerRadius = UDim.new(0, 10)
ImageProfileCorner.Parent = ImageProfile

local NamePlayers = Instance.new("TextLabel")
NamePlayers.Name = "NamePlayers"
NamePlayers.Parent = Profile
NamePlayers.BackgroundTransparency = 1.0
NamePlayers.Position = UDim2.new(0.2, 0, 0.1, 0)
NamePlayers.Size = UDim2.new(0, 160, 0, 20)
NamePlayers.Font = Enum.Font.FredokaOne
NamePlayers.Text = "Name: N/A"
NamePlayers.TextColor3 = Color3.fromRGB(255, 255, 255)
NamePlayers.TextSize = 16.0
NamePlayers.TextXAlignment = Enum.TextXAlignment.Left

local HealthPlayers = Instance.new("TextLabel")
HealthPlayers.Name = "HealthPlayers"
HealthPlayers.Parent = Profile
HealthPlayers.BackgroundTransparency = 1.0
HealthPlayers.Position = UDim2.new(0.2, 0, 0.3, 0)
HealthPlayers.Size = UDim2.new(0, 160, 0, 20)
HealthPlayers.Font = Enum.Font.FredokaOne
HealthPlayers.Text = "Health: N/A"
HealthPlayers.TextColor3 = Color3.fromRGB(255, 255, 255)
HealthPlayers.TextSize = 16.0
HealthPlayers.TextXAlignment = Enum.TextXAlignment.Left

local Healthbar = Instance.new("Frame")
Healthbar.Name = "Healthbar"
Healthbar.Parent = Profile
Healthbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Healthbar.Position = UDim2.new(0.2, 0, 0.5, 0)
Healthbar.Size = UDim2.new(0, 160, 0, 8)

local HealthbarCorner = Instance.new("UICorner")
HealthbarCorner.Parent = Healthbar

local Healthgreen = Instance.new("Frame")
Healthgreen.Name = "Healthgreen"
Healthgreen.Parent = Healthbar
Healthgreen.BackgroundColor3 = Color3.fromRGB(0, 227, 110)
Healthgreen.Size = UDim2.new(0, 160, 0, 8)

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
    notification:TweenSize(UDim2.new(0.5, 0, 0.1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.5, true)
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
                if (v.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 500 then  -- Giảm phạm vi xuống còn 500m
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
            NamePlayers.Text = "Name: " .. closestPlayer.Name
            HealthPlayers.Text = "Health: " .. math.floor(closestPlayer.Character.Humanoid.Health) .. "/" .. closestPlayer.Character.Humanoid.MaxHealth
            ImageProfile.Image = Players:GetUserThumbnailAsync(closestPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            local hp = closestPlayer.Character.Humanoid.Health / closestPlayer.Character.Humanoid.MaxHealth
            pcall(function()
                Healthgreen:TweenSize(UDim2.new(hp, 0, 0, 8), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15)
            end)
            -- Kích thước của HumanoidRootPart
            closestPlayer.Character.HumanoidRootPart.Size = Vector3.new(100, 100, 100)
        end
    end
end

-- Update aimbot
spawn(updateAimbot)

-- Show notification
spawn(function()
    showNotification()
end)

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
            LocalPlayer.Character[LocalPlayer.Character:FindFirstChild("Humanoid")].Target = args[2]
        end
    end)
end)
