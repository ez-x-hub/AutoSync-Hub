-- Behaviour trace of a Unknown obfuscator script
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: finished
-- 860 statements recorded in 0.23s

-- [deobf] folded 0 repeated calls into 0 helper functions and 3 unrolled runs into loops
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Humanoid = Players.LocalPlayer.Character:WaitForChild("Humanoid")

Players.LocalPlayer.CharacterAdded:Connect(function(character)
	local Humanoid3 = character:WaitForChild("Humanoid")
end)

CoreGui:FindFirstChild("GhostStatsGUI")
local GhostStatsGUI = CoreGui:FindFirstChild("GhostStatsGUI")
GhostStatsGUI:Destroy()
local GhostStatsGUI2 = Instance.new("ScreenGui")
GhostStatsGUI2.Name = "GhostStatsGUI"
GhostStatsGUI2.ResetOnSpawn = false
GhostStatsGUI2.IgnoreGuiInset = true
GhostStatsGUI2.Parent = CoreGui
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 350, 0, 470)
Frame.Position = UDim2.new(0.005, 0, 0.522, 0)
Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Parent = GhostStatsGUI2
local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 12)
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(50, 50, 50)
UIStroke.Thickness = 3
UIStroke.Parent = Frame
local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, 0, 0.03, 28)
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "Ghost Stats"
TextLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextScaled = false
TextLabel.TextSize = 24
TextLabel.Parent = Frame
local Frame2 = Instance.new("Frame")
Frame2.Size = UDim2.new(0.957, 0, 0.9, 0)
Frame2.Position = UDim2.new(0.043, 0, 0.1, 0)
Frame2.BackgroundTransparency = 1
Frame2.Parent = Frame
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 6)
UIListLayout.Parent = Frame2

TextLabel.InputBegan:Connect(function(input, gameProcessed)
end)

TextLabel.InputEnded:Connect(function(input2, gameProcessed2)
end)

UserInputService.InputChanged:Connect(function(input3, gameProcessed3)
end)

RunService.RenderStepped:Connect(function(deltaTime)
	-- [envlog] error: Script:2: attempt to compare number <= userdata
	-- [envlog] error: Script:2: attempt to compare number <= userdata
end)

getgenv().GhostGUI = {
	AddStat = function(arg, arg2)
		local TextLabel2 = Instance.new("TextLabel")
		TextLabel2.Size = UDim2.new(1, 0, 0, 20)
		TextLabel2.BackgroundTransparency = 1
		TextLabel2.Text = tostring(arg) .. " " .. tostring(arg2)
		TextLabel2.TextColor3 = Color3.fromRGB(0, 255, 255)
		TextLabel2.RichText = true
		TextLabel2.Font = Enum.Font.GothamSemibold
		TextLabel2.TextScaled = false
		TextLabel2.TextSize = 19
		TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel2.TextWrapped = true
		TextLabel2.Parent = Frame2
	end,
	Clear = function()
		Frame2:GetChildren()
		TextLabel2:Destroy()
	end,
	UpdateStat = function(arg5, arg6)
		arg5.Text = arg6 .. " <font color=\"rgb(255,255,255)\"> </font><font color=\"rgb(255,0,0)\">No</font>"
	end
}

