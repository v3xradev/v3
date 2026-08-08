-- [[ V3xra Hub - Multi-Language Blox Fruits Auto Farm ]]

local LocalizationService = game:GetService("LocalizationService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Kullanıcının Roblox Sistem Dilini Tespit Etme
local userLanguage = "en"
pcall(function()
    local code = LocalizationService.RobloxLocaleId
    if string.sub(code, 1, 2) == "tr" then
        userLanguage = "tr"
    end
end)

-- Dil Sözlüğü (Otomatik Türkçe ve İngilizce Menü)
local Lang = {
    ["tr"] = {
        Title = "⚡ V3xra Hub | Blox Fruits ⚡",
        Loading = "V3xra Hub Yükleniyor...",
        MainTab = "🌾 Ana Farm",
        MiscTab = "⚙️ Diğer Ayarlar",
        SelectMob = "Hedef Yaratık Seç",
        AutoFarm = "Otomatik Kes (Auto Farm)",
        Speed = "Oyuncu Hızı (WalkSpeed)",
        Jump = "Zıplama Gücü (JumpPower)",
        LoadedTitle = "V3xra Hub Yüklendi!",
        LoadedDesc = "İyi oyunlar! Menüyü kullanarak farmı başlatabilirsiniz."
    },
    ["en"] = {
        Title = "⚡ V3xra Hub | Blox Fruits ⚡",
        Loading = "Loading V3xra Hub...",
        MainTab = "🌾 Main Farm",
        MiscTab = "⚙️ Misc / Settings",
        SelectMob = "Select Target Mob",
        AutoFarm = "Auto Farm Mobs",
        Speed = "Player Speed (WalkSpeed)",
        Jump = "Jump Power",
        LoadedTitle = "V3xra Hub Loaded!",
        LoadedDesc = "Have fun! Use the menu to start farming."
    }
}

local T = Lang[userLanguage] or Lang["en"]

-- Rayfield UI Kütüphanesini Yükleme
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = T.Title,
   LoadingTitle = T.Loading,
   LoadingSubtitle = "by V3xra",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "V3xraHub",
      FileName = "BloxFruits"
   },
   Discord = { Enabled = false },
   KeySystem = false
})

getgenv().AutoFarm = false
getgenv().SelectedMob = "Bandit [Lv. 5]"

local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")

-- Anti-AFK (Sunucudan Atılmayı Önleme)
LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector3.new(0,0,0), Workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector3.new(0,0,0), Workspace.CurrentCamera.CFrame)
end)

-- Pürüzsüz Işınlanma Fonksiyonu (Tween)
local function TweenTo(targetCFrame)
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local root = character.HumanoidRootPart
        local distance = (root.Position - targetCFrame.Position).Magnitude
        local speed = 350
        
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end

        local info = TweenInfo.new(distance / speed, Enum.EasingStyle.Linear)
        local tween = TweenService:Create(root, info, {CFrame = targetCFrame})
        tween:Play()
        return tween
    end
end

-- En Yakın Yaratığı Bulma
local function GetClosestMob(mobName)
    local closestMob = nil
    local shortestDistance = math.huge
    local playerPos = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.Position

    if not playerPos then return nil end

    local enemiesFolder = Workspace:FindFirstChild("Enemies") or Workspace

    for _, enemy in pairs(enemiesFolder:GetChildren()) do
        if string.find(enemy.Name, mobName) or enemy.Name == mobName then
            local humanoid = enemy:FindFirstChildOfClass("Humanoid")
            local root = enemy:FindFirstChild("HumanoidRootPart")
            if humanoid and humanoid.Health > 0 and root then
                local distance = (root.Position - playerPos).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestMob = enemy
                end
            end
        end
    end
    return closestMob
end

-- Otomatik Saldırı
local function AutoClick()
    local character = LocalPlayer.Character
    if character then
        local tool = character:FindFirstChildOfClass("Tool")
        if tool then
            tool:Activate()
        end
    end
end

-- Arayüz Elemanları
local FarmTab = Window:CreateTab(T.MainTab, 4483362458)
local MiscTab = Window:CreateTab(T.MiscTab, 4483362458)

FarmTab:CreateDropdown({
   Name = T.SelectMob,
   Options = {"Bandit [Lv. 5]", "Monkey [Lv. 14]", "Gorilla [Lv. 20]", "Pirate [Lv. 35]", "Brute [Lv. 45]"},
   CurrentOption = "Bandit [Lv. 5]",
   Flag = "MobSelect",
   Callback = function(Option)
      getgenv().SelectedMob = Option[1] or Option
   end,
})

FarmTab:CreateToggle({
   Name = T.AutoFarm,
   CurrentValue = false,
   Flag = "AutoFarmToggle",
   Callback = function(Value)
      getgenv().AutoFarm = Value
   end,
})

MiscTab:CreateSlider({
   Name = T.Speed,
   Range = {16, 250},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(Value)
      if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
         LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = Value
      end
   end,
})

MiscTab:CreateSlider({
   Name = T.Jump,
   Range = {50, 300},
   Increment = 1,
   Suffix = "Power",
   CurrentValue = 50,
   Flag = "JumpSlider",
   Callback = function(Value)
      if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
         LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = Value
      end
   end,
})

-- Ana Farm Döngüsü
task.spawn(function()
    while task.wait() do
        if getgenv().AutoFarm then
            pcall(function()
                local rawMobName = string.split(getgenv().SelectedMob, " [")[1]
                local mob = GetClosestMob(rawMobName)

                if mob and mob:FindFirstChild("HumanoidRootPart") then
                    local targetPos = mob.HumanoidRootPart.CFrame * CFrame.new(0, 9, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                    TweenTo(targetPos)
                    AutoClick()
                end
            end)
        end
    end
end)

Rayfield:Notify({
   Title = T.LoadedTitle,
   Content = T.LoadedDesc,
   Duration = 5,
   Image = 4483362458,
})
