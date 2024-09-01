-- Khởi tạo biến aimbot
_G.Aimbot_Skill_Fov = false
_G.Aim_Players = nil

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local CurrentCamera = Workspace.CurrentCamera
local LockedTarget = nil
local SkillActivated = false

-- Tạo GUI
local infoplayers = Instance.new("ScreenGui")
infoplayers.Name = "infoplayers"
infoplayers.Parent = CoreGui
infoplayers.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Parent = infoplayers
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.BackgroundTransparency = 0.8 -- Làm mờ menu hơn
Main.Position = UDim2.new(0.01, 0, 0.3, 0)
Main.Size = UDim2.new(0, 263, 0, 80)

local MainCorner = Instance.new("UICorner")
MainCorner.Parent = Main

local Profile = Instance.new("Frame")
Profile.Name = "Profile"
Profile.Parent = Main
Profile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Profile.Position = UDim2.new(0.057, 0, 0.149, 0)
Profile.Size = UDim2.new(0, 60, 0, 60)

local ProfileCorner = Instance.new("UICorner")
ProfileCorner.CornerRadius = UDim.new(0, 100)
ProfileCorner.Parent = Profile

local ImageProfile = Instance.new("ImageLabel")
ImageProfile.Name = "ImageProfile"
ImageProfile.Parent = Profile
ImageProfile.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ImageProfile.Position = UDim2.new(0, 1, 0, 1)
ImageProfile.Size = UDim2.new(0, 58, 0, 58)

local ImageProfileCorner = Instance.new("UICorner")
ImageProfileCorner.CornerRadius = UDim.new(0, 100)
ImageProfileCorner.Parent = ImageProfile

local HealthPlayers = Instance.new("TextLabel")
HealthPlayers.Name = "HealthPlayers"
HealthPlayers.Parent = Profile
HealthPlayers.BackgroundTransparency = 1.0
HealthPlayers.Position = UDim2.new(1.242, 0, 0.378, 0)
HealthPlayers.Size = UDim2.new(0, 173, 0, 22)
HealthPlayers.Font = Enum.Font.FredokaOne
HealthPlayers.Text = "Health | N/A"
HealthPlayers.TextColor3 = Color3.fromRGB(255, 255, 255)
HealthPlayers.TextSize = 19.0
HealthPlayers.TextXAlignment = Enum.TextXAlignment.Left

local loackplayerslabel = Instance.new("TextLabel")
loackplayerslabel.Name = "loackplayerslabel"
loackplayerslabel.Parent = Profile
loackplayerslabel.BackgroundTransparency = 1.0
loackplayerslabel.Position = UDim2.new(0.1, 0, 1.1, 0)
loackplayerslabel.Size = UDim2.new(0, 173, 0, 22)
loackplayerslabel.Font = Enum.Font.FredokaOne
loackplayerslabel.Text = "Lock Players | OFF"
loackplayerslabel.TextColor3 = Color3.fromRGB(255, 255, 255)
loackplayerslabel.TextSize = 19.0
loackplayerslabel.TextXAlignment = Enum.TextXAlignment.Left

local NamePlayers = Instance.new("TextLabel")
NamePlayers.Name = "NamePlayers"
NamePlayers.Parent = Profile
NamePlayers.BackgroundTransparency = 1.0
NamePlayers.Position = UDim2.new(1.242, 0, 0.011, 0)
NamePlayers.Size = UDim2.new(0, 173, 0, 22)
NamePlayers.Font = Enum.Font.FredokaOne
NamePlayers.Text = "Name | N/A"
NamePlayers.TextColor3 = Color3.fromRGB(255, 255, 255)
NamePlayers.TextSize = 19.0
NamePlayers.TextXAlignment = Enum.TextXAlignment.Left

local Healthbar = Instance.new("Frame")
Healthbar.Name = "Healthbar"
Healthbar.Parent = Profile
Healthbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Healthbar.Position = UDim2.new(1.233, 0, 0.85, 0)
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

-- Cập nhật GUI và khóa mục tiêu
RunService.RenderStepped:Connect(function()
    if _G.Aimbot_Skill_Fov then
        local closestPlayer = findClosestPlayer()
        if closestPlayer then
            LockedTarget = closestPlayer.Name
            local character = closestPlayer.Character
            if character and character:FindFirstChild("Humanoid") then
                NamePlayers.Text = "Name | " .. closestPlayer.Name
                HealthPlayers.Text = "Health | " .. math.floor(character.Humanoid.Health) .. "/" .. character.Humanoid.MaxHealth
                Healthgreen:TweenSize(UDim2.new(character.Humanoid.Health / character.Humanoid.MaxHealth, 0, 0, 8), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15)
                ImageProfile.Image = Players:GetUserThumbnailAsync(closestPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)

                -- Tự động kích hoạt aim skill vào người chơi gần nhất
                activateSkillOnTarget(closestPlayer)
            end
        end
    end
end)

-- Tìm và khóa vào đối tượng gần nhất
local function findClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local distance = (character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPlayer = player
                end
            end
        end
    end

    return closestPlayer
end

-- Kích hoạt aim skill khi khóa mục tiêu
local function activateSkillOnTarget(target)
    if target then
        local humanoidRootPart = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            -- Đây là nơi bạn có thể thêm mã để kích hoạt kỹ năng vào mục tiêu
            -- Ví dụ: Sử dụng lệnh để ngắm và bắn kỹ năng vào mục tiêu
            print("Kích hoạt skill vào: " .. target.Name)
            SkillActivated = true
        end
    end
end

-- Xử lý đầu vào của người dùng để bật/tắt chức năng khóa mục tiêu
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.L then  -- Thay đổi KeyCode theo nhu cầu
        _G.Aimbot_Skill_Fov = not _G.Aimbot_Skill_Fov
        loackplayerslabel.Text = "Lock Players | " .. (_G.Aimbot_Skill_Fov and "ON" or "OFF")
    end
end)

-- Thay đổi hàm __namecall để kích hoạt kỹ năng tự động
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
                    if _G.Aimbot_Skill_Fov and _G.Aim_Players then
                        args[2] = _G.Aim_Players.Character.HumanoidRootPart.Position
                        return old(unpack(args))
                    end
                end
            end
        end
        return old(...)
    end)
end)