local Ghost = workspace:FindFirstChild("Ghost")
local TextLabel3 = Instance.new("TextLabel")
TextLabel3.Size = UDim2.new(1, 0, 0, 20)
TextLabel3.BackgroundTransparency = 1
TextLabel3.Text = "Current Room: Loading..."
TextLabel3.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel3.RichText = true
TextLabel3.Font = Enum.Font.GothamSemibold
TextLabel3.TextScaled = false
TextLabel3.TextSize = 19
TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
TextLabel3.TextWrapped = true
TextLabel3.Parent = Frame2
local TextLabel4 = Instance.new("TextLabel")
TextLabel4.Size = UDim2.new(1, 0, 0, 20)
TextLabel4.BackgroundTransparency = 1
TextLabel4.Text = "Favorite Room: Loading..."
TextLabel4.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel4.RichText = true
TextLabel4.Font = Enum.Font.GothamSemibold
TextLabel4.TextScaled = false
TextLabel4.TextSize = 19
TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
TextLabel4.TextWrapped = true
TextLabel4.Parent = Frame2
local TextLabel5 = Instance.new("TextLabel")
TextLabel5.Size = UDim2.new(1, 0, 0, 20)
TextLabel5.BackgroundTransparency = 1
TextLabel5.Text = "Age: Loading..."
TextLabel5.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel5.RichText = true
TextLabel5.Font = Enum.Font.GothamSemibold
TextLabel5.TextScaled = false
TextLabel5.TextSize = 19
TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
TextLabel5.TextWrapped = true
TextLabel5.Parent = Frame2
local TextLabel6 = Instance.new("TextLabel")
TextLabel6.Size = UDim2.new(1, 0, 0, 20)
TextLabel6.BackgroundTransparency = 1
TextLabel6.Text = "Gender: Loading..."
TextLabel6.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel6.RichText = true
TextLabel6.Font = Enum.Font.GothamSemibold
TextLabel6.TextScaled = false
TextLabel6.TextSize = 19
TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
TextLabel6.TextWrapped = true
TextLabel6.Parent = Frame2
local TextLabel7 = Instance.new("TextLabel")
TextLabel7.Size = UDim2.new(1, 0, 0, 20)
TextLabel7.BackgroundTransparency = 1
TextLabel7.Text = "Hunting: Loading..."
TextLabel7.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel7.RichText = true
TextLabel7.Font = Enum.Font.GothamSemibold
TextLabel7.TextScaled = false
TextLabel7.TextSize = 19
TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
TextLabel7.TextWrapped = true
TextLabel7.Parent = Frame2
local TextLabel8 = Instance.new("TextLabel")
TextLabel8.Size = UDim2.new(1, 0, 0, 20)
TextLabel8.BackgroundTransparency = 1
TextLabel8.Text = "Ghost Orbs: Loading..."
TextLabel8.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel8.RichText = true
TextLabel8.Font = Enum.Font.GothamSemibold
TextLabel8.TextScaled = false
TextLabel8.TextSize = 19
TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
TextLabel8.TextWrapped = true
TextLabel8.Parent = Frame2
local TextLabel9 = Instance.new("TextLabel")
TextLabel9.Size = UDim2.new(1, 0, 0, 20)
TextLabel9.BackgroundTransparency = 1
TextLabel9.Text = "Handprints: Loading..."
TextLabel9.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel9.RichText = true
TextLabel9.Font = Enum.Font.GothamSemibold
TextLabel9.TextScaled = false
TextLabel9.TextSize = 19
TextLabel9.TextXAlignment = Enum.TextXAlignment.Left
TextLabel9.TextWrapped = true
TextLabel9.Parent = Frame2
local TextLabel10 = Instance.new("TextLabel")
TextLabel10.Size = UDim2.new(1, 0, 0, 20)
TextLabel10.BackgroundTransparency = 1
TextLabel10.Text = "EMF Level 5: Loading..."
TextLabel10.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel10.RichText = true
TextLabel10.Font = Enum.Font.GothamSemibold
TextLabel10.TextScaled = false
TextLabel10.TextSize = 19
TextLabel10.TextXAlignment = Enum.TextXAlignment.Left
TextLabel10.TextWrapped = true
TextLabel10.Parent = Frame2
local TextLabel11 = Instance.new("TextLabel")
TextLabel11.Size = UDim2.new(1, 0, 0, 20)
TextLabel11.BackgroundTransparency = 1
TextLabel11.Text = "Ghost Footsteps: Loading..."
TextLabel11.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel11.RichText = true
TextLabel11.Font = Enum.Font.GothamSemibold
TextLabel11.TextScaled = false
TextLabel11.TextSize = 19
TextLabel11.TextXAlignment = Enum.TextXAlignment.Left
TextLabel11.TextWrapped = true
TextLabel11.Parent = Frame2
local TextLabel12 = Instance.new("TextLabel")
TextLabel12.Size = UDim2.new(1, 0, 0, 20)
TextLabel12.BackgroundTransparency = 1
TextLabel12.Text = "Broken Glass: Loading..."
TextLabel12.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel12.RichText = true
TextLabel12.Font = Enum.Font.GothamSemibold
TextLabel12.TextScaled = false
TextLabel12.TextSize = 19
TextLabel12.TextXAlignment = Enum.TextXAlignment.Left
TextLabel12.TextWrapped = true
TextLabel12.Parent = Frame2
local TextLabel13 = Instance.new("TextLabel")
TextLabel13.Size = UDim2.new(1, 0, 0, 20)
TextLabel13.BackgroundTransparency = 1
TextLabel13.Text = "Nightmare Shatter: Loading..."
TextLabel13.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel13.RichText = true
TextLabel13.Font = Enum.Font.GothamSemibold
TextLabel13.TextScaled = false
TextLabel13.TextSize = 19
TextLabel13.TextXAlignment = Enum.TextXAlignment.Left
TextLabel13.TextWrapped = true
TextLabel13.Parent = Frame2
local TextLabel14 = Instance.new("TextLabel")
TextLabel14.Size = UDim2.new(1, 0, 0, 20)
TextLabel14.BackgroundTransparency = 1
TextLabel14.Text = "Entity Smoke: Loading..."
TextLabel14.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel14.RichText = true
TextLabel14.Font = Enum.Font.GothamSemibold
TextLabel14.TextScaled = false
TextLabel14.TextSize = 19
TextLabel14.TextXAlignment = Enum.TextXAlignment.Left
TextLabel14.TextWrapped = true
TextLabel14.Parent = Frame2
local TextLabel15 = Instance.new("TextLabel")
TextLabel15.Size = UDim2.new(1, 0, 0, 20)
TextLabel15.BackgroundTransparency = 1
TextLabel15.Text = "Ghost Speed: Loading..."
TextLabel15.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel15.RichText = true
TextLabel15.Font = Enum.Font.GothamSemibold
TextLabel15.TextScaled = false
TextLabel15.TextSize = 19
TextLabel15.TextXAlignment = Enum.TextXAlignment.Left
TextLabel15.TextWrapped = true
TextLabel15.Parent = Frame2
local TextLabel16 = Instance.new("TextLabel")
TextLabel16.Size = UDim2.new(1, 0, 0, 20)
TextLabel16.BackgroundTransparency = 1
TextLabel16.Text = "Player Speed: Loading..."
TextLabel16.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel16.RichText = true
TextLabel16.Font = Enum.Font.GothamSemibold
TextLabel16.TextScaled = false
TextLabel16.TextSize = 19
TextLabel16.TextXAlignment = Enum.TextXAlignment.Left
TextLabel16.TextWrapped = true
TextLabel16.Parent = Frame2
local TextLabel17 = Instance.new("TextLabel")
TextLabel17.Size = UDim2.new(1, 0, 0, 20)
TextLabel17.BackgroundTransparency = 1
TextLabel17.Text = "Current Room Temp: Loading..."
TextLabel17.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel17.RichText = true
TextLabel17.Font = Enum.Font.GothamSemibold
TextLabel17.TextScaled = false
TextLabel17.TextSize = 19
TextLabel17.TextXAlignment = Enum.TextXAlignment.Left
TextLabel17.TextWrapped = true
TextLabel17.Parent = Frame2
local TextLabel18 = Instance.new("TextLabel")
TextLabel18.Size = UDim2.new(1, 0, 0, 20)
TextLabel18.BackgroundTransparency = 1
TextLabel18.Text = "Favorite Room Temp: Loading..."
TextLabel18.TextColor3 = Color3.fromRGB(0, 255, 255)
TextLabel18.RichText = true
TextLabel18.Font = Enum.Font.GothamSemibold
TextLabel18.TextScaled = false
TextLabel18.TextSize = 19
TextLabel18.TextXAlignment = Enum.TextXAlignment.Left
TextLabel18.TextWrapped = true
TextLabel18.Parent = Frame2
local attribute = Ghost:GetAttribute("Hunting")
TextLabel7.Text = "Hunting:" .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(attribute) .. "</font>"
local attributeChangedSignal = Ghost:GetAttributeChangedSignal("Hunting")

