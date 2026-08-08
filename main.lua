-- [[ V3xra Hub - Direct GUI ]]

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("V3xraMainGui") then
    CoreGui.V3xraMainGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "V3xraMainGui"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 320)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 140, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SideCorner = Instance.new("UICorner")
SideCorner.CornerRadius = UDim.new(0, 8)
SideCorner.Parent = Sidebar

local LogoLabel = Instance.new("TextLabel")
LogoLabel.Size = UDim2.new(1, 0, 0, 45)
LogoLabel.BackgroundTransparency = 1
LogoLabel.Text = "⚡ V3XRA HUB"
LogoLabel.TextColor3 = Color3.fromRGB(235, 50, 50)
LogoLabel.TextSize = 16
LogoLabel.Font = Enum.Font.GothamBold
LogoLabel.Parent = Sidebar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Position = UDim2.new(1, -30, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(235, 50, 50)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local ContentHolder = Instance.new("Frame")
ContentHolder.Size = UDim2.new(1, -150, 1, -40)
ContentHolder.Position = UDim2.new(0, 145, 0, 35)
ContentHolder.BackgroundTransparency = 1
ContentHolder.Parent = MainFrame

local Pages = {}
local TabButtons = {}

local function CreateTab(name, id, yPos)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -16, 0, 32)
    Btn.Position = UDim2.new(0, 8, 0, yPos)
    Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
    Btn.Text = name
    Btn.TextColor3 = Color3.fromRGB(160, 160, 170)
    Btn.TextSize = 12
    Btn.Font = Enum.Font.GothamSemibold
    Btn.Parent = Sidebar

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Btn

    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.ScrollBarThickness = 3
    Page.Visible = false
    Page.Parent = ContentHolder

    Pages[id] = Page
    TabButtons[id] = Btn

    Btn.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do p.Visible = false end
        for _, b in pairs(TabButtons) do 
            b.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
            b.TextColor3 = Color3.fromRGB(160, 160, 170)
        end
        Page.Visible = true
        Btn.BackgroundColor3 = Color3.fromRGB(235, 50, 50)
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)

    return Page
end

local FarmPage = CreateTab("🌾 Level Farm", "farm", 50)
local FruitPage = CreateTab("🍓 Meyve & Item", "fruit", 88)
local SeaPage = CreateTab("🌊 Sea Events", "sea", 126)
local EventPage = CreateTab("🦊 Kitsune Island", "event", 164)
local CombatPage = CreateTab("⚔️ Fast M1", "combat", 202)

Pages["farm"].Visible = true
TabButtons["farm"].BackgroundColor3 = Color3.fromRGB(235, 50, 50)
TabButtons["farm"].TextColor3 = Color3.fromRGB(255, 255, 255)

local function AddToggle(parent, text, yPos, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -10, 0, 38)
    Frame.Position = UDim2.new(0, 0, 0, yPos)
    Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    Frame.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -50, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(220, 220, 220)
    Label.TextSize = 12
    Label.Font = Enum.Font.GothamSemibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0, 36, 0, 18)
    ToggleBtn.Position = UDim2.new(1, -44, 0.5, -9)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    ToggleBtn.Text = ""
    ToggleBtn.Parent = Frame

    local TCorner = Instance.new("UICorner")
    TCorner.CornerRadius = UDim.new(0, 10)
    TCorner.Parent = ToggleBtn

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0, 12, 0, 12)
    Dot.Position = UDim2.new(0, 3, 0.5, -6)
    Dot.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
    Dot.Parent = ToggleBtn

    local DCorner = Instance.new("UICorner")
    DCorner.CornerRadius = UDim.new(0, 10)
    DCorner.Parent = Dot

    local enabled = false
    ToggleBtn.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            TweenService:Create(Dot, TweenInfo.new(0.15), {Position = UDim2.new(1, -15, 0.5, -6), BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
            TweenService:Create(ToggleBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(235, 50, 50)}):Play()
        else
            TweenService:Create(Dot, TweenInfo.new(0.15), {Position = UDim2.new(0, 3, 0.5, -6), BackgroundColor3 = Color3.fromRGB(180, 180, 180)}):Play()
            TweenService:Create(ToggleBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(40, 40, 50)}):Play()
        end
        callback(enabled)
    end)
end

AddToggle(FarmPage, "Auto Level Farm (Seviyene Göre)", 0, function(state) _G.AutoFarmLevel = state end)
AddToggle(FarmPage, "Auto Quest (Görev Al)", 45, function(state) _G.AutoQuest = state end)

AddToggle(FruitPage, "Auto Grab Fruit (Haritadaki Meyveler)", 0, function(state) _G.AutoGrab = state end)

AddToggle(SeaPage, "Auto Sea Event (Sea Beast / Ship Raid)", 0, function(state) _G.AutoSea = state end)

AddToggle(EventPage, "Auto Kitsune Island (Azure Ember)", 0, function(state) _G.AutoKitsune = state end)
AddToggle(EventPage, "Auto Prehistoric Island", 45, function(state) _G.AutoPrehistoric = state end)

AddToggle(CombatPage, "Fast M1 Attack (Sıfır Bekleme)", 0, function(state) _G.FastM1 = state end)
