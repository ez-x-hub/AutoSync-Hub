-- AutoSyncUI Framework (Perfect WindUI Replica Edition)
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("AutoSyncUI_Engine") then
    CoreGui.AutoSyncUI_Engine:Destroy()
end

local AutoSyncUI = {}

function AutoSyncUI:Notify(config)
    print(string.format("[AutoSyncUI Notify] [%s]: %s", config.Title or "Notification", config.Content or ""))
end

function AutoSyncUI:CreateWindow(windowConfig)
    local hubTitle = windowConfig.Title or "AutoSyncUI Hub"

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AutoSyncUI_Engine"
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- ========================================================
    -- [อัปเกรด] ปุ่มเปิด-ปิด UI แบบมีไอคอนแยกฝั่งซ้าย-ขวา สไตล์ WindUI เป๊ะๆ
    -- ========================================================
    local OpenButton = Instance.new("TextButton")
    OpenButton.Name = "OpenButton"
    OpenButton.Size = UDim2.new(0, 190, 0, 44)
    OpenButton.Position = UDim2.new(0.02, 0, 0.05, 0)
    OpenButton.BackgroundColor3 = Color3.fromRGB(18, 22, 30)
    OpenButton.Text = ""
    OpenButton.AutoButtonColor = false
    OpenButton.Parent = ScreenGui

    local OpenBtnCorner = Instance.new("UICorner", OpenButton)
    OpenBtnCorner.CornerRadius = UDim.new(0, 14)

    local OpenBtnStroke = Instance.new("UIStroke", OpenButton)
    OpenBtnStroke.Thickness = 2
    OpenBtnStroke.Color = Color3.fromRGB(255, 50, 100)

    if windowConfig.Color then
        local Gradient = Instance.new("UIGradient", OpenBtnStroke)
        Gradient.Color = windowConfig.Color
    end

    -- ฝั่งซ้ายของปุ่ม (Drag Icon)
    local DragIconBox = Instance.new("Frame", OpenButton)
    DragIconBox.Size = UDim2.new(0, 44, 1, 0)
    DragIconBox.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
    DragIconBox.BorderSizePixel = 0
    Instance.new("UICorner", DragIconBox).CornerRadius = UDim.new(0, 14)

    local DragLabel = Instance.new("TextLabel", DragIconBox)
    DragLabel.Size = UDim2.new(1, 0, 1, 0)
    DragLabel.BackgroundTransparency = 1
    DragLabel.Text = "⠿"
    DragLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    DragLabel.TextSize = 18
    DragLabel.Font = Enum.Font.GothamBold

    -- ฝั่งขวาของปุ่ม (Text Title)
    local OpenTextLabel = Instance.new("TextLabel", OpenButton)
    OpenTextLabel.Size = UDim2.new(1, -50, 1, 0)
    OpenTextLabel.Position = UDim2.new(0, 50, 0, 0)
    OpenTextLabel.BackgroundTransparency = 1
    OpenTextLabel.Text = "Open Hub"
    OpenTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    OpenTextLabel.Font = Enum.Font.GothamBold
    OpenTextLabel.TextSize = 14
    OpenTextLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- ========================================================
    -- Main Container Window
    local MainContainer = Instance.new("Frame")
    MainContainer.Name = "MainContainer"
    MainContainer.Size = UDim2.new(0, 780, 0, 420)
    MainContainer.Position = UDim2.new(0.5, -390, 0.5, -210)
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

    -- Sidebar (จัดระเบียบโครงสร้างใหม่ทั้งหมดให้เป๊ะ)
    local Sidebar = Instance.new("Frame", MainContainer)
    Sidebar.Size = UDim2.new(0, 210, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Sidebar.ClipsDescendants = true
    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 14)
    
    local SideStroke = Instance.new("UIStroke", Sidebar)
    SideStroke.Color = Color3.fromRGB(40, 40, 50)
    SideStroke.Thickness = 2

    local SideGradient = Instance.new("UIGradient", Sidebar)
    SideGradient.Color = windowConfig.Color or ColorSequence.new({
        ColorSequenceKeypoint.new(0.0, Color3.fromRGB(220, 20, 60)),
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

    -- Hub Title
    local HubTitle = Instance.new("TextLabel", Sidebar)
    HubTitle.Name = "HubTitle"
    HubTitle.Size = UDim2.new(1, -28, 0, 25)
    HubTitle.Position = UDim2.new(0, 14, 0, 36)
    HubTitle.BackgroundTransparency = 1
    HubTitle.Text = hubTitle
    HubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    HubTitle.TextSize = 17
    HubTitle.Font = Enum.Font.GothamBold
    HubTitle.TextXAlignment = Enum.TextXAlignment.Left

    -- Tag Container (จัดตำแหน่งให้อยู่ใต้ Title พอดีเป๊ะ ไม่ทับซ้อน)
    local TagContainer = Instance.new("Frame", Sidebar)
    TagContainer.Name = "TagContainer"
    TagContainer.Size = UDim2.new(1, -28, 0, 22)
    TagContainer.Position = UDim2.new(0, 14, 0, 65)
    TagContainer.BackgroundTransparency = 1

    -- Tab Container (ขยับลงมาเว้นพื้นที่ให้ Tag เรียบร้อย)
    local TabContainer = Instance.new("ScrollingFrame", Sidebar)
    TabContainer.Name = "TabContainer"
    TabContainer.Size = UDim2.new(1, -20, 1, -195)
    TabContainer.Position = UDim2.new(0, 10, 0, 95)
    TabContainer.BackgroundTransparency = 1
    TabContainer.BorderSizePixel = 0
    TabContainer.ScrollBarThickness = 2
    local TabListLayout = Instance.new("UIListLayout", TabContainer)
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 6)

    -- Profile Card (จัดวางไอคอนและชื่อให้อยู่กึ่งกลางสวยงาม)
    local ProfileCard = Instance.new("Frame", Sidebar)
    ProfileCard.Name = "ProfileCard"
    ProfileCard.Size = UDim2.new(1, -20, 0, 75)
    ProfileCard.Position = UDim2.new(0, 10, 1, -85)
    ProfileCard.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ProfileCard.BackgroundTransparency = 0.5
    Instance.new("UICorner", ProfileCard).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", ProfileCard).Color = Color3.fromRGB(255, 255, 255)

    local AvatarBox = Instance.new("ImageLabel", ProfileCard)
    AvatarBox.Size = UDim2.new(0, 58, 0, 58)
    AvatarBox.Position = UDim2.new(0, 8, 0, 8)
    AvatarBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    AvatarBox.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420) or ""
    Instance.new("UICorner", AvatarBox).CornerRadius = UDim.new(1, 0)

    local ProfileDesc = Instance.new("TextLabel", ProfileCard)
    ProfileDesc.Size = UDim2.new(1, -74, 0, 24)
    ProfileDesc.Position = UDim2.new(0, 72, 0, 10)
    ProfileDesc.BackgroundTransparency = 1
    ProfileDesc.Text = LocalPlayer.DisplayName
    ProfileDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
    ProfileDesc.Font = Enum.Font.GothamBold
    ProfileDesc.TextScaled = true
    ProfileDesc.TextXAlignment = Enum.TextXAlignment.Left

    local MapButton = Instance.new("TextButton", ProfileCard)
    MapButton.Size = UDim2.new(1, -74, 0, 26)
    MapButton.Position = UDim2.new(0, 72, 0, 38)
    MapButton.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    MapButton.Text = "Loading Map..."
    MapButton.TextColor3 = Color3.fromRGB(150, 200, 255)
    MapButton.Font = Enum.Font.GothamMedium
    MapButton.TextScaled = true
    Instance.new("UICorner", MapButton).CornerRadius = UDim.new(0, 6)

    task.spawn(function()
        local success, placeInfo = pcall(function() return MarketplaceService:GetProductInfo(game.PlaceId) end)
        if success and placeInfo and placeInfo.Name then MapButton.Text = placeInfo.Name else MapButton.Text = "Unknown Game" end
    end)

    -- Main Content Area
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

    local MinimizeBtn = Instance.new("TextButton", MainContent)
    MinimizeBtn.Size = UDim2.new(0, 38, 0, 30)
    MinimizeBtn.Position = UDim2.new(1, -95, 0, 16)
    MinimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    MinimizeBtn.Text = "—"
    MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeBtn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0, 8)

    local CloseBtn = Instance.new("TextButton", MainContent)
    CloseBtn.Size = UDim2.new(0, 38, 0, 30)
    CloseBtn.Position = UDim2.new(1, -50, 0, 16)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 15
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
    local toggleKey = Enum.KeyCode.RightControl

    function WindowObj:EditOpenButton(btnConfig)
        if btnConfig.Title then OpenTextLabel.Text = btnConfig.Title end
        if btnConfig.CornerRadius then OpenBtnCorner.CornerRadius = btnConfig.CornerRadius end
        if btnConfig.StrokeThickness then OpenBtnStroke.Thickness = btnConfig.StrokeThickness end
    end

    function WindowObj:Tag(tagConfig)
        local TagBox = Instance.new("Frame", TagContainer)
        TagBox.Size = UDim2.new(0, 85, 0, 20)
        TagBox.BackgroundColor3 = tagConfig.Color or Color3.fromRGB(48, 255, 106)
        Instance.new("UICorner", TagBox).CornerRadius = UDim.new(0, tagConfig.Radius or 6)

        local TagLabel = Instance.new("TextLabel", TagBox)
        TagLabel.Size = UDim2.new(1, 0, 1, 0)
        TagLabel.BackgroundTransparency = 1
        TagLabel.Text = tagConfig.Title or "Tag"
        TagLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
        TagLabel.Font = Enum.Font.GothamBold
        TagLabel.TextSize = 11
    end

    function WindowObj:SetToggleKey(keyCode)
        toggleKey = keyCode
    end

    function WindowObj:Divider()
        local Div = Instance.new("Frame", TabContainer)
        Div.Size = UDim2.new(1, 0, 0, 1)
        Div.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Div.BackgroundTransparency = 0.8
    end

    local firstTab = true

    function WindowObj:Tab(tabConfig)
        local tabTitle = tabConfig.Title or "Tab"

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
        TabPage.Size = UDim2.new(1, -30, 1, -80)
        TabPage.Position = UDim2.new(0, 15, 0, 70)
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
