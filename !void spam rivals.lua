local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Legendary Lion's HVH Utilities",
   Icon = 0,
   LoadingTitle = "loading..",
   LoadingSubtitle = "thanks for using script",
   ShowText = "Rayfield",
   Theme = "Default", 

   ToggleUIKeybind = "K", 

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Lion's HVH utilities"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", 
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local players = game:GetService("Players")
local rs = game:GetService("RunService")
local uip = game:GetService("UserInputService")
local lp = players.LocalPlayer
local enabled = false
local loc = CFrame.new()
local loca = CFrame.Angles
local loop1
local hook = nil

local function getmangoes() -- MANGO MANGO MANGO
    if lp and lp.Character and lp.Character:WaitForChild("HumanoidRootPart") then
        return lp.Character.HumanoidRootPart
    end
end

hrp = getmangoes()

local function gethuman()
    if lp.Character and lp.Character:WaitForChild("Humanoid") then
        return lp.Character.Humanoid
    end
end

human = gethuman() -- Im only human

local function onionshavelayers(hrp) 
    if hrp then
        local layer1 = CFrame.new(math.random(-100000, 100000), math.random(100000, 1000000), math.random(-100000, 100000))
        local layer2
        for i = 0, 50 do
            layer2 = layer1 + Vector3.new(
            math.random(-1000, 1000), math.random(-1000, 1000), math.random(-1000, 1000))
            layer1 = layer2
        end
        return layer2
    end
end

local function mangoeshavelayers() 
    if hrp then
        local ango = CFrame.Angles(math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)), math.rad(math.random(-360, 360)))
        return ango
    end
end

local function runer() 
    if loop1 then loop1:Disconnect() end
    if hook then
        hookmetamethod(game, "__index", hook)
        hook = nil
    end
    loop1 = rs.Heartbeat:Connect(function()
        if enabled == true and lp.Character then
            local character = lp.Character
            local hrp = hrp
            if hrp then
                loca = hrp.CFrame
                loc = hrp.CFrame 
                local newAngle = mangoeshavelayers()
                local newCframe = loc * onionshavelayers(hrp) * newAngle
                hrp.CFrame = newCframe
                rs.RenderStepped:Wait()
                hrp.CFrame = loc
            end
        end
    end)
    hook = hookmetamethod(game, "__index", newcclosure(function(self, key)
        if not checkcaller() and key == "CFrame" and lp.Character and self == hrp and enabled == true then
            return loc
        end
        return hook(self, key)
    end))
end




lp.CharacterAdded:Connect(function()
    if hook then
        hookmetamethod(game, "__index", hook)
        hook = nil
    end
    if loop1 then loop1:Disconnect() end
    if enabled then
        runer()
    end
end)


local Tab = Window:CreateTab("Main", "skull") -- Those who know (skull)

local Divider = Tab:CreateDivider()

local Toggle = Tab:CreateToggle({
   Name = "Auto Evade",
   CurrentValue = false,
   Flag = "Toggle1",
    Callback = function(Value)
        enabled = Value
        if Value then
            runer()
        else
            if loop1 then loop1:Disconnect() end
            if hook then
                hookmetamethod(game, "__index", hook)
                hook = nil
            end
        end
    end
})