attributeChangedSignal:Connect(function()
	local attribute12 = Ghost:GetAttribute("Hunting")
	TextLabel7.Text = "Hunting:" .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(attribute12) .. "</font>"
end)

local BrokenGlass = workspace:FindFirstChild("BrokenGlass")
BrokenGlass:GetChildren()
TextLabel13.Text = "Nightmare Shatter: <font color=\"rgb(255,255,255)\"> </font><font color=\"rgb(255,0,0)\">No</font>"

workspace.DescendantAdded:Connect(function(descendant)
end)

BrokenGlass.ChildAdded:Connect(function(child)
	BrokenGlass:GetChildren()
	TextLabel13.Text = "Nightmare Shatter: <font color=\"rgb(255,255,255)\"> </font><font color=\"rgb(255,0,0)\">No</font>"
end)

BrokenGlass.ChildRemoved:Connect(function(child2)
	BrokenGlass:GetChildren()
	TextLabel13.Text = "Nightmare Shatter: <font color=\"rgb(255,255,255)\"> </font><font color=\"rgb(255,0,0)\">No</font>"
end)

for _, item in ipairs({
	{ text = "FavoriteRoom", textLabel = TextLabel4, text2 = "Favorite Room:" },
	{ text = "Gender", textLabel = TextLabel6, text2 = "Gender:" },
	{ text = "Age", textLabel = TextLabel5, text2 = "Age:" },
}) do
	local attribute2 = Ghost:GetAttribute(item.text)
	item.textLabel.Text = item.text2 .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(attribute2) .. "</font>"
	local attributeChangedSignal2 = Ghost:GetAttributeChangedSignal(item.text)

	attributeChangedSignal2:Connect(function()
		local attribute13 = Ghost:GetAttribute(item.text)
		item.textLabel.Text = item.text2 .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(attribute13) .. "</font>"
	end)
end

local descendants = workspace:GetDescendants()

for i, v in ipairs(descendants) do
	v:GetAttribute("ItemName")
end

TextLabel10.Text = "EMF Level 5: <font color=\"rgb(255,255,255)\"> </font><font color=\"rgb(255,0,0)\">No</font>"

workspace.DescendantAdded:Connect(function(descendant2)
	task.defer(function()
	end)
end)

local EffectHolder = workspace:FindFirstChild("EffectHolder")
TextLabel14.Text = "Entity Smoke: <font color=\"rgb(255,255,255)\"> </font><font color=\"rgb(255,0,0)\">No</font>"

EffectHolder.ChildAdded:Connect(function(child3)
end)

TextLabel16.Text = "Player Speed:" .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(Humanoid.WalkSpeed) .. "</font>"
local changedSignal = Humanoid:GetPropertyChangedSignal("WalkSpeed")

changedSignal:Connect(function()
	TextLabel16.Text = "Player Speed:" .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(Humanoid.WalkSpeed) .. "</font>"
end)

Players.LocalPlayer.CharacterAdded:Connect(function(character2)
	local changedSignal3 = Humanoid3:GetPropertyChangedSignal("WalkSpeed")

	changedSignal3:Connect(function()
		TextLabel16.Text = "Player Speed:" .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(Humanoid3.WalkSpeed) .. "</font>"
	end)

	TextLabel16.Text = "Player Speed:" .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(Humanoid3.WalkSpeed) .. "</font>"
end)

local attribute5 = Ghost:GetAttribute("CurrentRoom")
TextLabel3.Text = "Current Room:" .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(attribute5) .. "</font>"
local attributeChangedSignal5 = Ghost:GetAttributeChangedSignal("CurrentRoom")

attributeChangedSignal5:Connect(function()
	local attribute16 = Ghost:GetAttribute("CurrentRoom")
	TextLabel3.Text = "Current Room:" .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(attribute16) .. "</font>"
end)

for _, item in ipairs({
	{ childName = "BrokenGlass", textLabel = TextLabel12, text = "Broken Glass: <font color=\"rgb(255,255,255)\"> </font><font color=\"rgb(255,0,0)\">No</font>" },
	{ childName = "Handprints", textLabel = TextLabel9, text = "Handprints: <font color=\"rgb(255,255,255)\"> </font><font color=\"rgb(255,0,0)\">No</font>" },
	{ childName = "Ghost", textLabel = TextLabel11, text = "Ghost Footsteps: <font color=\"rgb(255,255,255)\"> </font><font color=\"rgb(255,0,0)\">No</font>" },
}) do
	local BrokenGlass2 = workspace:FindFirstChild(item.childName)
	local children = BrokenGlass2:GetChildren()

	for i2, v2 in ipairs(children) do
	end

	item.textLabel.Text = item.text

	BrokenGlass2.ChildAdded:Connect(function(child4)
	end)

	BrokenGlass2.ChildRemoved:Connect(function(child5)
	end)
end

local Ghost3 = workspace:FindFirstChild("Ghost")
local Humanoid2 = Ghost3:FindFirstChild("Humanoid")
TextLabel15.Text = "Ghost Speed:" .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(Humanoid2.WalkSpeed) .. "</font>"
local changedSignal2 = Humanoid2:GetPropertyChangedSignal("WalkSpeed")

changedSignal2:Connect(function()
	TextLabel15.Text = "Ghost Speed:" .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(Humanoid2.WalkSpeed) .. "</font>"
end)

