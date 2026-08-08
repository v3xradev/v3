-- [[ V3xra Hub - Custom Redz Style ]]

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("V3xraRedzGui") then
    CoreGui.V3xraRedzGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "V3xraRedzGui"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

-- Ana Arka Plan
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 360)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -180)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

-- Üst Başlık Çubuğu
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 32)
TopBar.BackgroundTransparency = 1
TopBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -60, 1, 0)
TitleLabel.Position = UDim2.new(0, 12, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "redz Hub : Blox Fruits  <font color=\"rgb(150,150,150)\">by v3xradev</font>"
TitleLabel.RichText = true
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 13
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 25, 0, 25)
CloseBtn.Position = UDim2.new(1, -30, 0, 3)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = TopBar

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Sol Sidebar
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 135, 1, -32)
Sidebar.Position = UDim2.new(0, 0, 0, 32)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SideCorner = Instance.new("UICorner")
SideCorner.CornerRadius = UDim.new(0, 8)
SideCorner.Parent = Sidebar

local SideLayout = Instance.new("UIListLayout")
SideLayout.Padding = UDim.new(0, 4)
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder
SideLayout.Parent = Sidebar

local SidePadding = Instance.new("UIPadding")
SidePadding.PaddingLeft = UDim.new(0, 8)
SidePadding.PaddingTop = UDim.new(0, 8)
SidePadding.PaddingRight = UDim.new(0, 8)
SidePadding.Parent = Sidebar

-- Sağ İçerik Alanı
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -145, 1, -37)
ContentArea.Position = UDim2.new(0, 140, 0, 32)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

local Pages = {}
local TabButtons = {}

local function CreateTab(name, iconText, id)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, 0, 0, 30)
    Btn.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    Btn.BackgroundTransparency = 1
    Btn.Text = "  " .. iconText .. " " .. name
    Btn.TextColor3 = Color3.fromRGB(150, 150, 160)
    Btn.TextSize = 12
    Btn.Font = Enum.Font.GothamSemibold
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.Parent = Sidebar

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Btn

    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.new(1, -10, 1, 0)
    Page.BackgroundTransparency = 1
    Page.ScrollBarThickness = 3
    Page.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 70)
    Page.Visible = false
    Page.Parent = ContentArea

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Padding = UDim.new(0, 8)
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageLayout.Parent = Page

    Pages[id] = Page
    TabButtons[id] = Btn

    Btn.MouseButton1Click:Connect(function()
        for _, p in pairs(Pages) do p.Visible = false end
        for _, b in pairs(TabButtons) do 
            b.BackgroundTransparency = 1
            b.TextColor3 = Color3.fromRGB(150, 150, 160)
        end
        Page.Visible = true
        Btn.BackgroundTransparency = 0
        Btn.BackgroundColor3 = Color3.fromRGB(32, 32, 40)
        Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)

    return Page
end

-- Fotoğraftaki Birebir Sekmeler
local DiscordPage = CreateTab("Discord", "ⓘ", "discord")
local FarmPage    = CreateTab("Farm", "🏠", "farm")
local QuestPage   = CreateTab("Quests/Items", "⚔️", "quests")
local FruitPage   = CreateTab("Fruit/Raid", "🍓", "fruit")
local TeleportPage= CreateTab("Teleport", "🎯", "teleport")
local VisualPage  = CreateTab("Visual", "👁️", "visual")
local ShopPage    = CreateTab("Shop", "🛒", "shop")
local MiscPage    = CreateTab("Misc", "⚙️", "misc")

-- Varsayılan Sekme (Farm)
Pages["farm"].Visible = true
TabButtons["farm"].BackgroundTransparency = 0
TabButtons["farm"].BackgroundColor3 = Color3.fromRGB(32, 32, 40)
TabButtons["farm"].TextColor3 = Color3.fromRGB(255, 255, 255)

----------------------------------------------------
-- ARAYÜZ ELEMANLARI (Section, Toggle, Slider, Dropdown)
----------------------------------------------------

