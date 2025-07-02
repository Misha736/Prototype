local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")

if humanoid.WalkSpeed == 200 then
    humanoid.WalkSpeed = 20
else
humanoid.WalkSpeed == 200
end