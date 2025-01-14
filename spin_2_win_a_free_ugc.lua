--the script needs this
local ANTI_AFK --> anti afk function
local ACC --> auto collect coins toggle
local AS --> auto spin toggle

--variables
local plr = game.Players.LocalPlayer

--lib
local l = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()

--auto farm window
local w = l:Window("auto farm")

w:Toggle("auto collect coins", false, function(v) --> v = value
    ACC = v
    repeat
        for i, c in pairs(workspace:GetDescendants()) do
            if c.Name == "Coin" and ACC then
                c.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position)
            end
        end
        wait(1)
    until ACC == false
end)

w:Toggle("auto spin", false, function(v)
    AS = v
    repeat
        if plr.leaderstats.Spins.Value > 2 and AS then
            game:GetService"ReplicatedStorage".ReplicatedEvents.ClaimDailySpin:FireServer()
        else
            warn"not spinned cuz spins < or = 2"
        end
        wait(1)
    until AS == false
end)

w:Toggle("anti afk", false, function(v)
    if v then
        ANTI_AFK = plr.Idled:Connect(function()
            local VU = game:GetService("VirtualUser")
            VU:CaptureController()
            VU:ClickButton2(Vector2.new())
        end)
    else
        ANTI_AFK:Disconnect()
    end
end)

w:Label("anti kick/ban enabled")

--settings window
local w2 = l:Window("settings")

w2:Button("day", function()
    game.Lighting.ClockTime = 10
end)

w2:Button("morning", function()
    game.Lighting.ClockTime = 6
end)

w2:Button("night", function()
    game.Lighting.ClockTime = 0
end)

w2:Button("evening", function()
    game.Lighting.ClockTime = 18
end)

w2:Button("get codes", function()
    local w3 = l:Window("codes")
    for i, code in ipairs(plr.CodesFolder:GetChildren()) do
        w3:Button(code.Name, function()
            setclipboard(tostring(code.Name))
        end)
    end
end)
