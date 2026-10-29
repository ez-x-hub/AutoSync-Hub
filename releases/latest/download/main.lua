-- AutoSyncUI Library Framework
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("AutoSyncUI_Lib") then
    CoreGui.AutoSyncUI_Lib:Destroy()
end

local AutoSyncUI = {}

function AutoSyncUI:CreateWindow(config)
    local hubTitle = config.Title or "AutoSyncUI"
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AutoSyncUI_Lib"
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Toggle Button (ปุ่มเปิด-ปิด UI หน้าจอ)
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Name = "ToggleButton"
    ToggleBtn.Size = UDim2.new(0, 110, 0, 40)
    ToggleBtn.Position = UDim2.new(0.02, 0, 0.05, 0)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleBtn.Text = "⚡ Toggle UI"
    ToggleBtn.Font = Enum.Font.GothamBold
    ToggleBtn.TextSize = 14
    ToggleBtn.Parent = ScreenGui

    Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 10)
    local ToggleStroke = Instance.new("UIStroke", ToggleBtn)
    ToggleStroke.Color = Color3.fromRGB(255, 50, 80)
    ToggleStroke.Thickness = 2

    -- Main Container
    local MainContainer = Instance.new("Frame")
    MainContainer.Name = "MainContainer"
    MainContainer.Size = UDim2.new(0, 780, 0, 420)
    MainContainer.Position = UDim2.new(0.5, -390, 0.5, -210)
    MainContainer.BackgroundTransparency = 1
    MainContainer.Parent = ScreenGui

    -- Draggable Function
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
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)
    end

    -- Left Sidebar Panel
    local Sidebar = Instance.new("Frame")
    Sidebar.Name = "Sidebar"
    Sidebar.Size = UDim2.new(0, 210, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Sidebar.ClipsDescendants = true
    Sidebar.Parent = MainContainer
    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 14)
    local SideStroke = Instance.new("UIStroke", Sidebar)
    SideStroke.Color = Color3.fromRGB(40, 40, 50)
    SideStroke.Thickness = 2

    local SideGradient = Instance.new("UIGradient", Sidebar)
    SideGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0.0, Color3.fromRGB(220, 20, 60)),
        ColorSequenceKeypoint.new(0.4, Color3.fromRGB(15, 15, 35)),
        ColorSequenceKeypoint.new(1.0, Color3.fromRGB(10, 10, 120))
    })
    SideGradient.Rotation = 45

    -- macOS Dots
    for i, color in ipairs({Color3.fromRGB(255, 95, 86), Color3.fromRGB(255, 189, 46), Color3.fromRGB(39, 201, 63)}) do
        local Dot = Instance.new("Frame", Sidebar)
        Dot.Size = UDim2.new(0, 10, 0, 10)
        Dot.Position = UDim2.new(0, 14 + (i - 1) * 16, 0, 16)
        Dot.BackgroundColor3 = color
        Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)
    end

    local HubTitle = Instance.new("TextLabel", Sidebar)
    HubTitle.Size = UDim2.new(1, -24, 0, 30)
    HubTitle.Position = UDim2.new(0, 14, 0, 35)
    HubTitle.BackgroundTransparency = 1
    HubTitle.Text = hubTitle
    HubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    HubTitle.TextSize = 18
    HubTitle.Font = Enum.Font.GothamBold
    HubTitle.TextXAlignment = Enum.TextXAlignment.Left

    local SideLine = Instance.new("Frame", Sidebar)
    SideLine.Size = UDim2.new(1, -28, 0, 1)
    SideLine.Position = UDim2.new(0, 14, 0, 72)
    SideLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SideLine.BackgroundTransparency = 0.7
    SideLine.BorderSizePixel = 0

    -- Tab Container (Scrolling)
    local TabContainer = Instance.new("ScrollingFrame", Sidebar)
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(1, -20, 1, -180)
    TabContainer.Position = UDim2.new(0, 10, 0, 80)
    TabContainer.BackgroundTransparency = 1
    TabContainer.BorderSizePixel = 0
    TabContainer.ScrollBarThickness = 2
    local TabListLayout = Instance.new("UIListLayout", TabContainer)
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 6)

    -- Profile Card
    local ProfileCard = Instance.new("Frame", Sidebar)
    ProfileCard.Size = UDim2.new(1, -20, 0, 80)
    ProfileCard.Position = UDim2.new(0, 10, 1, -90)
    ProfileCard.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ProfileCard.BackgroundTransparency = 0.5
    Instance.new("UICorner", ProfileCard).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", ProfileCard).Color = Color3.fromRGB(255, 255, 255)

    local AvatarBox = Instance.new("ImageLabel", ProfileCard)
    AvatarBox.Size = UDim2.new(0, 64, 0, 64)
    AvatarBox.Position = UDim2.new(0, 8, 0, 8)
    AvatarBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    AvatarBox.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420) or ""
    Instance.new("UICorner", AvatarBox).CornerRadius = UDim.new(1, 0)
    Instance.new("UIStroke", AvatarBox).Thickness = 1.5

    local ProfileDesc = Instance.new("TextLabel", ProfileCard)
    ProfileDesc.Size = UDim2.new(1, -82, 0, 28)
    ProfileDesc.Position = UDim2.new(0, 78, 0, 10)
    ProfileDesc.BackgroundTransparency = 1
    ProfileDesc.Text = LocalPlayer.DisplayName
    ProfileDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
    ProfileDesc.Font = Enum.Font.GothamBold
    ProfileDesc.TextScaled = true
    ProfileDesc.TextXAlignment = Enum.TextXAlignment.Left
    local DescConstraint = Instance.new("UITextSizeConstraint", ProfileDesc)
    DescConstraint.MaxTextSize = 14
    DescConstraint.MinTextSize = 8

    local MapButton = Instance.new("TextButton", ProfileCard)
    MapButton.Size = UDim2.new(1, -82, 0, 30)
    MapButton.Position = UDim2.new(0, 78, 0, 42)
    MapButton.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    MapButton.Text = "Loading Map..."
    MapButton.TextColor3 = Color3.fromRGB(150, 200, 255)
    MapButton.Font = Enum.Font.GothamMedium
    MapButton.TextScaled = true
    Instance.new("UICorner", MapButton).CornerRadius = UDim.new(0, 6)
    local MapConstraint = Instance.new("UITextSizeConstraint", MapButton)
    MapConstraint.MaxTextSize = 12
    MapConstraint.MinTextSize = 7

    task.spawn(function()
        local success, placeInfo = pcall(function() return MarketplaceService:GetProductInfo(game.PlaceId) end)
        if success and placeInfo and placeInfo.Name then MapButton.Text = placeInfo.Name else MapButton.Text = "Unknown Game" end
    end)

    -- Right Main Content Panel
    local MainContent = Instance.new("Frame", MainContainer)
    MainContent.Size = UDim2.new(1, -225, 1, 0)
    MainContent.Position = UDim2.new(0, 225, 0, 0)
    MainContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainContent.ClipsDescendants = true
    Instance.new("UICorner", MainContent).CornerRadius = UDim.new(0, 14)
    Instance.new("UIStroke", MainContent).Thickness = 2

    local MainGradient = Instance.new("UIGradient", MainContent)
    MainGradient.Color = SideGradient.Color
    MainGradient.Rotation = 45

    local TopLine = Instance.new("Frame", MainContent)
    TopLine.Size = UDim2.new(1, -30, 0, 1)
    TopLine.Position = UDim2.new(0, 15, 0, 72)
    TopLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopLine.BackgroundTransparency = 0.7
    TopLine.BorderSizePixel = 0

    local MinimizeBtn = Instance.new("TextButton", MainContent)
    MinimizeBtn.Size = UDim2.new(0, 40, 0, 32)
    MinimizeBtn.Position = UDim2.new(1, -100, 0, 20)
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    MinimizeBtn.Text = "—"
    MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeBtn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0, 8)

    local CloseBtn = Instance.new("TextButton", MainContent)
    CloseBtn.Size = UDim2.new(0, 40, 0, 32)
    CloseBtn.Position = UDim2.new(1, -52, 0, 20)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)

    local PagesFolder = Instance.new("Folder", MainContent)
    PagesFolder.Name = "PagesFolder"

    makeDraggable(MainContainer, Sidebar)
    makeDraggable(MainContainer, MainContent)

    local uiVisible = true
    local function toggleUI()
        uiVisible = not uiVisible
        MainContainer.Visible = uiVisible
    end
    ToggleBtn.MouseButton1Click:Connect(toggleUI)
    MinimizeBtn.MouseButton1Click:Connect(toggleUI)
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
    UserInputService.InputBegan:Connect(function(input, gpe)
        if not gpe and (input.KeyCode == Enum.KeyCode.RightControl or input.KeyCode == Enum.KeyCode.Insert) then toggleUI() end
    end)

    local WindowObj = {}
    local firstTab = true

    function WindowObj:Tab(config)
        local tabTitle = config.Title or "Tab"
        
        local TabBtn = Instance.new("TextButton", TabContainer)
        TabBtn.Size = UDim2.new(1, 0, 0, 34)
        TabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        TabBtn.BackgroundTransparency = 0.6
        TabBtn.Text = "  " .. tabTitle
        TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabBtn.Font = Enum.Font.GothamMedium
        TabBtn.TextSize, TabBtn.TextXAlignment = 13, Enum.TextXAlignment.Left
        Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 8)

        local TabPage = Instance.new("ScrollingFrame", PagesFolder)
        TabPage.Size = UDim2.new(1, -30, 1, -90)
        TabPage.Position = UDim2.new(0, 15, 0, 80)
        TabPage.BackgroundTransparency = 1
        TabPage.BorderSizePixel = 0
        TabPage.ScrollBarThickness = 4
        TabPage.Visible = false
        local PageLayout = Instance.new("UIListLayout", TabPage)
        PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageLayout.Padding = UDim.new(0, 8)

        TabBtn.MouseButton1Click:Connect(function()
            for _, page in pairs(PagesFolder:GetChildren()) do page.Visible = false end
            for _, btn in pairs(TabContainer:GetChildren()) do
                if btn:IsA("TextButton") then
                    TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundTransparency = 0.6, TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
                end
            end
            TabPage.Visible = true
            TweenService:Create(TabBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0.1, TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        end)

        if firstTab then
            firstTab = false
            TabPage.Visible = true
            TabBtn.BackgroundTransparency = 0.1
            TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        end

        local TabObj = {}

        function TabObj:Button(btnConfig)
            local Btn = Instance.new("TextButton", TabPage)
            Btn.Size = UDim2.new(1, 0, 0, 36)
            Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
            Btn.Text = "  ▶ " .. (btnConfig.Title or "Button")
            Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            Btn.Font = Enum.Font.GothamMedium
            Btn.TextSize, Btn.TextXAlignment = 13, Enum.TextXAlignment.Left
            Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)

            Btn.MouseButton1Click:Connect(function()
                if btnConfig.Callback then pcall(btnConfig.Callback) end
            end)
        end

        function TabObj:Toggle(toggleConfig)
            local state = toggleConfig.Value or false
            local ToggleFrame = Instance.new("TextButton", TabPage)
            ToggleFrame.Size = UDim2.new(1, 0, 0, 38)
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
            ToggleFrame.Text = "  " .. (toggleConfig.Title or "Toggle")
            ToggleFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleFrame.Font = Enum.Font.GothamMedium
            ToggleFrame.TextSize, ToggleFrame.TextXAlignment = 13, Enum.TextXAlignment.Left
            Instance.new("UICorner", ToggleFrame).CornerRadius = UDim.new(0, 8)

            local StatusIndicator = Instance.new("Frame", ToggleFrame)
            StatusIndicator.Size = UDim2.new(0, 40, 0, 20)
            StatusIndicator.Position = UDim2.new(1, -48, 0.5, -10)
            StatusIndicator.BackgroundColor3 = state and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(100, 100, 100)
            Instance.new("UICorner", StatusIndicator).CornerRadius = UDim.new(1, 0)

            ToggleFrame.MouseButton1Click:Connect(function()
                state = not state
                StatusIndicator.BackgroundColor3 = state and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(100, 100, 100)
                if toggleConfig.Callback then pcall(toggleConfig.Callback, state) end
            end)
        end

        return TabObj
    end

    return WindowObj
end

return AutoSyncUI
