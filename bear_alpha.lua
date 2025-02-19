local p = game.Players.LocalPlayer
local c = p.Character
local h = c.Humanoid
local hrp = c.HumanoidRootPart
local antiAFK
local farm

local l = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()
local w = l:Window("main")
w:Toggle("auto farm", false, function(e) 
    farm = e
    repeat
        if farm then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(400, 28, -27)
            game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(408, 28, -27)
            wait(8.5)
        end
    until farm == false
end)
w:Toggle("anti afk", false, function(e)
    if e then
        antiAFK = p.Idled:Connect(function()
            local vu = game:GetService("VirtualUser")
            vu:CaptureController()
            vu:ClickButton2(Vector2.new())
        end)
    else
        antiAFK:Disconnect()
    end
end)
