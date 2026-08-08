-- [[ V3xra Hub - Redz Hub Official UI Engine ]]

local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/real-redz/redzhub/refs/heads/main/redzlib"))()

local Window = redzlib:MakeWindow({
  Title = "⚡ V3xra Hub | Blox Fruits",
  SubTitle = "by v3xradev",
  BorderSize = 2,
  BackgroundColor = Color3.fromRGB(15, 15, 20),
  BorderColor = Color3.fromRGB(235, 50, 50)
})

-- Sol Menü Kategorileri (Tabs)
local MainTab = Window:MakeTab({"🌾 Level & Farm", "home"})
local FruitTab = Window:MakeTab({"🍓 Meyve & Item", "cherry"})
local SeaTab = Window:MakeTab({"🌊 Sea Events", "waves"})
local EventTab = Window:MakeTab({"🦊 Kitsune & Island", "sparkles"})
local CombatTab = Window:MakeTab({"⚔️ Fast M1 & Combat", "swords"})

----------------------------------------------------
-- 1. LEVEL & FARM TAB
----------------------------------------------------
MainTab:AddSection({"Auto Farm Ayarları"})

MainTab:AddToggle({
  Name = "Auto Level Farm (Seviyene Göre)",
  Default = false,
  Callback = function(Value)
    _G.AutoFarmLevel = Value
  end
})

MainTab:AddToggle({
  Name = "Auto Quest (Otomatik Görev Al)",
  Default = true,
  Callback = function(Value)
    _G.AutoQuest = Value
  end
})

----------------------------------------------------
-- 2. MEYVE & ITEM TAB
----------------------------------------------------
FruitTab:AddSection({"Meyve Toplayıcı & Sniper"})

FruitTab:AddToggle({
  Name = "Auto Grab Fruits (Haritadaki Meyveleri Topla)",
  Default = false,
  Callback = function(Value)
    _G.AutoGrabFruit = Value
  end
})

FruitTab:AddButton({
  Name = "Meyve Satın Al (Random Fruit)",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
  end
})

----------------------------------------------------
-- 3. SEA EVENTS TAB
----------------------------------------------------
SeaTab:AddSection({"Deniz Etkinlikleri"})

SeaTab:AddToggle({
  Name = "Auto Sea Event (Ship Raid / Sea Beast)",
  Default = false,
  Callback = function(Value)
    _G.AutoSeaEvent = Value
  end
})

----------------------------------------------------
-- 4. KITSUNE & PREHISTORIC TAB
----------------------------------------------------
EventTab:AddSection({"Özel Adalar"})

EventTab:AddToggle({
  Name = "Auto Kitsune Island (Azure Ember Topla)",
  Default = false,
  Callback = function(Value)
    _G.AutoKitsune = Value
  end
})

EventTab:AddToggle({
  Name = "Auto Prehistoric Island",
  Default = false,
  Callback = function(Value)
    _G.AutoPrehistoric = Value
  end
})

----------------------------------------------------
-- 5. FAST M1 & COMBAT TAB
----------------------------------------------------
CombatTab:AddSection({"Saldırı Hızı Ayarları"})

CombatTab:AddToggle({
  Name = "Fast M1 Attack (Sıfır Bekleme)",
  Default = false,
  Callback = function(Value)
    _G.FastM1 = Value
  end
})

-- Sol Alt Bildirim
redzlib:SetNotification({
  Title = "V3xra Hub",
  Description = "Redz Hub Motoru Başarıyla Yüklendi!",
  Time = 5
})
