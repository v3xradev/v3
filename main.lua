-- [[ V3xra Hub - Official Redz Library Edition ]]

local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/redz-hub/RedzLibV5/main/Source.Lua"))()

local Window = RedzLib:MakeWindow({
  Title = "redz Hub : Blox Fruits",
  SubTitle = "by v3xradev",
  BorderSize = 2,
  BackgroundColor = Color3.fromRGB(15, 15, 15),
  BorderColor = Color3.fromRGB(35, 35, 35)
})

-- Sol Menü Butonları (Fotoğraftaki Birebir Sekmeler)
local DiscordTab  = Window:MakeTab({"Discord", "info"})
local FarmTab     = Window:MakeTab({"Farm", "home"})
local QuestsTab   = Window:MakeTab({"Quests/Items", "swords"})
local FruitTab    = Window:MakeTab({"Fruit/Raid", "cherry"})
local TeleportTab = Window:MakeTab({"Teleport", "map-pin"})
local VisualTab   = Window:MakeTab({"Visual", "eye"})
local ShopTab     = Window:MakeTab({"Shop", "shopping-cart"})
local MiscTab     = Window:MakeTab({"Misc", "settings"})

----------------------------------------------------
-- FARM SEKMESİ (Attığın Fotoğrafın Birebir Aynısı)
----------------------------------------------------

FarmTab:AddSection({"Auto Farm Material"})
FarmTab:AddToggle({
  Name = "Auto Farm Material",
  Description = "Select the Material before activating this option",
  Default = false,
  Callback = function(Value)
    _G.AutoFarmMaterial = Value
  end
})

FarmTab:AddSection({"Mastery"})

-- Can Yüzdesi Slider'ı (Fotoğraftaki Sağlık Ayarı)
FarmTab:AddSlider({
  Name = "Select Health",
  Min = 1,
  Max = 100,
  Increase = 1,
  Default = 25,
  Callback = function(Value)
    _G.MasteryHealth = Value
  end
})

-- Silah Seçimi Açılır Menü (Dropdown)
FarmTab:AddDropdown({
  Name = "Select Tool",
  Options = {"Blox Fruit", "Melee", "Sword", "Gun"},
  Default = "Blox Fruit",
  Callback = function(Value)
    _G.SelectTool = Value
  end
})

FarmTab:AddToggle({
  Name = "Auto Farm Mastery",
  Default = false,
  Callback = function(Value)
    _G.AutoMastery = Value
  end
})

FarmTab:AddSection({"Skill Settings"})

FarmTab:AddToggle({
  Name = "AimBot Skill Enable",
  Default = true,
  Callback = function(Value)
    _G.AimBotSkill = Value
  end
})

FarmTab:AddToggle({
  Name = "Skill Z",
  Default = true,
  Callback = function(Value)
    _G.SkillZ = Value
  end
})

FarmTab:AddToggle({
  Name = "Skill X",
  Default = true,
  Callback = function(Value)
    _G.SkillX = Value
  end
})

FarmTab:AddToggle({
  Name = "Skill C",
  Default = true,
  Callback = function(Value)
    _G.SkillC = Value
  end
})

FarmTab:AddToggle({
  Name = "Skill V",
  Default = true,
  Callback = function(Value)
    _G.SkillV = Value
  end
})

FarmTab:AddToggle({
  Name = "Skill F",
  Default = false,
  Callback = function(Value)
    _G.SkillF = Value
  end
})
