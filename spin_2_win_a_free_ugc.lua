--the script needs this
local ANTI_AFK

--player
local plr = game.Players.LocalPlayer

--lib
local l = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()
local w = l:Window("auto farm")

w:Button("auto collect coins", function()
    while true do
        wait(1)
        for i, c in pairs(workspace:GetDescendants()) do
        if c.Name == "Coin" then
            c.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position)
        end
        end
    end
end)

w:Toggle("auto spin", false, function(e)
    while e do
        wait(1)
        if plr.leaderstats.Spins.Value > 2 then
            game:GetService"ReplicatedStorage".ReplicatedEvents.ClaimDailySpin:FireServer()
        else
            warn"not spinned because spins < 2"
        end
    end
end)

w:Toggle("anti afk", false, function(e)
    if e then
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
