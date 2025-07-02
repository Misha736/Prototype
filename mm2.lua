local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")

-- Создаем или получаем Animator
local animator = humanoid:FindFirstChild("Animator") or Instance.new("Animator", humanoid)

-- Загружаем анимацию
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://5230661597"
local animationTrack = animator:LoadAnimation(animation)

-- Меняем скорость и воспроизводим анимацию
if humanoid.WalkSpeed == 200 then
    humanoid.WalkSpeed = 20
    animationTrack:Play() -- Воспроизведение анимации
else
    humanoid.WalkSpeed = 200
    animationTrack:Play() -- Воспроизведение анимации
end