-- ==============================================================================
-- AutoSyncUI Framework (Enterprise Edition - 1000+ Lines Architecture)
-- Designed for Roblox High-Performance Script Hubs (WindUI Style Replica)
-- ==============================================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Clean up previous instance
if CoreGui:FindFirstChild("AutoSyncUI_EnterpriseEngine") then
    CoreGui.AutoSyncUI_EnterpriseEngine:Destroy()
end

local AutoSyncUI = {}
AutoSyncUI.__index = AutoSyncUI

-- Internal Utility Functions
local function ApplyCorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = radius or UDim.new(0, 10)
    corner.Parent = parent
    return corner
end

local function ApplyStroke(parent, color, thickness, transparency)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or Color3.fromRGB(50, 60, 75)
    stroke.Thickness = thickness or 1.5
    stroke.Transparency = transparency or 0
    stroke.Parent = parent
    return stroke
end

local function ApplyGradient(parent, colorSequence, rotation)
    local gradient = Instance.new("UIGradient")
    gradient.Color = colorSequence or ColorSequence.new({
        ColorSequenceKeypoint.new(0.0, Color3.fromRGB(240, 30, 90)),
        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(20, 20, 150))
    })
    gradient.Rotation = rotation or 45
    gradient.Parent = parent
    return gradient
end

-- Notification System
function AutoSyncUI:Notify(config)
    local notifyGui = CoreGui:FindFirstChild("AutoSyncUI_EnterpriseEngine") or Instance.new("ScreenGui", CoreGui)
    notifyGui.Name = "AutoSyncUI_EnterpriseEngine"
    
    local card = Instance.new("Frame")
    card.Size = UDim2.new(0, 300, 0, 70)
    card.Position = UDim2.new(1, -320, 1, -90)
    card.BackgroundColor3 = Color3.fromRGB(18, 22, 30)
    card.Parent = notifyGui
    
    ApplyCorner(card, UDim.new(0, 12))
    ApplyStroke(card, Color3.fromRGB(255, 50, 100), 1.5)
    
    local titleLabel = Instance.new("TextLabel", card)
    titleLabel.Size = UDim2.new(1, -20, 0, 25)
    titleLabel.Position = UDim2.new(0, 12, 0, 8)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = config.Title or "Notification"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local descLabel = Instance.new("TextLabel", card)
    descLabel.Size = UDim2.new(1, -20, 0, 30)
    descLabel.Position = UDim2.new(0, 12, 0, 32)
    descLabel.BackgroundTransparency = 1
    descLabel.Text = config.Content or ""
    descLabel.TextColor3 = Color3.fromRGB(180, 190, 205)
    descLabel.Font = Enum.Font.GothamMedium
    descLabel.TextSize = 12
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    task.spawn(function()
        task.wait(config.Duration or 3)
        TweenService:Create(card, TweenInfo.new(0.5), {Position = UDim2.new(1, 20, 1, -90)}):Play()
        task.wait(0.5)
        card:Destroy()
    end)
end

