local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local CurrentCamera = Workspace.CurrentCamera
local Playersaimbot = nil
local mouse = LocalPlayer:GetMouse()

-- Xóa bỏ GUI trước đó nếu có
if CoreGui:FindFirstChild("infoplayers") then
    CoreGui.infoplayers:Destroy()
end

-- Tạo GUI aimbot
local infoplayers = Instance.new("ScreenGui")
infoplayers.Name = "infoplayers"
infoplayers.Parent = CoreGui
infoplayers.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Parent = infoplayers
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.BackgroundTransparency = 0.7 -- Làm mờ menu hơn một chút

-- Điều chỉnh vị trí menu
Main.Position = UDim2.new(0.25, 0, 0, 0) -- Căn chỉnh menu sát mép trên và dịch sang trái một nửa khoảng cách từ giữa đến mép bên trái
Main.Size = UDim2.new(0, 263, 0, 80)
Main.AnchorPoint = Vector2.new(0.5, 0)  -- Căn giữa theo phương đứng

local MainCorner = Instance.new("UICorner")
MainCorner.Parent = Main

local Profile = Instance.new("Frame")
Profile.Name = "Profile"
Profile.Parent = Main
Profile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Profile.BackgroundTransparency = 0.5
Profile.Position = UDim2.new(0.057, 0, 0.149, 0)
Profile.Size = UDim2.new(0, 60, 0, 60)

local ProfileCorner = Instance.new("UICorner")
ProfileCorner.CornerRadius = UDim.new(0, 100)
ProfileCorner.Parent = Profile

local ImageProfile = Instance.new("ImageLabel")
ImageProfile.Name = "ImageProfile"
ImageProfile.Parent = Profile
ImageProfile.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ImageProfile.BackgroundTransparency = 0.7
ImageProfile.Position = UDim2.new(0, 1, 0, 1)
ImageProfile.Size = UDim2.new(0, 58, 0, 58)
ImageProfile.Image = ''

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

-- Hiển thị thông báo chào mừng với hiệu ứng
local function showWelcomeMessage()
    local welcomeMessage = Instance.new("TextLabel")
    welcomeMessage.Name = "WelcomeMessage"
    welcomeMessage.Parent = infoplayers
    welcomeMessage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    welcomeMessage.BackgroundTransparency = 0.8
    welcomeMessage.Position = UDim2.new(0.5, 0, 0.5, 0)
    welcomeMessage.AnchorPoint = Vector2.new(0.5, 0.5)
    welcomeMessage.Size = UDim2.new(0, 0, 0, 0)
    welcomeMessage.Text = "Aimbot made by lại tùng dương"
    welcomeMessage.TextColor3 = Color3.fromRGB(0, 0, 0)
    welcomeMessage.TextSize = 20
    welcomeMessage.Font = Enum.Font.FredokaOne
    welcomeMessage.TextStrokeTransparency = 0.5
    welcomeMessage.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
    welcomeMessage.TextWrapped = true
    welcomeMessage.TextXAlignment = Enum.TextXAlignment.Center
    welcomeMessage.TextYAlignment = Enum.TextYAlignment.Center
    welcomeMessage.ZIndex = 10

    -- Hiệu ứng phóng to
    local tweenInfoShow = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tweenGoalShow = {Size = UDim2.new(0, 300, 0, 50)}
    local tweenShow = TweenService:Create(welcomeMessage, tweenInfoShow, tweenGoalShow)
    tweenShow:Play()

    wait(3)  -- Hiển thị thông báo trong 3 giây

    -- Hiệu ứng thu nhỏ và ẩn
    local tweenInfoHide = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    local tweenGoalHide = {Size = UDim2.new(0, 0, 0, 0)}
    local tweenHide = TweenService:Create(welcomeMessage, tweenInfoHide, tweenGoalHide)
    tweenHide:Play()

    tweenHide.Completed:Connect(function()
        welcomeMessage:Destroy()
    end)
end

-- Function to update the aimbot
local function updateAimbot()
    while wait(0.1) do  -- Update every 0.5 seconds
        for i, v in pairs(Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild('HumanoidRootPart') and v.Name ~= LocalPlayer.Name then
                local pos = CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                if magnitude < (1000 * 6 - 8) / 2 then
                    if (v.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1000 then
                        if not getgenv().setting['LockPlayers'] then
                            Playersaimbot = v.Name
                            PlayersPosition = v.Character.HumanoidRootPart.Position
                            v.Character.HumanoidRootPart.Size = Vector3.new(100, 100, 100)
                        end
                    end
                end
            end
        end
    end
end

-- Function to update UI with player information
local function updatePlayerInfo()
    while wait(0.1) do  -- Update every 0.5 seconds
        if Playersaimbot then
            local player = Players:FindFirstChild(Playersaimbot)
            if player and player.Character then
                NamePlayers.Text = "Name | " .. player.Name
                HealthPlayers.Text = "Health | " .. math.floor(player.Character.Humanoid.Health) .. "/" .. player.Character.Humanoid.MaxHealth
                local hp = player.Character.Humanoid.Health / player.Character.Humanoid.MaxHealth
                pcall(function()
                    Healthgreen:TweenSize(UDim2.new(hp, 0, 0, 8), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15)
                end)
                ImageProfile.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            end
        end
    end
end

-- Hiển thị thông báo chào mừng
showWelcomeMessage()

-- Update aimbot
spawn(updateAimbot)

-- Update player info
spawn(updatePlayerInfo)

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