local children4 = workspace:GetChildren()

for i5, v5 in ipairs(children4) do
end

TextLabel8.Text = "Ghost Orbs: <font color=\"rgb(255,255,255)\"> </font><font color=\"rgb(255,0,0)\">No</font>"

workspace.ChildAdded:Connect(function(child10)
end)

workspace.ChildRemoved:Connect(function(child11)
end)

local attribute6 = Ghost:GetAttribute("CurrentRoom")
local Map = workspace:FindFirstChild("Map")
local Rooms = Map:FindFirstChild("Rooms")
local child = Rooms:FindFirstChild(attribute6)
local attribute7 = child:GetAttribute("Temperature")
TextLabel17.Text = "Current Room Temp:" .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(attribute7 .. "°C") .. "</font>"
local attributeChangedSignal6 = Ghost:GetAttributeChangedSignal("CurrentRoom")

attributeChangedSignal6:Connect(function()
	local attribute17 = Ghost:GetAttribute("CurrentRoom")
	local Map5 = workspace:FindFirstChild("Map")
	local Rooms5 = Map5:FindFirstChild("Rooms")
	local child5 = Rooms5:FindFirstChild(attribute17)
	local attribute18 = child5:GetAttribute("Temperature")
	TextLabel17.Text = "Current Room Temp:" .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(attribute18 .. "°C") .. "</font>"
end)

local attribute8 = Ghost:GetAttribute("CurrentRoom")
local Map2 = workspace:FindFirstChild("Map")
local Rooms2 = Map2:FindFirstChild("Rooms")
local child2 = Rooms2:FindFirstChild(attribute8)
local attributeChangedSignal7 = child2:GetAttributeChangedSignal("Temperature")

attributeChangedSignal7:Connect(function()
	Ghost:GetAttribute("CurrentRoom")
end)

local attributeChangedSignal8 = Ghost:GetAttributeChangedSignal("CurrentRoom")

attributeChangedSignal8:Connect(function()
	local attribute19 = Ghost:GetAttribute("CurrentRoom")
	local Map6 = workspace:FindFirstChild("Map")
	local Rooms6 = Map6:FindFirstChild("Rooms")
	local child6 = Rooms6:FindFirstChild(attribute19)
	local attributeChangedSignal12 = child6:GetAttributeChangedSignal("Temperature")

	attributeChangedSignal12:Connect(function()
		Ghost:GetAttribute("CurrentRoom")
	end)
end)

local attribute9 = Ghost:GetAttribute("FavoriteRoom")
local Map3 = workspace:FindFirstChild("Map")
local Rooms3 = Map3:FindFirstChild("Rooms")
local child3 = Rooms3:FindFirstChild(attribute9)
local attribute10 = child3:GetAttribute("Temperature")
TextLabel18.Text = "Favorite Room Temp:" .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(attribute10 .. "°C") .. "</font>"
local attributeChangedSignal9 = Ghost:GetAttributeChangedSignal("FavoriteRoom")

attributeChangedSignal9:Connect(function()
	local attribute20 = Ghost:GetAttribute("FavoriteRoom")
	local Map7 = workspace:FindFirstChild("Map")
	local Rooms7 = Map7:FindFirstChild("Rooms")
	local child7 = Rooms7:FindFirstChild(attribute20)
	local attribute21 = child7:GetAttribute("Temperature")
	TextLabel18.Text = "Favorite Room Temp:" .. " <font color=\"rgb(255,255,255)\"> </font>" .. "<font color=\"" .. "rgb(255,255,255)" .. "\">" .. tostring(attribute21 .. "°C") .. "</font>"
end)

local attribute11 = Ghost:GetAttribute("FavoriteRoom")
local Map4 = workspace:FindFirstChild("Map")
local Rooms4 = Map4:FindFirstChild("Rooms")
local child4 = Rooms4:FindFirstChild(attribute11)
local attributeChangedSignal10 = child4:GetAttributeChangedSignal("Temperature")

attributeChangedSignal10:Connect(function()
	Ghost:GetAttribute("FavoriteRoom")
end)

local attributeChangedSignal11 = Ghost:GetAttributeChangedSignal("FavoriteRoom")

attributeChangedSignal11:Connect(function()
	local attribute22 = Ghost:GetAttribute("FavoriteRoom")
	local Map8 = workspace:FindFirstChild("Map")
	local Rooms8 = Map8:FindFirstChild("Rooms")
	local child8 = Rooms8:FindFirstChild(attribute22)
	local attributeChangedSignal13 = child8:GetAttributeChangedSignal("Temperature")

	attributeChangedSignal13:Connect(function()
		Ghost:GetAttribute("FavoriteRoom")
	end)
end)

CoreGui:FindFirstChild("ToggleGUI")
local ToggleGUI = CoreGui:FindFirstChild("ToggleGUI")
ToggleGUI:Destroy()
local ToggleGUI2 = Instance.new("ScreenGui")
ToggleGUI2.Name = "ToggleGUI"
ToggleGUI2.ResetOnSpawn = false
ToggleGUI2.IgnoreGuiInset = true
ToggleGUI2.Parent = CoreGui
local Frame3 = Instance.new("Frame")
Frame3.Size = UDim2.new(0, 250, 0, 350)
Frame3.Position = UDim2.new(0.865, 0, 0.45, 0)
Frame3.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Frame3.BorderSizePixel = 0
Frame3.Active = true
Frame3.Parent = ToggleGUI2
local UICorner2 = Instance.new("UICorner", Frame3)
UICorner2.CornerRadius = UDim.new(0, 12)
local UIStroke2 = Instance.new("UIStroke")
UIStroke2.Color = Color3.fromRGB(50, 50, 50)
UIStroke2.Thickness = 3
UIStroke2.Parent = Frame3
local TextLabel19 = Instance.new("TextLabel")
TextLabel19.Size = UDim2.new(1, 0, 0.12, 0)
TextLabel19.Position = UDim2.new(0, 0, 0.001, 0)
TextLabel19.BackgroundTransparency = 1
TextLabel19.Text = "Toggle Buttons"
TextLabel19.TextColor3 = Color3.fromRGB(230, 230, 230)
TextLabel19.Font = Enum.Font.GothamBold
TextLabel19.TextScaled = false
TextLabel19.TextSize = 22
TextLabel19.Parent = Frame3
local Frame4 = Instance.new("Frame")
Frame4.Size = UDim2.new(0.957, 0, 0.875, 0)
Frame4.Position = UDim2.new(0.06, 0, 0.13, 0)
Frame4.BackgroundTransparency = 1
local lastTextLabel = Frame4