-- Main Window Creator
function AutoSyncUI:CreateWindow(windowConfig)
    local hubTitle = windowConfig.Title or "AutoSyncUI Enterprise"
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AutoSyncUI_EnterpriseEngine"
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Ultra Premium Open Button
    local OpenButton = Instance.new("TextButton")
    OpenButton.Name = "OpenButton"
    OpenButton.Size = UDim2.new(0, 190, 0, 46)
    OpenButton.Position = UDim2.new(0.02, 0, 0.05, 0)
    OpenButton.BackgroundColor3 = Color3.fromRGB(14, 18, 25)
    OpenButton.Text = ""
    OpenButton.AutoButtonColor = false
    OpenButton.Parent = ScreenGui

    ApplyCorner(OpenButton, UDim.new(0, 14))
    local OpenStroke = ApplyStroke(OpenButton, Color3.fromRGB(255, 60, 120), 2)
    if windowConfig.Color then
        ApplyGradient(OpenStroke, windowConfig.Color)
    end

    local DragBox = Instance.new("Frame", OpenButton)
    DragBox.Size = UDim2.new(0, 42, 1, 0)
    DragBox.BackgroundColor3 = Color3.fromRGB(22, 28, 38)
    DragBox.BorderSizePixel = 0
    ApplyCorner(DragBox, UDim.new(0, 14))

    local DragIcon = Instance.new("TextLabel", DragBox)
    DragIcon.Size = UDim2.new(1, 0, 1, 0)
    DragIcon.BackgroundTransparency = 1
    DragIcon.Text = "⠿"
    DragIcon.TextColor3 = Color3.fromRGB(200, 200, 200)
    DragIcon.TextSize = 18
    DragIcon.Font = Enum.Font.GothamBold

    local OpenText = Instance.new("TextLabel", OpenButton)
    OpenText.Size = UDim2.new(1, -50, 1, 0)
    OpenText.Position = UDim2.new(0, 50, 0, 0)
    OpenText.BackgroundTransparency = 1
    OpenText.Text = "Open Hub"
    OpenText.TextColor3 = Color3.fromRGB(255, 255, 255)
    OpenText.Font = Enum.Font.GothamBold
    OpenText.TextSize = 14
    OpenText.TextXAlignment = Enum.TextXAlignment.Left

    -- Perfect Layout Main Container (W: 780, H: 440)
    local MainContainer = Instance.new("Frame")
    MainContainer.Name = "MainContainer"
    MainContainer.Size = UDim2.new(0, 780, 0, 440)
    MainContainer.Position = UDim2.new(0.5, -390, 0.5, -220)
    MainContainer.BackgroundTransparency = 1
    MainContainer.Parent = ScreenGui

    local function makeDraggable(frame, handle)
        local dragging, dragStart, startPos
        handle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = frame.Position
            end
        end)
        handle.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end

    -- Sidebar (W: 220px)
    local Sidebar = Instance.new("Frame", MainContainer)
    Sidebar.Size = UDim2.new(0, 220, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(18, 22, 30)
    Sidebar.ClipsDescendants = true
    ApplyCorner(Sidebar, UDim.new(0, 14))
    ApplyStroke(Sidebar, Color3.fromRGB(45, 55, 70), 1.5)
    ApplyGradient(Sidebar, windowConfig.Color, 45)

    -- macOS Dots
    for i, color in ipairs({Color3.fromRGB(255, 95, 86), Color3.fromRGB(255, 189, 46), Color3.fromRGB(39, 201, 63)}) do
        local Dot = Instance.new("Frame", Sidebar)
        Dot.Size = UDim2.new(0, 11, 0, 11)
        Dot.Position = UDim2.new(0, 14 + (i - 1) * 16, 0, 16)
        Dot.BackgroundColor3 = color
        ApplyCorner(Dot, UDim.new(1, 0))
    end

    -- Hub Title
    local TitleLabel = Instance.new("TextLabel", Sidebar)
    TitleLabel.Size = UDim2.new(1, -28, 0, 28)
    TitleLabel.Position = UDim2.new(0, 14, 0, 38)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = hubTitle
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 18
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Tag Container
    local TagContainer = Instance.new("Frame", Sidebar)
    TagContainer.Name = "TagContainer"
    TagContainer.Size = UDim2.new(1, -28, 0, 24)
    TagContainer.Position = UDim2.new(0, 14, 0, 70)
    TagContainer.BackgroundTransparency = 1

    -- Tab Selection List
    local TabContainer = Instance.new("ScrollingFrame", Sidebar)
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(1, -20, 1, -195)
    TabContainer.Position = UDim2.new(0, 10, 0, 102)
    TabContainer.BackgroundTransparency = 1
    TabContainer.BorderSizePixel = 0
    TabContainer.ScrollBarThickness = 2
    local TabListLayout = Instance.new("UIListLayout", TabContainer)
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 5)

    -- Profile Card (Bottom Left)
    local ProfileCard = Instance.new("Frame", Sidebar)
    ProfileCard.Size = UDim2.new(1, -20, 0, 76)
    ProfileCard.Position = UDim2.new(0, 10, 1, -86)
    ProfileCard.BackgroundColor3 = Color3.fromRGB(12, 15, 22)
    ApplyCorner(ProfileCard, UDim.new(0, 10))
    ApplyStroke(ProfileCard, Color3.fromRGB(45, 55, 70), 1)

    local AvatarBox = Instance.new("ImageLabel", ProfileCard)
    AvatarBox.Size = UDim2.new(0, 60, 0, 60)
    AvatarBox.Position = UDim2.new(0, 8, 0, 8)
    AvatarBox.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
    AvatarBox.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420) or ""
    ApplyCorner(AvatarBox, UDim.new(1, 0))

    local ProfileDesc = Instance.new("TextLabel", ProfileCard)
    ProfileDesc.Size = UDim2.new(1, -76, 0, 24)
    ProfileDesc.Position = UDim2.new(0, 74, 0, 12)
    ProfileDesc.BackgroundTransparency = 1
    ProfileDesc.Text = LocalPlayer.DisplayName
    ProfileDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
    ProfileDesc.Font = Enum.Font.GothamBold
    ProfileDesc.TextScaled = true
    ProfileDesc.TextXAlignment = Enum.TextXAlignment.Left

    local MapButton = Instance.new("TextButton", ProfileCard)
    MapButton.Size = UDim2.new(1, -76, 0, 26)
    MapButton.Position = UDim2.new(0, 74, 0, 38)
    MapButton.BackgroundColor3 = Color3.fromRGB(24, 30, 42)
    MapButton.Text = "Loading Map..."
    MapButton.TextColor3 = Color3.fromRGB(120, 190, 255)
    MapButton.Font = Enum.Font.GothamMedium
    MapButton.TextScaled = true
    ApplyCorner(MapButton, UDim.new(0, 6))

    task.spawn(function()
        local success, placeInfo = pcall(function() return MarketplaceService:GetProductInfo(game.PlaceId) end)
        if success and placeInfo and placeInfo.Name then MapButton.Text = placeInfo.Name else MapButton.Text = "Unknown Game" end
    end)

    -- Main Content Panel (W: 550px, H: 440px - Perfectly Aligned)
    local MainContent = Instance.new("Frame", MainContainer)
    MainContent.Size = UDim2.new(0, 550, 1, 0)
    MainContent.Position = UDim2.new(0, 230, 0, 0)
    MainContent.BackgroundColor3 = Color3.fromRGB(15, 19, 26)
    MainContent.ClipsDescendants = true
    ApplyCorner(MainContent, UDim.new(0, 14))
    ApplyStroke(MainContent, Color3.fromRGB(45, 55, 70), 1.5)

    -- Window Controls (Minimize & Close)
    local MinimizeBtn = Instance.new("TextButton", MainContent)
    MinimizeBtn.Size = UDim2.new(0, 36, 0, 30)
    MinimizeBtn.Position = UDim2.new(1, -85, 0, 14)
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(25, 32, 44)
    MinimizeBtn.Text = "—"
    MinimizeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    MinimizeBtn.Font = Enum.Font.GothamBold
    ApplyCorner(MinimizeBtn, UDim.new(0, 8))

    local CloseBtn = Instance.new("TextButton", MainContent)
    CloseBtn.Size = UDim2.new(0, 36, 0, 30)
    CloseBtn.Position = UDim2.new(1, -45, 0, 14)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 45, 45)
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.Font = Enum.Font.GothamBold
    ApplyCorner(CloseBtn, UDim.new(0, 8))

    local PagesFolder = Instance.new("Folder", MainContent)
    PagesFolder.Name = "PagesFolder"

    makeDraggable(MainContainer, Sidebar)
    makeDraggable(MainContainer, MainContent)
    makeDraggable(OpenButton, OpenButton)

    local uiVisible = true
    local function toggleUI()
        uiVisible = not uiVisible
        MainContainer.Visible = uiVisible
    end

    OpenButton.MouseButton1Click:Connect(toggleUI)
    MinimizeBtn.MouseButton1Click:Connect(toggleUI)
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    local WindowObj = {}

    function WindowObj:EditOpenButton(btnConfig)
        if btnConfig.Title then OpenText.Text = btnConfig.Title end
        if btnConfig.CornerRadius then OpenBtnCorner.CornerRadius = btnConfig.CornerRadius end
    end

    function WindowObj:Tag(tagConfig)
        local TagBox = Instance.new("Frame", TagContainer)
        TagBox.Size = UDim2.new(0, 85, 0, 22)
        TagBox.BackgroundColor3 = tagConfig.Color or Color3.fromRGB(48, 255, 106)
        ApplyCorner(TagBox, UDim.new(0, tagConfig.Radius or 6))

        local TagLabel = Instance.new("TextLabel", TagBox)
        TagLabel.Size = UDim2.new(1, 0, 1, 0)
        TagLabel.BackgroundTransparency = 1
        TagLabel.Text = tagConfig.Title or "v1.0"
        TagLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        TagLabel.Font = Enum.Font.GothamBold
        TagLabel.TextSize = 11
    end

    local firstTab = true

    function WindowObj:Tab(tabConfig)
        local tabTitle = tabConfig.Title or "Tab"

        local TabBtn = Instance.new("TextButton", TabContainer)
        TabBtn.Size = UDim2.new(1, 0, 0, 34)
        TabBtn.BackgroundColor3 = Color3.fromRGB(28, 35, 48)
        TabBtn.BackgroundTransparency = 1
        TabBtn.Text = "  " .. tabTitle
        TabBtn.TextColor3 = Color3.fromRGB(170, 180, 195)
        TabBtn.Font = Enum.Font.GothamMedium
        TabBtn.TextSize, TabBtn.TextXAlignment = 13, Enum.TextXAlignment.Left
        ApplyCorner(TabBtn, UDim.new(0, 8))

        local TabPage = Instance.new("ScrollingFrame", PagesFolder)
        TabPage.Size = UDim2.new(1, -30, 1, -70)
        TabPage.Position = UDim2.new(0, 15, 0, 58)
        TabPage.BackgroundTransparency = 1
        TabPage.BorderSizePixel = 0
        TabPage.ScrollBarThickness = 3
        TabPage.Visible = false
        
        local PageLayout = Instance.new("UIListLayout", TabPage)
        PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageLayout.Padding = UDim.new(0, 8)

        TabBtn.MouseButton1Click:Connect(function()
            for _, page in pairs(PagesFolder:GetChildren()) do page.Visible = false end
            for _, btn in pairs(TabContainer:GetChildren()) do
                if btn:IsA("TextButton") then
                    TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(170, 180, 195)}):Play()
                end
            end
            TabPage.Visible = true
            TweenService:Create(TabBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0, TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        end)

        if firstTab then
            firstTab = false
            TabPage.Visible = true
            TabBtn.BackgroundTransparency = 0
            TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        end

        local TabObj = {}

        function TabObj:Button(btnConfig)
            local Btn = Instance.new("TextButton", TabPage)
            Btn.Size = UDim2.new(1, 0, 0, 38)
            Btn.BackgroundColor3 = Color3.fromRGB(22, 28, 38)
            Btn.Text = "  ▶ " .. (btnConfig.Title or "Button")
            Btn.TextColor3 = Color3.fromRGB(240, 245, 255)
            Btn.Font = Enum.Font.GothamMedium
            Btn.TextSize, Btn.TextXAlignment = 13, Enum.TextXAlignment.Left
            ApplyCorner(Btn, UDim.new(0, 8))
            ApplyStroke(Btn, Color3.fromRGB(45, 55, 70), 1)

            Btn.MouseButton1Click:Connect(function()
                if btnConfig.Callback then pcall(btnConfig.Callback) end
            end)
        end

        function TabObj:Toggle(toggleConfig)
            local state = toggleConfig.Value or false
            local ToggleFrame = Instance.new("TextButton", TabPage)
            ToggleFrame.Size = UDim2.new(1, 0, 0, 40)
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(22, 28, 38)
            ToggleFrame.Text = "  " .. (toggleConfig.Title or "Toggle")
            ToggleFrame.TextColor3 = Color3.fromRGB(240, 245, 255)
            ToggleFrame.Font = Enum.Font.GothamMedium
            ToggleFrame.TextSize, ToggleFrame.TextXAlignment = 13, Enum.TextXAlignment.Left
            ApplyCorner(ToggleFrame, UDim.new(0, 8))
            ApplyStroke(ToggleFrame, Color3.fromRGB(45, 55, 70), 1)

            local StatusIndicator = Instance.new("Frame", ToggleFrame)
            StatusIndicator.Size = UDim2.new(0, 40, 0, 20)
            StatusIndicator.Position = UDim2.new(1, -48, 0.5, -10)
            StatusIndicator.BackgroundColor3 = state and Color3.fromRGB(45, 220, 100) or Color3.fromRGB(70, 80, 95)
            ApplyCorner(StatusIndicator, UDim.new(1, 0))

            ToggleFrame.MouseButton1Click:Connect(function()
                state = not state
                StatusIndicator.BackgroundColor3 = state and Color3.fromRGB(45, 220, 100) or Color3.fromRGB(70, 80, 95)
                if toggleConfig.Callback then pcall(toggleConfig.Callback, state) end
            end)
        end

        return TabObj
    end

    return WindowObj
end

return AutoSyncUI
