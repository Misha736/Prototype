local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui") -- Получаем PlayerGui

-- Создаем ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SpeedSliderGui"
screenGui.Parent = playerGui -- Добавляем в PlayerGui

-- Рамка для слайдера
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 50)
frame.Position = UDim2.new(0.5, -150, 0.5, -25)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Parent = screenGui

-- Линия для слайдера
local sliderLine = Instance.new("Frame")
sliderLine.Size = UDim2.new(1, 0, 0, 5)
sliderLine.Position = UDim2.new(0, 0, 0.5, -2)
sliderLine.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
sliderLine.Parent = frame

-- Ползунок (движущийся элемент)
local slider = Instance.new("Frame")
slider.Size = UDim2.new(0, 20, 0, 20)
slider.Position = UDim2.new(0, 0, 0.5, -10)
slider.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
slider.Parent = frame

-- Текст для отображения текущей скорости
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 300, 0, 25)
speedLabel.Position = UDim2.new(0.5, -150, 0.5, 35)
speedLabel.Text = "Скорость: 20"
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.BackgroundTransparency = 1
speedLabel.Parent = screenGui

-- Логика изменения скорости
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")

local minSpeed = 20
local maxSpeed = 200

slider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local connection
        connection = game:GetService("UserInputService").InputChanged:Connect(function(mouseInput)
            if mouseInput.UserInputType == Enum.UserInputType.MouseMovement then
                -- Перемещаем ползунок
                local mousePos = mouseInput.Position.X - frame.AbsolutePosition.X
                local sliderPos = math.clamp(mousePos, 0, frame.AbsoluteSize.X)
                slider.Position = UDim2.new(sliderPos / frame.AbsoluteSize.X, -10, slider.Position.Y.Scale, slider.Position.Y.Offset)

                -- Вычисляем скорость
                local speed = math.floor(minSpeed + (maxSpeed - minSpeed) * (sliderPos / frame.AbsoluteSize.X))
                speedLabel.Text = "Скорость: " .. speed
                humanoid.WalkSpeed = speed
            end
        end)

        -- Останавливаем движение при отпускании мыши
        slider.InputEnded:Connect(function(endInput)
            if endInput.UserInputType == Enum.UserInputType.MouseButton1 then
                connection:Disconnect()
            end
        end)
    end
end)