for _, item in ipairs({
	{ parent = Frame3, text = "Script  by  tranquiLo" },
	{ parent = Frame4, text = "My Discord  :  estranquilo" },
}) do
	local previousTextLabel = lastTextLabel
	previousTextLabel.Parent = item.parent
	local TextLabel20 = Instance.new("TextLabel")
	TextLabel20.Size = UDim2.new(1, 0, 0.065, 0)
	TextLabel20.Position = UDim2.new(0, 0, 0.935, 0)
	TextLabel20.BackgroundTransparency = 1
	TextLabel20.Text = item.text
	TextLabel20.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel20.TextTransparency = 0.2
	TextLabel20.Font = Enum.Font.GothamBold
	TextLabel20.TextScaled = false
	TextLabel20.TextSize = 14
	TextLabel20.TextXAlignment = Enum.TextXAlignment.Center
	lastTextLabel = TextLabel20
end

lastTextLabel.TextYAlignment = Enum.TextYAlignment.Top
lastTextLabel.Parent = Frame4
local UIListLayout2 = Instance.new("UIListLayout", Frame4)
UIListLayout2.Padding = UDim.new(0.015, 0)

TextLabel19.InputBegan:Connect(function(input4, gameProcessed4)
end)

TextLabel19.InputEnded:Connect(function(input5, gameProcessed5)
end)

UserInputService.InputChanged:Connect(function(input6, gameProcessed6)
end)

RunService.RenderStepped:Connect(function(deltaTime2)
	-- [envlog] error: Script:2: attempt to compare number <= userdata
	-- [envlog] error: Script:2: attempt to compare number <= userdata
end)

local TextButton = Instance.new("TextButton")
TextButton.Size = UDim2.new(0.9, 0, 0, 28)
TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton.BorderSizePixel = 0
TextButton.AutoButtonColor = false
TextButton.Font = Enum.Font.GothamSemibold
TextButton.TextScaled = false
TextButton.TextSize = 18
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.Parent = Frame4
local UICorner3 = Instance.new("UICorner", TextButton)
UICorner3.CornerRadius = UDim.new(0, 6)
TextButton.RichText = true

TextButton.MouseEnter:Connect(function()
	local tween = TweenService:Create(TextButton, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(45, 45, 45) })
	tween:Play()
end)

TextButton.MouseLeave:Connect(function()
	local tween2 = TweenService:Create(TextButton, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(30, 30, 30) })
	tween2:Play()
end)

TextButton.MouseButton1Click:Connect(function()
	TextButton.Text = "Ghost ESP <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(0,255,0)\">ON</font>"
	local Ghost4 = workspace:FindFirstChild("Ghost")
	local Head = Ghost4:FindFirstChild("Head")
	local GhostESP = Instance.new("BillboardGui")
	GhostESP.Name = "GhostESP"
	GhostESP.Size = UDim2.new(0, 60, 0, 20)
	GhostESP.StudsOffset = Vector3.new(0, 0, 0)
	GhostESP.AlwaysOnTop = true
	GhostESP.Brightness = 1
	GhostESP.DistanceLowerLimit = 0
	GhostESP.DistanceStep = 0
	GhostESP.DistanceUpperLimit = -1
	GhostESP.MaxDistance = math.huge
	GhostESP.LightInfluence = 0
	GhostESP.SizeOffset = Vector2.new(0, 0)
	GhostESP.Parent = Head
	local TextLabel22 = Instance.new("TextLabel")
	TextLabel22.Size = UDim2.new(1, 0, 1, 0)
	TextLabel22.BackgroundTransparency = 1
	TextLabel22.Text = "Ghost"
	TextLabel22.TextSize = 10
	TextLabel22.Font = Enum.Font.GothamSemibold
	TextLabel22.TextScaled = true
	TextLabel22.TextStrokeTransparency = 1
	TextLabel22.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel22.TextWrapped = true
	TextLabel22.Parent = GhostESP

	RunService.RenderStepped:Connect(function(deltaTime3)
		-- [envlog] error: Script:2: attempt to compare number <= userdata
		-- [envlog] error: Script:2: attempt to compare number <= userdata
	end)
end)

TextButton.Text = "Ghost ESP <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(255,0,0)\">OFF</font>"
local TextButton2 = Instance.new("TextButton")
TextButton2.Size = UDim2.new(0.9, 0, 0, 28)
TextButton2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton2.BorderSizePixel = 0
TextButton2.AutoButtonColor = false
TextButton2.Font = Enum.Font.GothamSemibold
TextButton2.TextScaled = false
TextButton2.TextSize = 18
TextButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton2.Parent = Frame4
local UICorner4 = Instance.new("UICorner", TextButton2)
UICorner4.CornerRadius = UDim.new(0, 6)
TextButton2.RichText = true

TextButton2.MouseEnter:Connect(function()
	local tween3 = TweenService:Create(TextButton2, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(45, 45, 45) })
	tween3:Play()
end)

TextButton2.MouseLeave:Connect(function()
	local tween4 = TweenService:Create(TextButton2, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(30, 30, 30) })
	tween4:Play()
