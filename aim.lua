-- Initialize variables
Playersaimbot = nil
local mouse = game.Players.LocalPlayer:GetMouse()
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local currentCamera = game:GetService("Workspace").CurrentCamera
local infoplayers = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local MainCorner = Instance.new("UICorner")
local Profile = Instance.new("Frame")
local ProfileCorner = Instance.new("UICorner")
local ImageProfile = Instance.new("ImageLabel")
local ImageProfileCorner = Instance.new("UICorner")
local HealthPlayers = Instance.new("TextLabel")
local NamePlayers = Instance.new("TextLabel")
local loackplayerslabel = Instance.new("TextLabel")
local Healthbar = Instance.new("Frame")
local HealthbarCorner = Instance.new("UICorner")
local Healthgreen = Instance.new("Frame")
local HealthgreenCorner = Instance.new("UICorner")

-- Setup UI
if game:GetService("CoreGui"):FindFirstChild('infoplayers') then 
    game:GetService("CoreGui"):FindFirstChild('infoplayers'):Destroy()
end

infoplayers.Name = "infoplayers"
infoplayers.Parent = game:GetService("CoreGui")
infoplayers.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = infoplayers
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.Position = UDim2.new(0.01, 0, 0.3, 0)
Main.Size = UDim2.new(0, 263, 0, 80)

MainCorner.Name = "MainCorner"
MainCorner.Parent = Main

Profile.Name = "Profile"
Profile.Parent = Main
Profile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Profile.Position = UDim2.new(0.0570342205, 0, 0.149425298, 0)
Profile.Size = UDim2.new(0, 60, 0, 60)

ProfileCorner.CornerRadius = UDim.new(0, 100)
ProfileCorner.Name = "ProfileCorner"
ProfileCorner.Parent = Profile

ImageProfile.Name = "ImageProfile"
ImageProfile.Parent = Profile
ImageProfile.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ImageProfile.BackgroundTransparency = 0
ImageProfile.Position = UDim2.new(0, 1, 0, 1)
ImageProfile.Size = UDim2.new(0, 58, 0, 58)
ImageProfile.Image = ''

ImageProfileCorner.CornerRadius = UDim.new(0, 100)
ImageProfileCorner.Name = "ImageProfileCorner"
ImageProfileCorner.Parent = ImageProfile

HealthPlayers.Name = "HealthPlayers"
HealthPlayers.Parent = Profile
HealthPlayers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HealthPlayers.BackgroundTransparency = 1.000
HealthPlayers.Position = UDim2.new(1.24220526, 0, 0.377586216, 0)
HealthPlayers.Size = UDim2.new(0, 173, 0, 22)
HealthPlayers.Font = Enum.Font.FredokaOne
HealthPlayers.Text = "Health | N/A"
HealthPlayers.TextColor3 = Color3.fromRGB(255, 255, 255)
HealthPlayers.TextSize = 19.000
HealthPlayers.TextXAlignment = Enum.TextXAlignment.Left
HealthPlayers.TextYAlignment = Enum.TextYAlignment.Bottom

loackplayerslabel.Name = "loackplayerslabel"
loackplayerslabel.Parent = Profile
loackplayerslabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
loackplayerslabel.BackgroundTransparency = 1.000
loackplayerslabel.Position = UDim2.new(0.1, 0, 1.1, 0)
loackplayerslabel.Size = UDim2.new(0, 173, 0, 22)
loackplayerslabel.Font = Enum.Font.FredokaOne
loackplayerslabel.Text = "Lock Players | OFF"
loackplayerslabel.TextColor3 = Color3.fromRGB(255, 255, 255)
loackplayerslabel.TextSize = 19.000
loackplayerslabel.TextXAlignment = Enum.TextXAlignment.Left
loackplayerslabel.TextYAlignment = Enum.TextYAlignment.Bottom

NamePlayers.Name = "NamePlayers"
NamePlayers.Parent = Profile
NamePlayers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NamePlayers.BackgroundTransparency = 1.000
NamePlayers.Position = UDim2.new(1.24220526, 0, 0.0109195411, 0)
NamePlayers.Size = UDim2.new(0, 173, 0, 22)
NamePlayers.Font = Enum.Font.FredokaOne
NamePlayers.Text = "Name | N/A"
NamePlayers.TextColor3 = Color3.fromRGB(255, 255, 255)
NamePlayers.TextSize = 19.000
NamePlayers.TextXAlignment = Enum.TextXAlignment.Left
NamePlayers.TextYAlignment = Enum.TextYAlignment.Bottom

Healthbar.Name = "Healthbar"
Healthbar.Parent = Profile
Healthbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Healthbar.Position = UDim2.new(1.23333335, 0, 0.850000024, 0)
Healthbar.Size = UDim2.new(0, 155, 0, 8)

HealthbarCorner.Name = "HealthbarCorner"
HealthbarCorner.Parent = Healthbar

Healthgreen.Name = "Healthgreen"
Healthgreen.Parent = Healthbar
Healthgreen.BackgroundColor3 = Color3.fromRGB(0, 227, 110)
Healthgreen.Size = UDim2.new(0, 155, 0, 8)

HealthgreenCorner.Name = "HealthgreenCorner"
HealthgreenCorner.Parent = Healthgreen

-- Function to update the aimbot
local function updateAimbot()
    while wait() do
        for i, v in pairs(players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild('HumanoidRootPart') and v.Name ~= localPlayer.Name then
                local pos = currentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                if magnitude < (1000 * 6 - 8) / 2 then
                    if (v.Character.HumanoidRootPart.Position - localPlayer.Character.HumanoidRootPart.Position).magnitude <= 1000 then
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
    while wait() do
        if Playersaimbot then
            local player = players:FindFirstChild(Playersaimbot)
            if player and player.Character then
                NamePlayers.Text = "Name | " .. player.Name
                HealthPlayers.Text = "Health | " .. math.floor(player.Character.Humanoid.Health) .. "/" .. player.Character.Humanoid.MaxHealth
                local hp = player.Character.Humanoid.Health / player.Character.Humanoid.MaxHealth
                pcall(function()
                    Healthgreen:TweenSize(UDim2.new(hp, 0, 0, 8), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15)
                end)
                ImageProfile.Image = players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            end
        end
    end
end

-- Update aimbot
spawn(updateAimbot)

-- Update player info
spawn(updatePlayerInfo)

-- Input handling
game:GetService("UserInputService").InputBegan:Connect(function(io, p)
    if io.KeyCode == getgenv().setting['LockPlayersBind'] then
        if getgenv().setting['LockPlayers'] then
            loackplayerslabel.Text = "Lock Players | OFF"
            getgenv().setting['LockPlayers'] = false
            print(getgenv().setting['LockPlayers'])
        else
            loackplayerslabel.Text = "Lock Players | ON"
            getgenv().setting['LockPlayers'] = true
            print(getgenv().setting['LockPlayers'])
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

-- Aim at the selected player
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

-- Shoot at the aimed player
mouse.Button1Down:Connect(function()
    pcall(function()
        if Playersaimbot then
            local args = {
                [1] = PlayersPosition,
                [2] = game:GetService("Players"):FindFirstChild(Playersaimbot).Character.HumanoidRootPart
            }
            game:GetService("Players").LocalPlayer.Character[game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name].RemoteFunctionShoot:InvokeServer(unpack(args))
        end
    end)
end)
