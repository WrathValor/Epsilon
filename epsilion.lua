--| Variables

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("Epsilion") -- Creates the window
local b = w:CreateFolder("Player") -- Creates the folder(U will put here your buttons,etc)
local c = w:CreateFolder("Auto")

local player = game.Players.LocalPlayer
local character = player.character

local parts = game:GetService("Workspace").Map.KillBricks

--| UI

b:Toggle("Fall Damage",function(bool)
    shared.toggle = bool
    print(shared.toggle)
end)

b:Toggle("Auto Pickup",function(bool)
    shared.pickup = bool
    print(shared.pickup)
end)

c:Button("Remove Killbricks", function()
    for _, v in pairs(parts:GetChildren()) do
        local getSize = v.Size
        local getPos = v.Position
        v:Destroy()
        
        local newPart = Instance.new("Part")
        newPart.Parent = workspace.Map
        newPart.Anchored = true
        
        newPart.Size = getSize
        newPart.Position = getPos
    end
end)

c:Button("TP to CR", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4516.33, 839.294, 469.623)
end)

--| Events

game:GetService("RunService"):Connect(function()
    local fallDamage = character:FindFirstChild("fallDamage")
    if shared.Toggle then
        if fallDamage then
            fallDamage.Disabled = true
        end
    else
        if fallDamage then
            fallDamage.Disabled = false
        end
    end
    
   if shared.pickup then
        while shared.pickup do
            for i,v in pairs(game:GetService("Workspace").MouseIgnore:GetDescendants()) do
    		if v:IsA("ClickDetector") then
		   fireclickdetector(v)
    		end
            end
	    wait()
        end
    end
end)
