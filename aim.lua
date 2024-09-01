local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

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
Main.BackgroundTransparency = 0.7 -- Làm mờ menu hơn một chút

-- Điều chỉnh vị trí của menu tùy thuộc vào kiểu thiết bị và độ rộng màn hình
local function getPositionForScreen()
    if UserInputService.TouchEnabled then
        -- Đối với thiết bị cảm ứng (điện thoại), đặt menu gần trên cùng và căn chỉnh sang bên trái một chút
        return UDim2.new(0.5, -130, 0.05, 0)  -- Điều chỉnh giá trị 0.5 và -130 để căn chỉnh menu theo ý muốn
    else
        -- Đối với các màn hình khác
        return UDim2.new(0.01, 0, 0.3, 0)
    end
end

Main.Position = getPositionForScreen()
Main.Size = UDim2.new(0, 263, 0, 80)

local MainCorner = Instance.new("UICorner")
MainCorner.Parent = Main

local Profile = Instance.new("Frame")
Profile.Name = "Profile"
Profile.Parent = Main
Profile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Profile.BackgroundTransparency = 0.5 -- Adjust transparency of the background
Profile.Position = UDim2.new(0.057, 0, 0.149, 0)
Profile.Size = UDim2.new(0, 60, 0, 60)

local ProfileCorner = Instance.new("UICorner")
ProfileCorner.CornerRadius = UDim.new(0, 100)
ProfileCorner.Parent = Profile

local ImageProfile = Instance.new("ImageLabel")
ImageProfile.Name = "ImageProfile"
ImageProfile.Parent = Profile
ImageProfile.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ImageProfile.BackgroundTransparency = 0.7 -- Adjust transparency of the background
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

-- Function to update the aimbot
local function updateAimbot()
    while wait(0.5) do  -- Update every 0.5 seconds
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
    while wait(0.5) do  -- Update every 0.5 seconds
        if Playersaimbot then
            local player = Players:FindFirstChild(Playersaimbot)
            if player and player.Character then
                NamePlayers.Text = "Name | " .. player.Name
                HealthPlayers.Text = "Health | " .. math.floor(player.Character.Humanoid.Health) .. "/" .. player.Character.Humanoid.MaxHealth
                local hp = player.Character.Humanoid.Health / player.Character.Humanoid.MaxHealth
                pcall(function()
                    Healthgreen:TweenSize(UDim2.new(hp, 0, 0, 8), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15)
                end)
                ImageProfile.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size370x370)
            end
        end
    end
end

-- Update aimbot
spawn(updateAimbot)

-- Update player info
spawn(updatePlayerInfo)

-- Input handling
UserInputService.InputBegan:Connect(function(io, p)
    if io.KeyCode == getgenv().setting['LockPlayersBind'] then
        if getgenv().setting['LockPlayers'] then
            loackplayerslabel.Text = "Lock Players | OFF"
            getgenv().setting['LockPlayers'] = false
        else
            loackplayerslabel.Text = "Lock Players | ON"
            getgenv().setting['LockPlayers'] = true
        end
    end
    if io.KeyCode == getgenv().setting['resetPlayersBind'] then
        Playersaimbot = nil
        PlayersPosition = nil
        ImageProfile.Image = ''
        NamePlayers.Text = "Name | N/A"
        HealthPlayers.Text = "Health | N/A"
    end
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
            LocalPlayer.Character[LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteFunctionShoot:InvokeServer(unpack(args))
        end
    end)
end)
