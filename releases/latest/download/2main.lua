-- ==============================================================================
-- AutoSyncUI Framework (Fixed Layout & Perfectly Aligned Edition)
-- ==============================================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("AutoSyncUI_EnterpriseEngine") then
    CoreGui.AutoSyncUI_EnterpriseEngine:Destroy()
end

local AutoSyncUI = {}

function AutoSyncUI:Notify(config)
    print(string.format("[AutoSyncUI Notify] [%s]: %s", config.Title or "Notification", config.Content or ""))
end

function AutoSyncUI:CreateWindow(windowConfig)
    local hubTitle = windowConfig.Title or "AutoSyncUI Hub"
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AutoSyncUI_EnterpriseEngine"
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Open Button
    local OpenButton = Instance.new("TextButton")
    OpenButton.Name = "OpenButton"
    OpenButton.Size = UDim2.new(0, 190, 0, 46)
    OpenButton.Position = UDim2.new(0.02, 0, 0.05, 0)
    OpenButton.BackgroundColor3 = Color3.fromRGB(14, 18, 25)
    OpenButton.Text = ""
    OpenButton.AutoButtonColor = false
    OpenButton.Parent = ScreenGui

    local corner = Instance.new("UICorner", OpenButton)
    corner.CornerRadius = UDim.new(0, 14)
    local stroke = Instance.new("UIStroke", OpenButton)
    stroke.Color = Color3.fromRGB(255, 60, 120)
    stroke.Thickness = 2

    local DragBox = Instance.new("Frame", OpenButton)
    DragBox.Size = UDim2.new(0, 42, 1, 0)
    DragBox.BackgroundColor3 = Color3.fromRGB(22, 28, 38)
    DragBox.BorderSizePixel = 0
    Instance.new("UICorner", DragBox).CornerRadius = UDim.new(0, 14)

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

    -- Main Container (ขนาดรวม W: 740, H: 420 พอดีจอ ไม่ล้น)
    local MainContainer = Instance.new("Frame")
    MainContainer.Name = "MainContainer"
    MainContainer.Size = UDim2.new(0, 740, 0, 420)
    MainContainer.Position = UDim2.new(0.5, -370, 0.5, -210)
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

    -- Sidebar (ฝั่งซ้าย W: 200px)
    local Sidebar = Instance.new("Frame", MainContainer)
    Sidebar.Size = UDim2.new(0, 200, 1, 0)
    Sidebar.Position = UDim2.new(0, 0, 0, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(18, 22, 30)
    Sidebar.ClipsDescendants = true
    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 14)
    local SideStroke = Instance.new("UIStroke", Sidebar)
    SideStroke.Color = Color3.fromRGB(45, 55, 70)
    SideStroke.Thickness = 1.5

    -- macOS Dots
    for i, color in ipairs({Color3.fromRGB(255, 95, 86), Color3.fromRGB(255, 189, 46), Color3.fromRGB(39, 201, 63)}) do
        local Dot = Instance.new("Frame", Sidebar)
        Dot.Size = UDim2.new(0, 10, 0, 10)
        Dot.Position = UDim2.new(0, 12 + (i - 1) * 15, 0, 14)
        Dot.BackgroundColor3 = color
        Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)
    end

    -- Hub Title
    local TitleLabel = Instance.new("TextLabel", Sidebar)
    TitleLabel.Size = UDim2.new(1, -24, 0, 24)
    TitleLabel.Position = UDim2.new(0, 12, 0, 34)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = hubTitle
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 16
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Tag Container
    local TagContainer = Instance.new("Frame", Sidebar)
    TagContainer.Name = "TagContainer"
    TagContainer.Size = UDim2.new(1, -24, 0, 22)
    TagContainer.Position = UDim2.new(0, 12, 0, 62)
    TagContainer.BackgroundTransparency = 1

    -- Tab Selection List
    local TabContainer = Instance.new("ScrollingFrame", Sidebar)
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(1, -16, 1, -180)
    TabContainer.Position = UDim2.new(0, 8, 0, 92)
    TabContainer.BackgroundTransparency = 1
    TabContainer.BorderSizePixel = 0
    TabContainer.ScrollBarThickness = 2
    local TabListLayout = Instance.new("UIListLayout", TabContainer)
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 4)

    -- Profile Card (Bottom Left)
    local ProfileCard = Instance.new("Frame", Sidebar)
    ProfileCard.Size = UDim2.new(1, -16, 0, 72)
    ProfileCard.Position = UDim2.new(0, 8, 1, -80)
    ProfileCard.BackgroundColor3 = Color3.fromRGB(12, 15, 22)
    Instance.new("UICorner", ProfileCard).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", ProfileCard).Color = Color3.fromRGB(45, 55, 70)

    local AvatarBox = Instance.new("ImageLabel", ProfileCard)
    AvatarBox.Size = UDim2.new(0, 52, 0, 52)
    AvatarBox.Position = UDim2.new(0, 10, 0, 10)
    AvatarBox.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
    AvatarBox.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420) or ""
    Instance.new("UICorner", AvatarBox).CornerRadius = UDim.new(1, 0)

    local ProfileDesc = Instance.new("TextLabel", ProfileCard)
    ProfileDesc.Size = UDim2.new(1, -68, 0, 22)
    ProfileDesc.Position = UDim2.new(0, 66, 0, 12)
    ProfileDesc.BackgroundTransparency = 1
    ProfileDesc.Text = LocalPlayer.DisplayName
    ProfileDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
    ProfileDesc.Font = Enum.Font.GothamBold
    ProfileDesc.TextScaled = true
    ProfileDesc.TextXAlignment = Enum.TextXAlignment.Left

    local MapButton = Instance.new("TextButton", ProfileCard)
    MapButton.Size = UDim2.new(1, -68, 0, 22)
    MapButton.Position = UDim2.new(0, 66, 0, 38)
    MapButton.BackgroundColor3 = Color3.fromRGB(24, 30, 42)
    MapButton.Text = "Loading Map..."
    MapButton.TextColor3 = Color3.fromRGB(120, 190, 255)
    MapButton.Font = Enum.Font.GothamMedium
    MapButton.TextScaled = true
    Instance.new("UICorner", MapButton).CornerRadius = UDim.new(0, 6)

    task.spawn(function()
        local success, placeInfo = pcall(function() return MarketplaceService:GetProductInfo(game.PlaceId) end)
        if success and placeInfo and placeInfo.Name then MapButton.Text = placeInfo.Name else MapButton.Text = "Unknown Game" end
    end)

    -- Main Content Panel (ฝั่งขวา W: 530px วางต่อจาก Sidebar พอดีเป๊ะ ไม่ทับซ้อน)
    local MainContent = Instance.new("Frame", MainContainer)
    MainContent.Size = UDim2.new(0, 530, 1, 0)
    MainContent.Position = UDim2.new(0, 210, 0, 0)
    MainContent.BackgroundColor3 = Color3.fromRGB(15, 19, 26)
    MainContent.ClipsDescendants = true
    Instance.new("UICorner", MainContent).CornerRadius = UDim.new(0, 14)
    local MainStroke = Instance.new("UIStroke", MainContent)
    MainStroke.Color = Color3.fromRGB(45, 55, 70)
    MainStroke.Thickness = 1.5

    -- Window Controls
    local MinimizeBtn = Instance.new("TextButton", MainContent)
    MinimizeBtn.Size = UDim2.new(0, 34, 0, 28)
    MinimizeBtn.Position = UDim2.new(1, -80, 0, 12)
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(25, 32, 44)
    MinimizeBtn.Text = "—"
    MinimizeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    MinimizeBtn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0, 8)

    local CloseBtn = Instance.new("TextButton", MainContent)
    CloseBtn.Size = UDim2.new(0, 34, 0, 28)
    CloseBtn.Position = UDim2.new(1, -42, 0, 12)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 45, 45)
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)

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
        if btnConfig.CornerRadius then corner.CornerRadius = btnConfig.CornerRadius end
    end

    function WindowObj:Tag(tagConfig)
        local TagBox = Instance.new("Frame", TagContainer)
        TagBox.Size = UDim2.new(0, 80, 0, 20)
        TagBox.BackgroundColor3 = tagConfig.Color or Color3.fromRGB(48, 255, 106)
        Instance.new("UICorner", TagBox).CornerRadius = UDim.new(0, tagConfig.Radius or 6)

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
        TabBtn.Size = UDim2.new(1, 0, 0, 32)
        TabBtn.BackgroundColor3 = Color3.fromRGB(28, 35, 48)
        TabBtn.BackgroundTransparency = 1
        TabBtn.Text = "  " .. tabTitle
        TabBtn.TextColor3 = Color3.fromRGB(170, 180, 195)
        TabBtn.Font = Enum.Font.GothamMedium
        TabBtn.TextSize, TabBtn.TextXAlignment = 12, Enum.TextXAlignment.Left
        Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 8)

        local TabPage = Instance.new("ScrollingFrame", PagesFolder)
        TabPage.Size = UDim2.new(1, -30, 1, -65)
        TabPage.Position = UDim2.new(0, 15, 0, 52)
        TabPage.BackgroundTransparency = 1
        TabPage.BorderSizePixel = 0
        TabPage.ScrollBarThickness = 3
        TabPage.Visible = false
        
        local PageLayout = Instance.new("UIListLayout", TabPage)
        PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageLayout.Padding = UDim.new(0, 6)

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
            Btn.Size = UDim2.new(1, 0, 0, 36)
            Btn.BackgroundColor3 = Color3.fromRGB(22, 28, 38)
            Btn.Text = "  ▶ " .. (btnConfig.Title or "Button")
            Btn.TextColor3 = Color3.fromRGB(240, 245, 255)
            Btn.Font = Enum.Font.GothamMedium
            Btn.TextSize, Btn.TextXAlignment = 12, Enum.TextXAlignment.Left
            Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)
            Instance.new("UIStroke", Btn).Color = Color3.fromRGB(45, 55, 70)

            Btn.MouseButton1Click:Connect(function()
                if btnConfig.Callback then pcall(btnConfig.Callback) end
            end)
        end

        function TabObj:Toggle(toggleConfig)
            local state = toggleConfig.Value or false
            local ToggleFrame = Instance.new("TextButton", TabPage)
            ToggleFrame.Size = UDim2.new(1, 0, 0, 38)
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(22, 28, 38)
            ToggleFrame.Text = "  " .. (toggleConfig.Title or "Toggle")
            ToggleFrame.TextColor3 = Color3.fromRGB(240, 245, 255)
            ToggleFrame.Font = Enum.Font.GothamMedium
            ToggleFrame.TextSize, ToggleFrame.TextXAlignment = 12, Enum.TextXAlignment.Left
            Instance.new("UICorner", ToggleFrame).CornerRadius = UDim.new(0, 8)
            Instance.new("UIStroke", ToggleFrame).Color = Color3.fromRGB(45, 55, 70)

            local StatusIndicator = Instance.new("Frame", ToggleFrame)
            StatusIndicator.Size = UDim2.new(0, 38, 0, 18)
            StatusIndicator.Position = UDim2.new(1, -46, 0.5, -9)
            StatusIndicator.BackgroundColor3 = state and Color3.fromRGB(45, 220, 100) or Color3.fromRGB(70, 80, 95)
            Instance.new("UICorner", StatusIndicator).CornerRadius = UDim.new(1, 0)

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