end)

TextButton2.MouseButton1Click:Connect(function()
	TextButton2.Text = "Fullbright <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(0,255,0)\">ON</font>"
	Lighting.Ambient = Color3.fromRGB(255, 255, 255)
	Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
	Lighting.Brightness = 4
	Lighting.GlobalShadows = false
end)

TextButton2.Text = "Fullbright <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(255,0,0)\">OFF</font>"
local TextButton3 = Instance.new("TextButton")
TextButton3.Size = UDim2.new(0.9, 0, 0, 28)
TextButton3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton3.BorderSizePixel = 0
TextButton3.AutoButtonColor = false
TextButton3.Font = Enum.Font.GothamSemibold
TextButton3.TextScaled = false
TextButton3.TextSize = 18
TextButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton3.Parent = Frame4
local UICorner5 = Instance.new("UICorner", TextButton3)
UICorner5.CornerRadius = UDim.new(0, 6)
TextButton3.RichText = true

TextButton3.MouseEnter:Connect(function()
	local tween5 = TweenService:Create(TextButton3, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(45, 45, 45) })
	tween5:Play()
end)

TextButton3.MouseLeave:Connect(function()
	local tween6 = TweenService:Create(TextButton3, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(30, 30, 30) })
	tween6:Play()
end)

TextButton3.MouseButton1Click:Connect(function()
	TextButton3.Text = "Orb ESP <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(0,255,0)\">ON</font>"
	local GhostOrb = workspace:WaitForChild("GhostOrb")
	local OrbESP = Instance.new("Highlight")
	OrbESP.Name = "OrbESP"
	OrbESP.Adornee = GhostOrb
	OrbESP.FillTransparency = 0
	OrbESP.OutlineTransparency = 0
	OrbESP.FillColor = Color3.fromRGB(0, 180, 255)
	OrbESP.OutlineColor = Color3.fromRGB(0, 180, 255)
	OrbESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	OrbESP.Parent = GhostOrb
end)

TextButton3.Text = "Orb ESP <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(255,0,0)\">OFF</font>"
local TextButton4 = Instance.new("TextButton")
TextButton4.Size = UDim2.new(0.9, 0, 0, 28)
TextButton4.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton4.BorderSizePixel = 0
TextButton4.AutoButtonColor = false
TextButton4.Font = Enum.Font.GothamSemibold
TextButton4.TextScaled = false
TextButton4.TextSize = 18
TextButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton4.Parent = Frame4
local UICorner6 = Instance.new("UICorner", TextButton4)
UICorner6.CornerRadius = UDim.new(0, 6)
TextButton4.RichText = true

TextButton4.MouseEnter:Connect(function()
	local tween7 = TweenService:Create(TextButton4, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(45, 45, 45) })
	tween7:Play()
end)

TextButton4.MouseLeave:Connect(function()
	local tween8 = TweenService:Create(TextButton4, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(30, 30, 30) })
	tween8:Play()
end)

TextButton4.MouseButton1Click:Connect(function()
	TextButton4.Text = "Handprints ESP <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(0,255,0)\">ON</font>"
	local Handprints2 = workspace:FindFirstChild("Handprints")
	local children5 = Handprints2:GetChildren()

	for i6, v6 in ipairs(children5) do
		local SurfaceGui = v6:FindFirstChildWhichIsA("SurfaceGui", true)
		SurfaceGui.AlwaysOnTop = true
		local ImageLabel = SurfaceGui:FindFirstChildWhichIsA("ImageLabel", true)
		ImageLabel.ImageTransparency = 0
		local HandprintESP = Instance.new("BillboardGui")
		HandprintESP.Name = "HandprintESP"
		HandprintESP.Size = UDim2.new(0, 80, 0, 25)
		HandprintESP.StudsOffset = Vector3.new(0, 0.5, 0)
		HandprintESP.AlwaysOnTop = true
		HandprintESP.MaxDistance = math.huge
		HandprintESP.LightInfluence = 0
		HandprintESP.Parent = v6
		local TextLabel23 = Instance.new("TextLabel")
		TextLabel23.Size = UDim2.new(1, 0, 1, 0)
		TextLabel23.BackgroundTransparency = 1
		TextLabel23.Text = "Handprint"
		TextLabel23.TextSize = 6
		TextLabel23.TextScaled = true
		TextLabel23.Font = Enum.Font.GothamSemibold
		TextLabel23.TextColor3 = Color3.fromRGB(235, 0, 255)
		TextLabel23.TextStrokeTransparency = 0.8
		TextLabel23.TextStrokeColor3 = Color3.fromRGB(235, 0, 255)
		TextLabel23.Parent = HandprintESP
	end

	Handprints2.ChildAdded:Connect(function(child12)
		local SurfaceGui2 = child12:FindFirstChildWhichIsA("SurfaceGui", true)
		SurfaceGui2.AlwaysOnTop = true
		local ImageLabel2 = SurfaceGui2:FindFirstChildWhichIsA("ImageLabel", true)
		ImageLabel2.ImageTransparency = 0
		local HandprintESP2 = Instance.new("BillboardGui")
		HandprintESP2.Name = "HandprintESP"
		HandprintESP2.Size = UDim2.new(0, 80, 0, 25)
		HandprintESP2.StudsOffset = Vector3.new(0, 0.5, 0)
		HandprintESP2.AlwaysOnTop = true
		HandprintESP2.MaxDistance = math.huge
		HandprintESP2.LightInfluence = 0
		HandprintESP2.Parent = child12
		local TextLabel25 = Instance.new("TextLabel")
		TextLabel25.Size = UDim2.new(1, 0, 1, 0)
		TextLabel25.BackgroundTransparency = 1
		TextLabel25.Text = "Handprint"
		TextLabel25.TextSize = 6
		TextLabel25.TextScaled = true
		TextLabel25.Font = Enum.Font.GothamSemibold
		TextLabel25.TextColor3 = Color3.fromRGB(235, 0, 255)
		TextLabel25.TextStrokeTransparency = 0.8
		TextLabel25.TextStrokeColor3 = Color3.fromRGB(235, 0, 255)
		TextLabel25.Parent = HandprintESP2
	end)

	Handprints2.ChildRemoved:Connect(function(child13)
	end)
end)

