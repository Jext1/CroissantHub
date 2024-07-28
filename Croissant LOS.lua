local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Jext1/CroissantHub/main/CroissantOrion.lua')))()
local Window = OrionLib:MakeWindow({Name = "Croissant Hub", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroText = "Croissant Hub", IntroIcon = "rbxassetid://18675291390"})

-- Tabs
local TabHome = Window:MakeTab({
	Name = "Home",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab1 = Window:MakeTab({
    Name = "AutoRebirth",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Tab2 = Window:MakeTab({
    Name = "Hoopfarm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Tab3 = Window:MakeTab({
    Name = "Gemfarm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Tab4 = Window:MakeTab({
    Name = "Orbfarm",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Tab5 = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local EggTab = Window:MakeTab({
	    Name = "Pets",
	    Icon = "rbxassetid://4483345998",
	    PremiumOnly = false
    })

local TeleportTab = Window:MakeTab({
	    Name = "Teleports",
	    Icon = "rbxassetid://4483345998",
	    PremiumOnly = false
    })

--Tab Home (Home)

local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local gameId = game.PlaceId

TabHome:AddParagraph("Game", "Name: " .. gameName .. "\nID: " .. gameId)

TabHome:AddButton({
	Name = "Discord",
	Callback = function()
      		setclipboard("lalala")
  	end    
})

--Tab 1

Tab1:AddToggle({
    Name = "AutoRebirth",
    Default = false,
    Callback = function(State)
        if State then
            _G.Rebirth = true
            while _G.Rebirth do
                wait(5)
                local tbl_main = {"rebirthRequest"}
                game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(unpack(tbl_main))
            end
        else
            _G.Rebirth = false
        end
    end
})

-- Tab 2

Tab2:AddToggle({
    Name = "Hoopfarm",
    Default = false,
    Callback = function(State)
        if State then
            _G.Farm3 = true
            while _G.Farm3 do
                wait()
                for i, v in pairs(game.Workspace.Hoops:GetChildren()) do
                    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                end
            end
        else
            _G.Farm3 = false
        end
    end
})

-- Tab 3

Tab3:AddToggle({
    Name = "Gemfarm",
    Default = false,
    Callback = function(State)
        if State then
            _G.Farm2 = true
            while _G.Farm2 do
                wait()
                for i, v in pairs(game.Workspace.orbFolder.City:GetChildren()) do
                    if v.Name == "Gem" then
                        v.outerGem.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        else
            _G.Farm2 = false
        end
    end
})

--Tab 4

Tab4:AddToggle({
    Name = "Orbfarm",
    Default = false,
    Callback = function(State)
        if State then
            _G.Farm1 = true
            while _G.Farm1 do
                wait()
                for i, v in pairs(game.Workspace.orbFolder.City:GetChildren()) do
                    if v.Name ~= "Gem" then
                        v.outerOrb.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        else
            _G.Farm1 = false
        end
    end
})

-- Tab 5

Tab5:AddButton({
    Name = "Collect Orbs",
    Callback = function()
        while true do
            wait(0.01)
            local orbs = {"Red Orb", "Yellow Orb", "Gem", "Orange Orb"}
            for _, orb in pairs(orbs) do
                local tbl_main = {"collectOrb", orb, "City"}
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(tbl_main))
            end
            local tbl_main = {"rebirthRequest"}
            game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(unpack(tbl_main))
        end
    end
})

-- Egg Tab

EggTab:AddToggle({
	Name = "Auto Egg",
	Default = false,
	Callback = function(Value)
            function Egg()
                while getgenv().AutoEgg == true do
                    game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal", getgenv().Egg)
                    wait()
                end
            end
            
            getgenv().AutoEgg = Value
            Egg()
          end
    })
    
    EggTab:AddDropdown({
	Name = "Select Egg",
	Default = "Yellow Crystal",
	Options = {"Yellow Crystal", "Blue Crystal", "Red Crystal", "Lightning Crystal", "Inferno Crystal", "Lava Crystal", "Snow Crystal", "Electro Legends Crystal", "Space Crystal", "Alien Crystal", "Electro Crystal", "Desert Crystal"},
	Callback = function(Value)
		getgenv().Egg = Value
	end    
    })
end

-- Teleport Tab

TeleportTab:AddButton({
	    Name = "Highway Legends",
	    Callback = function()
            local plr = game.Players.LocalPlayer
            local char = plr.Character
            char.HumanoidRootPart.CFrame = CFrame.new(3682.60254, 71.5308151, 5592.50879, -0.0193620101, 3.62180188e-08, -0.999812543, 4.99353519e-08, 1, 3.52577771e-08, 0.999812543, -4.92433294e-08, -0.0193620101)
          end    
    })

    TeleportTab:AddButton({
	    Name = "Snow City",
	    Callback = function()
            local plr = game.Players.LocalPlayer
            local char = plr.Character
            char.HumanoidRootPart.CFrame = CFrame.new(-866.386841, 4.00088787, 2165.70654, -0.499959469, -9.93534854e-08, -0.866048813, -4.44803661e-08, 1, -8.90424445e-08, 0.866048813, -5.99544503e-09, -0.499959469)
      	end    
    })

    TeleportTab:AddButton({
	    Name = "Magma City",
	    Callback = function()
            local plr = game.Players.LocalPlayer
            local char = plr.Character
            char.HumanoidRootPart.CFrame = CFrame.new(1616.82739, 4.05089617, 4330.65283, 7.86637156e-06, -4.15036254e-08, -1, -6.3789912e-08, 1, -4.15041264e-08, 1, 6.37902389e-08, 7.86637156e-06)
      	end    
    })

    TeleportTab:AddButton({
	    Name = "City",
	    Callback = function()
            local plr = game.Players.LocalPlayer
            local char = plr.Character
            char.HumanoidRootPart.CFrame = CFrame.new(-537.767456, 3.95088959, 386.226837, 1, 0, 0, 0, 1, 0, 0, 0, 1)
      	end    
    })