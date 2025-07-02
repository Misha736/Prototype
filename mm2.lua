local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")

if humanoid.Walkspeed = 200 then
humanoid.Walkspeed = 20