TextButton4.Text = "Handprints ESP <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(255,0,0)\">OFF</font>"
local TextButton5 = Instance.new("TextButton")
TextButton5.Size = UDim2.new(0.9, 0, 0, 28)
TextButton5.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton5.BorderSizePixel = 0
TextButton5.AutoButtonColor = false
TextButton5.Font = Enum.Font.GothamSemibold
TextButton5.TextScaled = false
TextButton5.TextSize = 18
TextButton5.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton5.Parent = Frame4
local UICorner7 = Instance.new("UICorner", TextButton5)
UICorner7.CornerRadius = UDim.new(0, 6)
TextButton5.RichText = true

TextButton5.MouseEnter:Connect(function()
	local tween9 = TweenService:Create(TextButton5, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(45, 45, 45) })
	tween9:Play()
end)

TextButton5.MouseLeave:Connect(function()
	local tween10 = TweenService:Create(TextButton5, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(30, 30, 30) })
	tween10:Play()
end)

TextButton5.MouseButton1Click:Connect(function()
	TextButton5.Text = "Items ESP <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(0,255,0)\">ON</font>"
	local Items = workspace:FindFirstChild("Items")
	local children6 = Items:GetChildren()

	for i7, v7 in ipairs(children6) do
		local attribute23 = v7:GetAttribute("ItemName")
		local ItemESP = Instance.new("BillboardGui")
		ItemESP.Name = "ItemESP"
		ItemESP.Size = UDim2.new(0, 100, 0, 25)
		ItemESP.StudsOffset = Vector3.new(0, 0.5, 0)
		ItemESP.Brightness = 1
		ItemESP.AlwaysOnTop = true
		ItemESP.MaxDistance = math.huge
		ItemESP.LightInfluence = 0
		ItemESP.Parent = v7.PrimaryPart
		local TextLabel24 = Instance.new("TextLabel")
		TextLabel24.Size = UDim2.new(1, 0, 1, 0)
		TextLabel24.BackgroundTransparency = 1
		TextLabel24.Text = tostring(attribute23)
		TextLabel24.TextSize = 8
		TextLabel24.TextScaled = true
		TextLabel24.Font = Enum.Font.GothamSemibold
		TextLabel24.TextColor3 = Color3.fromRGB(3, 230, 250)
		TextLabel24.TextStrokeTransparency = 1
		TextLabel24.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel24.TextWrapped = true
		TextLabel24.Parent = ItemESP
	end

	Items.ChildAdded:Connect(function(child14)
		task.wait()
		local attribute24 = child14:GetAttribute("ItemName")
		local ItemESP2 = Instance.new("BillboardGui")
		ItemESP2.Name = "ItemESP"
		ItemESP2.Size = UDim2.new(0, 100, 0, 25)
		ItemESP2.StudsOffset = Vector3.new(0, 0.5, 0)
		ItemESP2.Brightness = 1
		ItemESP2.AlwaysOnTop = true
		ItemESP2.MaxDistance = math.huge
		ItemESP2.LightInfluence = 0
		ItemESP2.Parent = child14.PrimaryPart
		local TextLabel26 = Instance.new("TextLabel")
		TextLabel26.Size = UDim2.new(1, 0, 1, 0)
		TextLabel26.BackgroundTransparency = 1
		TextLabel26.Text = tostring(attribute24)
		TextLabel26.TextSize = 8
		TextLabel26.TextScaled = true
		TextLabel26.Font = Enum.Font.GothamSemibold
		TextLabel26.TextColor3 = Color3.fromRGB(3, 230, 250)
		TextLabel26.TextStrokeTransparency = 1
		TextLabel26.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel26.TextWrapped = true
		TextLabel26.Parent = ItemESP2
	end)

	Items.ChildRemoved:Connect(function(child15)
	end)
end)

TextButton5.Text = "Items ESP <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(255,0,0)\">OFF</font>"
local TextButton6 = Instance.new("TextButton")
TextButton6.Size = UDim2.new(0.9, 0, 0, 28)
TextButton6.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton6.BorderSizePixel = 0
TextButton6.AutoButtonColor = false
TextButton6.Font = Enum.Font.GothamSemibold
TextButton6.TextScaled = false
TextButton6.TextSize = 18
TextButton6.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton6.Parent = Frame4
local UICorner8 = Instance.new("UICorner", TextButton6)
UICorner8.CornerRadius = UDim.new(0, 6)
TextButton6.RichText = true

TextButton6.MouseEnter:Connect(function()
	local tween11 = TweenService:Create(TextButton6, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(45, 45, 45) })
	tween11:Play()
end)

TextButton6.MouseLeave:Connect(function()
	local tween12 = TweenService:Create(TextButton6, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(30, 30, 30) })
	tween12:Play()
end)

TextButton6.MouseButton1Click:Connect(function()
	TextButton6.Text = "Reward Objects ESP <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(0,255,0)\">ON</font>"
	local Interactables = workspace:FindFirstChild("Interactables")
	local children7 = Interactables:GetChildren()

	for i8, v8 in ipairs(children7) do
		v8:GetAttribute("PhotoRewardAvailable")
		local attributeChangedSignal14 = v8:GetAttributeChangedSignal("PhotoRewardAvailable")

		local connection = attributeChangedSignal14:Connect(function()
			v8:GetAttribute("PhotoRewardAvailable")
			connection:Disconnect()
		end)
	end

	Interactables.ChildAdded:Connect(function(child16)
		child16:GetAttribute("PhotoRewardAvailable")
		local attributeChangedSignal17 = child16:GetAttributeChangedSignal("PhotoRewardAvailable")

		local connection2 = attributeChangedSignal17:Connect(function()
			child16:GetAttribute("PhotoRewardAvailable")
			connection2:Disconnect()
		end)
	end)

	Interactables.ChildRemoved:Connect(function(child17)
	end)
end)