local function AddSection(page, title)
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 0, 20)
    Label.BackgroundTransparency = 1
    Label.Text = title
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 14
    Label.Font = Enum.Font.GothamBold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = page
end

local function AddToggle(page, text, default, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 32)
    Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    Frame.Parent = page

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -50, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.TextSize = 12
    Label.Font = Enum.Font.GothamSemibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0, 34, 0, 18)
    ToggleBtn.Position = UDim2.new(1, -40, 0.5, -9)
    ToggleBtn.BackgroundColor3 = default and Color3.fromRGB(85, 85, 255) or Color3.fromRGB(40, 40, 50)
    ToggleBtn.Text = ""
    ToggleBtn.Parent = Frame

    local TCorner = Instance.new("UICorner")
    TCorner.CornerRadius = UDim.new(0, 10)
    TCorner.Parent = ToggleBtn

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0, 12, 0, 12)
    Dot.Position = default and UDim2.new(1, -15, 0.5, -6) or UDim2.new(0, 3, 0.5, -6)
    Dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dot.Parent = ToggleBtn

    local DCorner = Instance.new("UICorner")
    DCorner.CornerRadius = UDim.new(0, 10)
    DCorner.Parent = Dot

    local enabled = default
    ToggleBtn.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            TweenService:Create(Dot, TweenInfo.new(0.15), {Position = UDim2.new(1, -15, 0.5, -6)}):Play()
            TweenService:Create(ToggleBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(85, 85, 255)}):Play()
        else
            TweenService:Create(Dot, TweenInfo.new(0.15), {Position = UDim2.new(0, 3, 0.5, -6)}):Play()
            TweenService:Create(ToggleBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(40, 40, 50)}):Play()
        end
        callback(enabled)
    end)
end

local function AddSlider(page, text, min, max, default, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, 0, 0, 40)
    Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    Frame.Parent = page

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.5, 0, 0, 20)
    Label.Position = UDim2.new(0, 10, 0, 2)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.TextSize = 12
    Label.Font = Enum.Font.GothamSemibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local ValLabel = Instance.new("TextLabel")
    ValLabel.Size = UDim2.new(0.4, -10, 0, 20)
    ValLabel.Position = UDim2.new(0.6, 0, 0, 2)
    ValLabel.BackgroundTransparency = 1
    ValLabel.Text = tostring(default)
    ValLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ValLabel.TextSize = 12
    ValLabel.Font = Enum.Font.GothamBold
    ValLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValLabel.Parent = Frame

    local SliderBar = Instance.new("Frame")
    SliderBar.Size = UDim2.new(1, -20, 0, 6)
    SliderBar.Position = UDim2.new(0, 10, 1, -12)
    SliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    SliderBar.Parent = Frame

    local SCorner = Instance.new("UICorner")
    SCorner.CornerRadius = UDim.new(0, 3)
    SCorner.Parent = SliderBar

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((default - min)/(max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(85, 85, 255)
    Fill.Parent = SliderBar

    local FCorner = Instance.new("UICorner")
    FCorner.CornerRadius = UDim.new(0, 3)
    FCorner.Parent = Fill
end

----------------------------------------------------
-- BİREBİR FOTOĞRAFTAKİ FARM SAYFASI İÇERİĞİ
----------------------------------------------------
AddSection(FarmPage, "Mastery")
AddSlider(FarmPage, "Select Health", 1, 100, 25, function(val) end)

-- Skill Ayarları
AddSection(FarmPage, "Skill Settings")
AddToggle(FarmPage, "AimBot Skill Enable", true, function(val) end)
AddToggle(FarmPage, "Skill Z", true, function(val) end)
AddToggle(FarmPage, "Skill X", true, function(val) end)
AddToggle(FarmPage, "Skill C", true, function(val) end)
AddToggle(FarmPage, "Skill V", true, function(val) end)
AddToggle(FarmPage, "Skill F", false, function(val) end)

-- Otomatik Oyun Fonksiyonu (Döngü)
task.spawn(function()
    while task.wait(0.1) do
        -- Gelecek güncellemelerdeki oto farm altyapısı
    end
end)
