-- Ui nhu tranhalinh 
local TweenService = game:GetService("TweenService")
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local UIS = game:GetService("UserInputService")

local screenGui = Instance.new("ScreenGui", PlayerGui)
screenGui.Name = "Taisynex hub"

local toggleButton = Instance.new("ImageButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 35, 0, 35)
toggleButton.Position = UDim2.new(0, 5, 1, -60)
toggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
toggleButton.Image = "rbxassetid://110892493245840"
toggleButton.AutoButtonColor = true
toggleButton.Parent = screenGui

local toggleCorner = Instance.new("UICorner", toggleButton)
toggleCorner.CornerRadius = UDim.new(0, 10)

local dragging, offset
toggleButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		offset = input.Position - toggleButton.AbsolutePosition
	end
end)
toggleButton.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)
UIS.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		toggleButton.Position = UDim2.new(0, input.Position.X - offset.X, 0, input.Position.Y - offset.Y)
	end
end)

local frame = Instance.new("Frame")
frame.Name = "MainMenu"
frame.Size = UDim2.new(0, 500, 0, 300)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
frame.BorderColor3 = Color3.new(1, 1, 1)
frame.BorderSizePixel = 2
frame.Visible = false
frame.ClipsDescendants = true
frame.Parent = screenGui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

local frameDragging, frameOffset
frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		frameDragging = true
		frameOffset = input.Position - frame.AbsolutePosition
	end
end)
frame.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		frameDragging = false
	end
end)
UIS.InputChanged:Connect(function(input)
	if frameDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		frame.Position = UDim2.new(0, input.Position.X - frameOffset.X, 0, input.Position.Y - frameOffset.Y)
	end
end)

-- Logo
local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0, 30, 0, 30)
logo.Position = UDim2.new(0, 10, 0, 10)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://110892493245840"
logo.Parent = frame

local tabNames = {"Tab1", "Tab2", "Tab3"}
local tabFrames = {}
local currentTab = nil

for i, name in ipairs(tabNames) do
	local tabBtn = Instance.new("TextButton")
	tabBtn.Size = UDim2.new(0, 80, 0, 30)
	tabBtn.Position = UDim2.new(0, 50 + ((i-1)*90), 0, 10)
	tabBtn.Text = name
	tabBtn.BackgroundColor3 = Color3.new(1,1,1)
	tabBtn.TextColor3 = Color3.new(0,0,0)
	tabBtn.Font = Enum.Font.GothamBold
	tabBtn.TextSize = 14
	tabBtn.Parent = frame
	Instance.new("UICorner", tabBtn).CornerRadius = UDim.new(1,0)

	local tabFrame = Instance.new("Frame")
	tabFrame.Size = UDim2.new(1, -20, 1, -60)
	tabFrame.Position = UDim2.new(0, frame.AbsoluteSize.X, 0, 50)
	tabFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	tabFrame.Visible = false
	tabFrame.Parent = frame
	Instance.new("UICorner", tabFrame).CornerRadius = UDim.new(0, 10)

	local label = Instance.new("TextLabel", tabFrame)
	label.Text = "Nội dung " .. name
	label.Size = UDim2.new(1,0,0,30)
	label.Position = UDim2.new(0,0,0,10)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.new(1,1,1)
	label.Font = Enum.Font.GothamBold
	label.TextSize = 20

	tabFrames[name] = tabFrame

	tabBtn.MouseButton1Click:Connect(function()
		if currentTab == name then return end
		local oldTab = currentTab and tabFrames[currentTab]
		local newTab = tabFrame
		if oldTab then
			local tweenOut = TweenService:Create(oldTab, TweenInfo.new(0.3), {Position = UDim2.new(0, -frame.AbsoluteSize.X, 0, 50)})
			tweenOut:Play()
			tweenOut.Completed:Wait()
			oldTab.Visible = false
		end
		newTab.Position = UDim2.new(0, frame.AbsoluteSize.X, 0, 50)
		newTab.Visible = true
		local tweenIn = TweenService:Create(newTab, TweenInfo.new(0.3), {Position = UDim2.new(0, 10, 0, 50)})
		tweenIn:Play()
		currentTab = name
	end)
end

local toggleLabel = Instance.new("TextLabel")
toggleLabel.Text = "VIP Mode:"
toggleLabel.Size = UDim2.new(0,100,0,30)
toggleLabel.Position = UDim2.new(0, 10, 0, 260)
toggleLabel.TextColor3 = Color3.new(1,1,1)
toggleLabel.BackgroundTransparency = 1
toggleLabel.Font = Enum.Font.Gotham
toggleLabel.TextSize = 16
toggleLabel.Parent = frame

local toggleCircle = Instance.new("TextButton")
toggleCircle.Size = UDim2.new(0, 30, 0, 30)
toggleCircle.Position = UDim2.new(0, 120, 0, 260)
toggleCircle.BackgroundColor3 = Color3.fromRGB(50,50,50)
toggleCircle.Text = ""
toggleCircle.AutoButtonColor = false
toggleCircle.Parent = frame
Instance.new("UICorner", toggleCircle).CornerRadius = UDim.new(1, 0)

local circleInside = Instance.new("Frame", toggleCircle)
circleInside.Size = UDim2.new(1, 0, 1, 0)
circleInside.Position = UDim2.new(0, 0, 0, 0)
circleInside.BackgroundColor3 = Color3.new(1,1,1)
circleInside.Visible = false
Instance.new("UICorner", circleInside).CornerRadius = UDim.new(1, 0)

local isOn = false
toggleCircle.MouseButton1Click:Connect(function()
	isOn = not isOn
	circleInside.Visible = isOn
end)

toggleButton.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
end)