TextButton6.Text = "Reward Objects ESP <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(255,0,0)\">OFF</font>"
local TextButton7 = Instance.new("TextButton")
TextButton7.Size = UDim2.new(0.9, 0, 0, 28)
TextButton7.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton7.BorderSizePixel = 0
TextButton7.AutoButtonColor = false
TextButton7.Font = Enum.Font.GothamSemibold
TextButton7.TextScaled = false
TextButton7.TextSize = 18
TextButton7.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton7.Parent = Frame4
local UICorner9 = Instance.new("UICorner", TextButton7)
UICorner9.CornerRadius = UDim.new(0, 6)
TextButton7.RichText = true

TextButton7.MouseEnter:Connect(function()
	local tween13 = TweenService:Create(TextButton7, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(45, 45, 45) })
	tween13:Play()
end)

TextButton7.MouseLeave:Connect(function()
	local tween14 = TweenService:Create(TextButton7, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(30, 30, 30) })
	tween14:Play()
end)

TextButton7.MouseButton1Click:Connect(function()
	TextButton7.Text = "Infinite Stamina <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(0,255,0)\">ON</font>"
	local attributeChangedSignal15 = Players.LocalPlayer:GetAttributeChangedSignal("Sprinting")

	attributeChangedSignal15:Connect(function()
		Players.LocalPlayer:GetAttribute("Sprinting")
	end)
end)

TextButton7.Text = "Infinite Stamina <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(255,0,0)\">OFF</font>"
local TextButton8 = Instance.new("TextButton")
TextButton8.Size = UDim2.new(0.9, 0, 0, 28)
TextButton8.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton8.BorderSizePixel = 0
TextButton8.AutoButtonColor = false
TextButton8.Font = Enum.Font.GothamSemibold
TextButton8.TextScaled = false
TextButton8.TextSize = 18
TextButton8.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton8.Parent = Frame4
local UICorner10 = Instance.new("UICorner", TextButton8)
UICorner10.CornerRadius = UDim.new(0, 6)
TextButton8.RichText = true

TextButton8.MouseEnter:Connect(function()
	local tween15 = TweenService:Create(TextButton8, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(45, 45, 45) })
	tween15:Play()
end)

TextButton8.MouseLeave:Connect(function()
	local tween16 = TweenService:Create(TextButton8, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(30, 30, 30) })
	tween16:Play()
end)

TextButton8.MouseButton1Click:Connect(function()
	TextButton8.Text = "Hunt Escape <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(0,255,0)\">ON</font>"
	local attributeChangedSignal16 = Ghost:GetAttributeChangedSignal("Hunting")

	attributeChangedSignal16:Connect(function()
		Ghost:GetAttribute("Hunting")
	end)

	RunService.Heartbeat:Connect(function(deltaTime4)
		Ghost:GetAttribute("Hunting")
	end)
end)

TextButton8.Text = "Hunt Escape <font color=\"rgb(255,255,255)\">: </font><font color=\"rgb(255,0,0)\">OFF</font>"
CoreGui:FindFirstChild("GhostStatsGUI")
CoreGui:FindFirstChild("ToggleGUI")

UserInputService.InputBegan:Connect(function(input7, gameProcessed7)
end)

CoreGui:FindFirstChild("MobileToggleGUI")
local MobileToggleGUI = CoreGui:FindFirstChild("MobileToggleGUI")
MobileToggleGUI:Destroy()
local MobileToggleGUI2 = Instance.new("ScreenGui")
MobileToggleGUI2.Name = "MobileToggleGUI"
MobileToggleGUI2.ResetOnSpawn = false
MobileToggleGUI2.IgnoreGuiInset = true
MobileToggleGUI2.DisplayOrder = 999999
MobileToggleGUI2.ZIndexBehavior = Enum.ZIndexBehavior.Global
MobileToggleGUI2.Parent = CoreGui
local ImageButton = Instance.new("ImageButton")
ImageButton.Size = UDim2.new(0.08, 0, 0.08, 0)
ImageButton.Position = UDim2.new(0.92, 0, 0.03, 0)
ImageButton.AnchorPoint = Vector2.new(1, 0)
ImageButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ImageButton.BackgroundTransparency = 0.15
ImageButton.BorderSizePixel = 0
ImageButton.Image = "rbxassetid://87149917106794"
ImageButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.ImageTransparency = 0.1
ImageButton.ZIndex = 100
ImageButton.Parent = MobileToggleGUI2
local UICorner11 = Instance.new("UICorner")
UICorner11.CornerRadius = UDim.new(1, 0)
UICorner11.Parent = ImageButton
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
UIAspectRatioConstraint.AspectRatio = 1
UIAspectRatioConstraint.AspectType = Enum.AspectType.ScaleWithParentSize
UIAspectRatioConstraint.Parent = ImageButton
ImageButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)

ImageButton.InputBegan:Connect(function(input8, gameProcessed8)
end)

ImageButton.InputEnded:Connect(function(input9, gameProcessed9)
end)

UserInputService.InputChanged:Connect(function(input10, gameProcessed10)
end)

ImageButton.MouseButton1Click:Connect(function()
	GhostStatsGUI2.Enabled = false
	ToggleGUI2.Enabled = false
	ImageButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
end)

ImageButton.TouchBegan:Connect(function()
	ImageButton.ImageTransparency = 0
end)

ImageButton.TouchEnded:Connect(function(hit)
	ImageButton.ImageTransparency = 0.1
end)
